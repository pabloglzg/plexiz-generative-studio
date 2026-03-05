# ElevenLabs — Guía de Producción

## Modelo
- **eleven_v3** — el más reciente y mejor calidad. NUNCA usar `eleven_multilingual_v2` (deprecated)

## Parámetros Clave
- **Stability:** Solo acepta 0.0, 0.5, o 1.0 (la API cambió, ya no acepta decimales intermedios como 0.71)
- **Para Madre Jobita:** stability 0.5

## Límites
- **Sound Generation:** máximo 30 segundos por clip
  - Workaround para música más larga: generar 2 clips de 30s y concatenar con FFmpeg
- **Pagos:** Si falla el pago, el audio deja de generar (lección: monitorear billing)

## Voice Cloning
- Se necesita: grabación clara, mínimo 30s, sin ruido de fondo
- Voice IDs se guardan en el dashboard y se referencian por ID en la API

## Integración con HeyGen
- ElevenLabs genera audio → se sube a tmpfiles.org → HeyGen lo jala para avatar video
- O se usa JoggAI que tiene ElevenLabs integrado nativo

## Tips de Producción
- Siempre verificar que el audio se generó antes de pasar al siguiente step del pipeline
- El modelo tiende a "cantar" ciertas frases — ajustar stability si se escucha raro
