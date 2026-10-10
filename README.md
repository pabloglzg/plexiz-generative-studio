# 🎨 Plexiz Generative Studio

La biblia creativa de Plexiz — conocimiento destilado de cada herramienta generativa de IA para producción de contenido profesional.

## Qué es

Un repositorio de conocimiento acumulado sobre herramientas de IA generativa: diseño, video, voz, música, guiones, UGC, web design, y automatización creativa. Cada entrada es conocimiento probado en producción real con clientes de Plexiz.

## Estructura

```
design/          → Generación de imágenes (Nano Banana, Midjourney, Photoshop AI)
web-design/      → Frontend, Figma, design systems, frameworks
video/           → Video AI (Kling, Seedance, HeyGen, Remotion, FFmpeg)
voice/           → TTS, voice cloning (ElevenLabs)
scripts/         → Guiones, copywriting, brand voices
ugc/             → AI influencers, product shoots, plataformas
code/            → Agents, automatización, herramientas
music/           → Música generativa (Suno, ElevenLabs Music)
knowledge/       → Artículos y frameworks destilados cross-canal
assets/          → Logos, referencias, templates visuales
```

## Cómo usar

Cada herramienta tiene:
- `guide.md` — Qué es, cómo funciona, setup, límites
- `techniques/` — Técnicas avanzadas probadas
- `prompts/` — JSON prompts listos para usar
- `examples/` — Resultados, antes/después

## Reglas

### Referencias y revisión de imágenes

La [receta de referencias por función y QA](design/techniques/references-by-role-and-output-qa.md) separa identidad, logo y tipografía, conserva la modalidad de producción y explica qué verificar en la salida efectiva. Incluye límites de una prueba asistida; no acredita desempeño publicitario.

1. **Solo conocimiento probado** — nada teórico sin testear
2. **Destilado, no copiado** — solo lo actionable de cada fuente
3. **Source link siempre** — cada entry tiene su fuente original
4. **Nada privado** — zero API keys, zero datos de clientes, zero info personal

## Herramientas Cubiertas

### Imagen
- **Nano Banana Pro** (Gemini 3 Pro Image) — text-to-image, image editing, JSON prompts
- **Midjourney** — (por documentar)
- **Photoshop AI** — (por documentar)

### Video
- **Kling 3.0** — AI video generation, cinematography
- **Seedance 2.0** — Character consistency, CapCut integration
- **HeyGen** — Avatar video, talking photos
- **JoggAI** — Alternativa HeyGen (9:16 nativo)
- **Remotion** — React video, motion design programático
- **FFmpeg** — Encoding, subtítulos, mixing

### Voz
- **ElevenLabs** — TTS (eleven_v3), voice cloning, music gen

### Web
- **Figma MCP** — Figma → Claude Code pipeline
- **Taste Rules** — Anti-slop design system enforcement
- **shadcn/ui** — Component library patterns

### Escritura
- **Copywriting** — Frameworks, anti-slop writing
- **Guiones** — Templates por formato (reel, long-form, ad)

---

*Mantenido por el equipo de IA de Plexiz Media*
