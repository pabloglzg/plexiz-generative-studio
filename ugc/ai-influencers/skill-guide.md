---
name: ai-influencer
description: End-to-end daily content pipeline for AI influencers (TikTok/Instagram/YouTube). Generates image, copy, audio, music, and video — then uploads to Google Drive. Use when creating content for any AI influencer persona, running a daily pipeline, tracking social metrics, or any mention of "AI influencer", "daily content", "influencer pipeline", "content pipeline", or a specific influencer name defined in a profile.
---

# AI Influencer — Daily Content Pipeline

Automated content creation for AI-generated social media influencers. Each influencer is defined by a **profile** in `references/profiles/`. The pipeline is the same for all; only the profile changes.

## Influencer Profiles

Each influencer has a profile YAML at `references/profiles/<name>.yaml`:

```yaml
name: Madre Jobita
handle: madrejobita
platforms: [tiktok, instagram]
language: es
voice:
  provider: elevenlabs
  model: eleven_v3  
  voice_id: "0rEo3eAjssGDUCXHYENf"
  api_key: "REDACTED_ELEVENLABS_KEY"
image:
  provider: gemini
  model: gemini-3-pro-image-preview
  api_key: "REDACTED_GEMINI_KEY"
  reference_image: /Users/pabloglzg/.openclaw/workspace/madre-jobita/referencia-oficial.png
  fixed_style: "warm golden light, colonial Mexican style, looking at camera, photorealistic"
  resolution: 2K
video:
  provider: heygen
  api_key: "sk_V2_hgu_kYoHfihjXPf_PH1CKAGKz2cWuUh0teS8ubjSoSk1XrAG"
  method: avatar_iv  
  dimensions: {width: 1080, height: 1920}
drive:
  account: pablo@plexiz.com
  parent_folder_id: "0ACe0oJ1MHGDmUk9PVA"
  folder_format: "DD-MMM-YY"
content:
  word_count: [120, 150]
  structure: "hook → petición → tarea → ejemplos sensoriales → contraste → validación → cierre → CTA"
  rules:
    - "NEVER mention Dios/dios"
    - "Spanish neutral: hijito not hijita"
    - "No temporal references: no days, no hoy, no dates"
    - "Specific pain topics over generic positive"
music:
  style: "Soft ambient piano and strings, warm emotional background"
  duration_seconds: 65
```

**To add a new influencer:** Create a new profile YAML. The pipeline handles the rest.

## Pipeline (Same for All Influencers)

Load the profile first, then execute steps 1-6 in order.

### Step 1: Pick Topic & Generate Copy

Read `references/topic-strategy.md` for data-backed topic selection. Write copy following the profile's `content.rules` and `content.structure`.

### Step 2: Generate Audio (TTS)

Use the profile's `voice` config. Code pattern:

```python
from elevenlabs import ElevenLabs
client = ElevenLabs(api_key=profile["voice"]["api_key"])
audio = client.text_to_speech.convert(
    voice_id=profile["voice"]["voice_id"],
    text=copy_text,
    model_id=profile["voice"]["model"]
)
```

### Step 3: Generate Music

```python
music = client.text_to_sound_effects.convert(
    text=profile["music"]["style"],
    duration_seconds=profile["music"]["duration_seconds"]
)
```

### Step 4: Generate Image

Scene MUST match the copy topic. Use profile's `image.fixed_style` as the constant, vary the scene.

```bash
GEMINI_API_KEY=<profile.image.api_key> \
uv run <nano-banana-pro>/scripts/generate_image.py \
  --prompt "Edit this image: <SCENE MATCHING COPY>. <profile.image.fixed_style>" \
  -i <profile.image.reference_image> \
  --filename <output_path> \
  --resolution <profile.image.resolution>
```

### Step 5: Generate Video (HeyGen Avatar IV)

**Read `references/heygen-process.md` BEFORE executing. Follow exactly, ONE attempt only.**

1. Upload image as talking photo (raw binary POST to `/v1/talking_photo`)
2. Upload audio to tmpfiles.org for direct URL
3. POST `/v2/video/generate` with `use_avatar_iv_model: true`
4. Poll `/v1/video_status.get` until complete (~8-10 min)
5. Download video

### Step 6: Upload to Google Drive

Create folder `<profile.drive.folder_format>/` with subfolders: IMAGEN, COPY, AUDIO, MUSICA, VIDEO.

```bash
gog drive mkdir "<date>" --parent <profile.drive.parent_folder_id> --account <profile.drive.account>
```

## Metrics Tracking

- **TikTok:** `yt-dlp` (free, no API)
- **Instagram:** Public API with `X-IG-App-ID: 936619743392459`
- **Script:** `scripts/metrics.sh`

## References

- `references/heygen-process.md` — Exact HeyGen Avatar IV API calls
- `references/topic-strategy.md` — Performance data and topic selection
- `references/profiles/` — One YAML per influencer
