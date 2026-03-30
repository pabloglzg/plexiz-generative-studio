# Remotion + AI — Workflows, Skills y Repos (Marzo 2026)

*Investigación: Grok 4.20 multi-agent + lectura directa de tweets. 30 Mar 2026.*

---

## Skills / CLAUDE.md para Remotion

### 1. Skill Oficial de Remotion (EL PRINCIPAL)
- **Repo:** [remotion-dev/skills](https://github.com/remotion-dev/skills)
- **Instalar:** `npx skills add remotion-dev/skills`
- **Contenido:** 43 archivos — reglas para composiciones, animaciones, timing, transiciones, subtítulos, 3D, charts, captions, audio, video, fonts, FFmpeg, Lottie, Tailwind, voiceover, maps, light leaks
- **Nota:** Este es el skill que usa @dotta (Paperclip) para generar videos con agentes AI. Lo mencionó específicamente como "remotion-best-practices skill".

### 2. claude-remotion-kickstart
- **Repo:** [jhartquist/claude-remotion-kickstart](https://github.com/jhartquist/claude-remotion-kickstart)
- **Qué es:** Proyecto starter completo con CLAUDE.md, slash commands, y MCP config
- **Slash commands incluidos:** `/generate-image`, `/generate-video`, `/new-composition`, `/screenshot`, `/transcribe`
- **Componentes listos:** TitleSlide, ContentSlide, CodeSlide, DiagramSlide, VideoSlide, BRollVideo, ZoomableVideo, Screenshot, Logo, Caption, AsciiPlayer, Code, Diagram, Music
- **Presets de video:** aspect ratios (landscape, portrait, square) a 60fps
- **Ideal para:** Empezar un proyecto nuevo de Remotion con Claude Code en minutos

### 3. remotion-claude-video
- **Repo:** [JJenglert1/remotion-claude-video](https://github.com/JJenglert1/remotion-claude-video)
- **Qué es:** Skills en `.agents/skills/` que Claude carga automáticamente

### 4. claude-code-video-toolkit
- **Repo:** [digitalsamba/claude-code-video-toolkit](https://github.com/digitalsamba/claude-code-video-toolkit)
- **Qué es:** Templates + skill de Remotion para Claude Code

---

## Templates Oficiales

| Template | Repo | Uso |
|----------|------|-----|
| **Prompt to Motion Graphics SaaS** | [remotion-dev/template-prompt-to-motion-graphics-saas](https://github.com/remotion-dev/template-prompt-to-motion-graphics-saas) | Le das un prompt → genera motion graphics. Incluye backend Next.js |
| **Launchpad** | [trycua/launchpad](https://github.com/trycua/launchpad) | Videos de lanzamiento de producto |
| **Contribution Graph** | [remotion-dev/contribution-graph-vercel](https://github.com/remotion-dev/contribution-graph-vercel) | GitHub contribution graph animado |
| **Fireship Style** | [wcandillon/remotion-fireship](https://github.com/wcandillon/remotion-fireship) | Estilo YouTube tech (Fireship) |

---

## Workflows Reales (De Tweets Verificados)

### 🏆 Caso #1: News Reels Factory — 18 videos/día, $200/mes
**Quién:** @umutdenizy (400K+ followers, media page)
**Pipeline:** Clawdbot → JSON → Opus 4.5 + Remotion → ElevenLabs + OpenAI → video
**Antes:** 6 reels/día, $2,000/mes en staff, 20-30 min por video
**Después:** 18 reels/día, <$200/mes en APIs
**Impacto:** 90% reducción de costos, 200% aumento de productividad
**Fuente:** [Tweet](https://x.com/umutdenizy/status/2016985553040761014)

### 🏆 Caso #2: Reels por $1 (4 PLN)
**Quién:** @KacperTrzepiec1 (50K+ comunidad)
**Pipeline:** Claude Code + Remotion → app que genera reels
**Insight:** "El sistema se mejora solo — busca nuevas transiciones, gráficos, elementos. Cada iteración sale mejor."
**Fuente:** [Tweet](https://x.com/KacperTrzepiec1/status/2036734579466252689)

### 🏆 Caso #3: Paperclip — Video en 10 minutos con agentes
**Quién:** @dotta (fundador Paperclip)
**Pipeline:** Agente CEO → contrata agente video editor → le da skill "remotion-best-practices" → agente CMO escribe guión → video editor renderiza
**Insight:** "Hacer este video me hubiera tomado una semana. Ahora es casi un afterthought."
**Clave:** Brand guide + remotion skill + agentes especializados
**Fuente:** [Tweet](https://x.com/dotta/status/2037206700092989789)

### Caso #4: Product Demos en 30 segundos
**Quién:** @nestymee
**Pipeline:** Screencast + App Store screenshots + repo → Claude → Remotion → video estilo Apple
**Insight:** "Give Claude your screencast, drop your repo, ask for a punchy Apple-style video through remotion. That's it."
**Fuente:** [Tweet](https://x.com/nestymee/status/2032482216539037923)

### Caso #5: TikTok Ads Pipeline
**Quién:** @gakeez1
**Pipeline:** TikHub → faster-whisper → Kimi → Kling → Doubao TTS → Remotion
**Qué hace:** Toma un video de TikTok → lo convierte en un nuevo ad-style short video automáticamente (storyboard, assets, voiceover, render)
**Insight:** "AI coding is great for speed, but multi-service API integration still needs humans in the loop."
**Fuente:** [Tweet](https://x.com/gakeez1/status/2037800290599182740)

---

## Lecciones Destiladas

### Lo que funciona
1. **JSON como interfaz entre AI y Remotion** — El LLM genera datos/guión en JSON → Remotion lo renderiza. No le pidas al LLM que escriba código React cada vez.
2. **Skills > prompts sueltos** — Los que escalan tienen skills instalados (remotion-best-practices), no prompts ad hoc.
3. **Componentes reutilizables** — TitleSlide, ContentSlide, CodeSlide, etc. Una vez hechos, solo cambias el JSON de input.
4. **Brand guide como input** — Paperclip y los mejores workflows tienen un brand guide que el agente consulta antes de renderizar.
5. **ElevenLabs para voz + Remotion para visual** — Es la combinación dominante. Whisper para transcribir, ElevenLabs para generar.

### Lo que NO funciona
1. **Pedirle al LLM que haga todo el pipeline en un shot** — Múltiples APIs + integraciones = hallucinations. Necesita supervisión humana.
2. **Código React dinámico por prompt** — Es lento y frágil. Mejor: templates estáticos con props dinámicos.
3. **Ignorar el skill oficial** — Tiene 43 archivos de reglas optimizadas. Usarlo directamente evita errores comunes.

### Stack ganador (2026)
```
Guión:      Claude/Opus → JSON estructurado
Voz:        ElevenLabs eleven_v3 (o Whisper para transcribir existente)  
Imágenes:   Gemini/Nano Banana (o OpenAI GPT Image)
Video gen:  Kling 3.0 / Seedance (si necesitas video AI)
Render:     Remotion (React → MP4)
Subtítulos: @remotion/subtitles + faster-whisper
Música:     ElevenLabs Music API
Deploy:     Remotion Lambda (serverless) o local
```

---

## Qué instalamos en Plexiz

1. ✅ **Skill oficial Remotion** instalado en `skills/remotion/` (43 archivos, 36 reglas)
2. ✅ **claude-remotion-kickstart** clonado (starter project con slash commands y componentes)
3. ✅ **remotion-lab** playground propio (rendering verificado, 1080x1920 @ 30fps)
4. ✅ **Remotion CLI 4.0.441** instalado globalmente
5. ✅ **FFmpeg 8.0.1** ya disponible

---

## Próximos pasos sugeridos

1. **Usar kickstart como base** para el primer video real de Plexiz
2. **Definir brand guide** (colores, fonts, logo, estilo) como JSON para Remotion
3. **Crear 3-4 templates** para los formatos más comunes: reel 9:16, post 1:1, hero 16:9
4. **Probar el pipeline completo:** guión → voz → imágenes → render → export

---

*Destilado para Plexiz Generative Studio — 30 Mar 2026*
