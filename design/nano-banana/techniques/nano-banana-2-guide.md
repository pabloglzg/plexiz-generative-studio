# Nano Banana 2 — Official Guide (Gemini 3.1 Flash Image)
- **Source:** https://x.com/NanoBanana/status/2031739390561792084
- **Author:** @Giom_V (official Nano Banana team)
- **Date:** 2026-03-11
- **Engagement:** 1.1K ❤️ | 109 🔁

## Model Matrix
| Feature | NB1 | NB2 | Pro |
|---------|-----|-----|-----|
| Cost | Cheapest | Slightly more | Most expensive |
| Speed | Fastest (no thinking) | Fast | Slower |
| Quality | Good | ~95% of Pro | Best |
| Image Grounding | ❌ | ✅ | Text search only |
| 512px output | ❌ | ✅ | ❌ |
| Extreme ratios (1:8, 1:4) | ❌ | ✅ | ❌ |
| Thinking toggle | ❌ | ✅ ON/OFF | ✅ |

**Rule: NB2 is the new default. Only use Pro when NB2 consistently fails.**

## Image Grounding (Google Search)
The model searches the internet for real images before generating.
- Great for: specific locations, monuments, buildings, animal species, biological accuracy
- **Cannot search for people**
- Example: "Generate a cinematic golden-hour photograph of the main historical church in Voiron, France"

## 512px Batch-to-Upscale Workflow (COST OPTIMIZATION)
1. Use Batch API (50% discount) to generate dozens of variations at 512px
2. Review and select the best composition
3. Upscale that specific image to 1K/2K/4K

512px ≈ same price as NB1 but with NB2 quality.

## Extreme Aspect Ratios
- **1:8 and 1:4** (both vertical and horizontal)
- Perfect for: web banners, scrolling assets, comic strips, panoramic scenes

## Thinking Mode
- **Default: OFF** (saves time and processing)
- Turn ON only for:
  - Nonsensical results that need reasoning help
  - Complex infographics
  - Image Grounding + spatial reasoning combined

## Best Prompt Examples

### Cartoon Portrait (photo + 3D version)
"Based strictly on the uploaded reference image, create a photorealistic scene featuring the real human standing next to a giant 3D animation-style version of themselves. Both must have identical facial structures, clothing, and poses."

### Animation to Photorealistic
"Convert this uploaded animated still into an ultra-realistic, cinematic, fully photorealistic scene. Transform animated characters into real humans while preserving original identities, facial structures, outfits, expressions."

### History on Google Maps
"Generate a hyper-realistic image of [historical event] perfectly replicating a Google Maps Street View capture. Include 123-degree wide-angle barrel distortion, semi-transparent Google Maps UI overlay, '© Google [year]' watermark."

### Kindergarten Filter
"A child's crayon drawing on white lined notebook paper of [subject]. Chunky wax-crayon strokes, wobbly outlines, bright bold colors that messily overflow the lines. Heavy pressure marks, waxy smudges, uneven scribble shading."
