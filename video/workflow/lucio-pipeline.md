# Pipeline: Lucio x Frikko — "Cierra las Ventanas"

## Resumen
Video de 14s para redes sociales (9:16) con mascota Lucio enseñando a cerrar ventanas cuando el mini-split está prendido.

## Stack Tecnológico
| Paso | Herramienta | Modelo/Config |
|------|------------|---------------|
| First frames | Google GenAI SDK | `gemini-2.5-flash-image`, 9:16, 4 refs |
| Animación | Kling 3.0 via KIE.ai | `pro` mode, 1080×1920, 5s/clip |
| Voiceover | ElevenLabs | `eleven_v3`, voice `yl2ZDV1MzN4HbQJbMihG` |
| Stitching | ffmpeg | crossfades, fade out, audio mix |

## Pipeline Paso a Paso

### Paso 1: Generar First Frames (Nano Banana / Gemini)
- **SDK:** `google-genai` v1.66.0+ (pip)
- **Modelo:** `gemini-2.5-flash-image`
- **Config:** `types.ImageConfig(aspectRatio="9:16")` → 768×1344
- **Referencias (4 imágenes):**
  1. Lucio front view (render original)
  2. Lucio v7 (ojos amigables, iris 60%)
  3. Frikko AVANT mini-split (producto)
  4. Frikko logo
- **Técnica:** Analizar referencia como JSON → embeber JSON en prompt
- **Consistencia:** Usar Scene 1 como referencia adicional para Scenes 2-3

### Paso 2: QC de Imágenes
- Verificar consistencia de room (arco, muebles, paredes)
- Verificar personaje (proporción, cap, bigote, tool belt)
- Verificar producto (mini-split con logos legibles)
- Si falla → regenerar con scene anterior como referencia

### Paso 3: Subir imágenes a KIE.ai
```bash
curl -X POST "https://kieai.redpandaai.co/api/file-stream-upload" \
  -H "Authorization: Bearer $KIE_API_KEY" \
  -F "file=@scene1.png" \
  -F "uploadPath=project-name" \
  -F "fileName=scene1.png"
```

### Paso 4: Generar videos con Kling 3.0
```bash
curl -X POST "https://api.kie.ai/api/v1/jobs/createTask" \
  -H "Authorization: Bearer $KIE_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
  "model": "kling-3.0/video",
  "input": {
    "prompt": "SOLO MOVIMIENTO + CÁMARA",
    "image_urls": ["https://tempfile..."],
    "sound": true,
    "duration": "5",
    "aspect_ratio": "9:16",
    "mode": "pro",
    "multi_shots": false
  }
}'
```
- **Prompts reales usados:**
  - Scene 1: "Sheer white curtains billow dramatically inward from two open windows as hot wind rushes in. The blue mascot character shifts his weight nervously and glances between the windows with a worried expression. The wall-mounted air conditioner works hard with a visible blue LED glow. Warm golden light pulses through the flowing curtains. Slow push-in camera toward the character."
  - Scene 2: "The blue mascot character reaches up and firmly pushes the window shut with both hands. The sheer curtains settle and stop billowing as the window closes. Cool blue-tinted air flows gently from the wall-mounted AC unit. The room transitions from warm chaotic lighting to calm cool ambient light. Medium shot, slight low angle, camera holds steady."
  - Scene 3: "The blue mascot character stands proudly and gives a confident thumbs up to the camera with a warm smile. Both windows are closed with still curtains. The AC unit glows with a subtle blue LED, cooling the room perfectly. Pleasant ambient light fills the space. Slow gentle zoom-in on the character, heroic low angle."

### Paso 5: Generar Voiceover (ElevenLabs v3)
```bash
curl -X POST "https://api.elevenlabs.io/v1/text-to-speech/yl2ZDV1MzN4HbQJbMihG" \
  -H "xi-api-key: $ELEVENLABS_API_KEY" \
  -H "Content-Type: application/json" \
  -o voiceover.mp3 \
  -d '{
  "text": "[annoyed] ¿Tienes el mini-split prendido y las ventanas abiertas? [sighs] Estás haciendo que trabaje el doble por nada. [assertive] Cierra las ventanas. [thoughtful] Deja que el aire circule bien por el cuarto. [happy] Así de fácil cuidas tu equipo y tu recibo de luz. [friendly] Yo soy Lucio, y con Frikko te enseño a usar bien tu mini-split.",
  "model_id": "eleven_v3",
  "language_code": "es",
  "voice_settings": {
    "stability": 0.5,
    "similarity_boost": 0.75,
    "style": 0.3
  }
}'
```

### Paso 6: Stitch con ffmpeg
```bash
ffmpeg -y \
  -i scene1.mp4 -i scene2.mp4 -i scene3.mp4 -i voiceover.mp3 \
  -filter_complex "
    [0:v]scale=1080:1920:force_original_aspect_ratio=decrease,pad=1080:1920:-1:-1,setsar=1,fps=24[v0];
    [1:v]scale=1080:1920:force_original_aspect_ratio=decrease,pad=1080:1920:-1:-1,setsar=1,fps=24[v1];
    [2:v]scale=1080:1920:force_original_aspect_ratio=decrease,pad=1080:1920:-1:-1,setsar=1,fps=24[v2];
    [v0][v1]xfade=transition=fade:duration=0.5:offset=4.5[v01];
    [v01][v2]xfade=transition=fade:duration=0.5:offset=9.0,fade=t=out:st=13.5:d=1[vout];
    [3:a]afade=t=out:st=14:d=1.5[aout]
  " \
  -map "[vout]" -map "[aout]" \
  -c:v libx264 -preset slow -crf 18 -pix_fmt yuv420p \
  -c:a aac -b:a 192k -shortest output-final.mp4
```

## Costos
| Recurso | Costo |
|---------|-------|
| Nano Banana (Gemini) | Gratis (API key) |
| Kling 3.0 Pro × 3 clips | ~405 créditos KIE |
| ElevenLabs v3 voiceover | Incluido en plan |
| ffmpeg | Gratis |
| **Total** | **~405 créditos** |

## Lecciones Aprendidas
1. **Siempre poner `aspect_ratio` explícito** — sin él, tasks pueden quedarse stuck
2. **KIE tiene colas intermitentes** — si task stuck >15 min, lanzar nuevo
3. **Usar scene anterior como referencia** para consistencia de room
4. **JSON prompt structure** para Nano Banana = mucho mejor que free-text
5. **Emotion tags de ElevenLabs v3** funcionan perfecto: `[annoyed]`, `[happy]`, etc.
6. **Crossfade de 0.5s** entre escenas es el sweet spot
7. **Fade to black al final** (1s) cierra profesionalmente

## Output Final
- **Resolución:** 1080×1920 (9:16)
- **Duración:** 14 segundos
- **Audio:** Voiceover + sound effects de Kling
- **Transiciones:** Crossfade 0.5s entre escenas
- **Archivo:** `lucio-cierra-ventanas-final.mp4` (7.4MB)
