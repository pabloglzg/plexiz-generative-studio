#!/bin/bash
# Stitch multiple video clips with crossfades + voiceover
# Usage: ./stitch-scenes.sh <output.mp4> <voiceover.mp3> <clip1.mp4> <clip2.mp4> [clip3.mp4] ...
#
# Features:
# - 0.5s crossfade between clips
# - Voiceover audio track
# - Fade to black at end (1s)
# - Audio fade out (1.5s)
# - Scale to 1080x1920 (9:16)
# - H.264, CRF 18, AAC 192k

set -euo pipefail

OUTPUT="${1:?Usage: $0 <output.mp4> <voiceover.mp3> <clip1.mp4> <clip2.mp4> ...}"
VOICEOVER="${2:?Usage: $0 <output.mp4> <voiceover.mp3> <clip1.mp4> <clip2.mp4> ...}"
shift 2
CLIPS=("$@")

if [ ${#CLIPS[@]} -lt 2 ]; then
  echo "Need at least 2 clips"
  exit 1
fi

echo "🎬 Stitching ${#CLIPS[@]} clips with voiceover..."

# Build ffmpeg command dynamically
INPUTS=""
FILTER=""
CLIP_DURATION=5.0  # approximate, adjust if clips vary
XFADE_DUR=0.5

# Input files
for i in "${!CLIPS[@]}"; do
  INPUTS="$INPUTS -i ${CLIPS[$i]}"
done
INPUTS="$INPUTS -i $VOICEOVER"

# Scale each clip
for i in "${!CLIPS[@]}"; do
  FILTER="[$i:v]scale=1080:1920:force_original_aspect_ratio=decrease,pad=1080:1920:-1:-1,setsar=1,fps=24[v$i];"
done

# Chain xfades
PREV="v0"
OFFSET=$(echo "$CLIP_DURATION - $XFADE_DUR" | bc)
for i in $(seq 1 $((${#CLIPS[@]} - 1))); do
  NEXT="v${i}"
  if [ $i -eq $((${#CLIPS[@]} - 1)) ]; then
    # Last xfade — add fade to black
    TOTAL_DUR=$(echo "$OFFSET + $CLIP_DURATION" | bc)
    FADE_START=$(echo "$TOTAL_DUR - 1" | bc)
    FILTER="${FILTER}[$PREV][$NEXT]xfade=transition=fade:duration=${XFADE_DUR}:offset=${OFFSET},fade=t=out:st=${FADE_START}:d=1[vout];"
  else
    FILTER="${FILTER}[$PREV][$NEXT]xfade=transition=fade:duration=${XFADE_DUR}:offset=${OFFSET}[v${i}x];"
    PREV="v${i}x"
  fi
  OFFSET=$(echo "$OFFSET + $CLIP_DURATION - $XFADE_DUR" | bc)
done

# Audio fade out
AUDIO_IDX=${#CLIPS[@]}
AUDIO_FADE_START=$(echo "$OFFSET - 1" | bc)
FILTER="${FILTER}[$AUDIO_IDX:a]afade=t=out:st=${AUDIO_FADE_START}:d=1.5[aout]"

echo "Running ffmpeg..."
eval ffmpeg -y $INPUTS \
  -filter_complex "\"$FILTER\"" \
  -map '"[vout]"' -map '"[aout]"' \
  -c:v libx264 -preset slow -crf 18 -pix_fmt yuv420p \
  -c:a aac -b:a 192k \
  -shortest \
  "$OUTPUT" 2>/dev/null

echo "✅ Output: $OUTPUT ($(du -h "$OUTPUT" | awk '{print $1}'))"
ffprobe -v quiet -show_entries format=duration -of csv=p=0 "$OUTPUT" | xargs -I{} echo "  Duration: {}s"
