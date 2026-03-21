# AI Game Development Stack

**Source:** [@chongdashu](https://x.com/chongdashu/status/2031743032266043687) + [@coreyching](https://x.com/coreyching/status/2029652928982823353) + OpenAI Showcase  
**Date:** March 2026

## Pablo's Project

Building a 2D videogame with street art / Basquiat / KAWS visual style.

## Tech Stack (Decided)

| Layer | Tool |
|-------|------|
| Code | Codex + GPT-5.4 (zero manual code) |
| Sprites/Art | GPT Image 1.5 (`gpt-image-1.5`) — ALWAYS 1.5, not 1 |
| Audio/Music | ElevenLabs pipeline |
| Engine | Browser-based (fastest to ship) |
| Concept | Pablo's artistic direction |

## Sprite Generation Workflow (Chong-U Method)

**Rule:** Never generate frame-by-frame. Always request complete strips.

1. **Start with ONE seed sprite** — production quality, 64x64px. Anchors: face, proportions, palette, silhouette
2. **Upscale to 1024x1024 canvas** with reserved slots for animation frames
3. **Generate complete animation strip** in ONE API call (4 frames of walk/attack/idle at once)
4. **Normalize with Python**: detect sprites → calculate global shared scale → pad to 64x64 → replace frame 1 with original
5. **Global scale rule**: use ONE scale for all frames. Don't scale per frame individually

## GPT Image 1.5 API

```python
# Always use 1.5
model = "gpt-image-1.5"
```

Already configured and working on Mac Mini.

## Proof of Concept

- Corey Ching built a full turn-based tactical RPG (featured on OpenAI blog) using Codex + GPT-5.4 Image
- Zero manual code — complete game in browser

## Design Resources

- OpenAI Developer Showcase: https://developers.openai.com/showcase
- GPT-5.4 Image generation docs: https://developers.openai.com/api/docs/guides/image-generation
