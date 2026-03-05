# HeyGen — Guía de Producción

## Qué es
Avatar video generator — sube una foto/video de una persona, genera video hablando con lip sync.

## Bugs Conocidos
- **Avatar IV + 9:16:** Sale en 1:1 en vez de 9:16 con `use_avatar_iv_model: true`
  - Workaround: usar JoggAI (genera 9:16 nativo)
- **Máximo 3 talking photos** — debes eliminar fotos viejas antes de subir nuevas

## API Notes
- **Foto upload:** raw binary POST + Content-Type image/png
- **Audio hosting:** tmpfiles.org para audio temporal (HeyGen lo descarga de ahí)

## Alternativa: JoggAI
- **Ventajas sobre HeyGen:**
  - 9:16 nativo (sin el bug 1:1)
  - 2-3 min render time
  - ElevenLabs integrado (no necesitas subir audio aparte)
  - AvatarX para character consistency
- **Desventajas:**
  - Reviews de AppSumo mencionan lip sync issues
  - Menos maduro que HeyGen
- **Acción:** Probar con un video antes de migrar pipeline completo

## Detalles Técnicos
- Referencia completa: `heygen-process.md` en esta misma carpeta

Source: Producción Madre Jobita (Feb-Mar 2026)
