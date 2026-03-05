#!/bin/bash
# Kling 3.0 Single-Shot Pipeline via KIE.ai
# Usage: ./kling-single-shot.sh <image_path> <prompt> [duration] [mode]
#
# Requires: KIE_API_KEY environment variable
# Example:
#   export KIE_API_KEY="your-key-here"
#   ./kling-single-shot.sh scene1.png "Curtains billow as character looks worried. Slow push-in." 5 pro

set -euo pipefail

IMAGE_PATH="${1:?Usage: $0 <image_path> <prompt> [duration] [mode]}"
PROMPT="${2:?Usage: $0 <image_path> <prompt> [duration] [mode]}"
DURATION="${3:-5}"
MODE="${4:-pro}"
KIE_API_KEY="${KIE_API_KEY:?Set KIE_API_KEY environment variable}"

BASENAME=$(basename "$IMAGE_PATH" | sed 's/\.[^.]*$//')
OUTPUT_DIR=$(dirname "$IMAGE_PATH")

echo "📤 Uploading image..."
UPLOAD_RESP=$(curl -s -X POST "https://kieai.redpandaai.co/api/file-stream-upload" \
  -H "Authorization: Bearer $KIE_API_KEY" \
  -F "file=@$IMAGE_PATH" \
  -F "uploadPath=kling-jobs" \
  -F "fileName=$BASENAME.png")

IMAGE_URL=$(echo "$UPLOAD_RESP" | python3 -c "import sys,json; print(json.load(sys.stdin)['data']['downloadUrl'])")
echo "✅ Uploaded: $IMAGE_URL"

echo "🎬 Creating Kling 3.0 task ($MODE, ${DURATION}s)..."
TASK_RESP=$(curl -s -X POST "https://api.kie.ai/api/v1/jobs/createTask" \
  -H "Authorization: Bearer $KIE_API_KEY" \
  -H "Content-Type: application/json" \
  -d "{
  \"model\": \"kling-3.0/video\",
  \"input\": {
    \"prompt\": \"$PROMPT\",
    \"image_urls\": [\"$IMAGE_URL\"],
    \"sound\": true,
    \"duration\": \"$DURATION\",
    \"aspect_ratio\": \"9:16\",
    \"mode\": \"$MODE\",
    \"multi_shots\": false
  }
}")

TASK_ID=$(echo "$TASK_RESP" | python3 -c "import sys,json; print(json.load(sys.stdin)['data']['taskId'])")
echo "⏳ Task: $TASK_ID — polling..."

# Poll with exponential backoff
WAIT=30
for i in $(seq 1 20); do
  sleep $WAIT
  STATUS_RESP=$(curl -s "https://api.kie.ai/api/v1/jobs/recordInfo?taskId=$TASK_ID" \
    -H "Authorization: Bearer $KIE_API_KEY" 2>/dev/null || echo '{"data":{"state":"error"}}')
  STATE=$(echo "$STATUS_RESP" | python3 -c "import sys,json; print(json.load(sys.stdin)['data']['state'])" 2>/dev/null || echo "error")
  
  echo "  Check $i (${WAIT}s wait): $STATE"
  
  if [ "$STATE" = "success" ]; then
    VIDEO_URL=$(echo "$STATUS_RESP" | python3 -c "import sys,json; print(json.loads(json.load(sys.stdin)['data']['resultJson'])['resultUrls'][0])")
    OUTPUT="$OUTPUT_DIR/${BASENAME}-kling3.mp4"
    curl -sL -o "$OUTPUT" "$VIDEO_URL"
    echo "✅ Downloaded: $OUTPUT"
    ffprobe -v quiet -print_format json -show_format -show_streams "$OUTPUT" 2>/dev/null | \
      python3 -c "import sys,json; d=json.load(sys.stdin); v=next(s for s in d['streams'] if s['codec_type']=='video'); print(f'  {v[\"width\"]}x{v[\"height\"]}, {d[\"format\"][\"duration\"]}s, {int(d[\"format\"][\"size\"])/1024/1024:.1f}MB')"
    exit 0
  elif [ "$STATE" = "fail" ]; then
    echo "❌ FAILED!"
    echo "$STATUS_RESP" | python3 -m json.tool
    exit 1
  fi
  
  # Increase wait time (cap at 120s)
  WAIT=$((WAIT < 120 ? WAIT + 30 : 120))
done

echo "⏰ Timeout after 20 checks. Task may still be processing: $TASK_ID"
exit 2
