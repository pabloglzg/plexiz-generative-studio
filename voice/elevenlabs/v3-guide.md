# ElevenLabs v3 — Guía de Voiceover

## Config
- **Endpoint:** `POST https://api.elevenlabs.io/v1/text-to-speech/{voice_id}`
- **Modelo:** `eleven_v3` (OBLIGATORIO — nunca usar `eleven_multilingual_v2` para contenido nuevo)
- **Límite:** 5,000 caracteres por request

## v3 vs v2
| Feature | eleven_v3 | eleven_multilingual_v2 |
|---------|-----------|----------------------|
| Emotion tags | ✅ Nativo | ❌ No |
| Idiomas | 70+ | 29 |
| Expresividad | Dramática | Natural/estable |
| Char limit | 5,000 | 10,000 |
| Multi-speaker | ✅ | ❌ |

## Emotion Tags (v3)
El modelo v3 interpreta emotion tags directamente en el texto:
```
[annoyed] Texto con tono molesto
[happy] Texto con tono feliz
[sighs] Suspiro antes del texto
[assertive] Texto directo y firme
[thoughtful] Texto reflexivo
[friendly] Texto cálido y amigable
[whisper] Texto susurrado
[excited] Texto emocionado
```

## Voice Settings Recomendadas
```json
{
  "stability": 0.5,
  "similarity_boost": 0.75,
  "style": 0.3
}
```
- **Stability 0.5:** Balance entre consistencia y expresividad
- **Similarity 0.75:** Alta fidelidad a la voz original
- **Style 0.3:** Algo de dramatismo sin exagerar

## Voces Activas
| Personaje | Voice ID | Uso |
|-----------|----------|-----|
| Lucio (Frikko) | `yl2ZDV1MzN4HbQJbMihG` | Mascota HVAC, tono técnico/amigable |
| Madre Jobita | `0rEo3eAjssGDUCXHYENf` | Influencer, tono maternal cálido |

## Ejemplo Completo
```bash
curl -X POST "https://api.elevenlabs.io/v1/text-to-speech/yl2ZDV1MzN4HbQJbMihG" \
  -H "xi-api-key: $ELEVENLABS_API_KEY" \
  -H "Content-Type: application/json" \
  -o output.mp3 \
  -d '{
  "text": "[annoyed] Texto aquí. [happy] Más texto.",
  "model_id": "eleven_v3",
  "language_code": "es",
  "voice_settings": {
    "stability": 0.5,
    "similarity_boost": 0.75,
    "style": 0.3
  }
}'
```

## Output Formats
- Default: `mp3_44100_128` (buena calidad)
- Alta calidad: `mp3_44100_192`
- Para video: `mp3_44100_128` es suficiente
