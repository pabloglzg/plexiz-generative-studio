# JSON Prompting for Nano Banana

## Why JSON > Prose
JSON prompts produce more consistent results because each attribute is isolated. The model parses structured data better than free-form descriptions.

## Basic Structure
```json
{
  "subject": "What/who is in the image",
  "style": "Visual style (3D vinyl toy, photorealistic, illustration, etc)",
  "material": "Surface finish (smooth matte plastic, glossy, metallic, etc)",
  "background": "Scene description with depth of field",
  "lighting": "Light source, quality, shadows",
  "camera": "Angle, lens, format (9:16, 16:9, 1:1)",
  "render": "Quality level (4K, Pixar, product photography)",
  "avoid": "What NOT to include"
}
```

## With Reference Images
When attaching images, reference by number instead of describing:
```json
{
  "character": "Recreate the character from image 1",
  "colors": "Use the color palette from image 2",
  "logo": "Add the logo from image 3 on [location]",
  "style": "Photorealistic vinyl toy figurine",
  "background": "Blurred workshop, shallow depth of field"
}
```

## Key Rules
1. **If you attach reference images → reference by number, don't re-describe**
2. **Be specific about materials** — "3D" is generic; "smooth matte plastic vinyl toy" is specific
3. **Always specify lighting** — it changes everything
4. **Include "avoid"** — prevents common AI defaults
5. **Aspect ratio** — specify 9:16 for vertical, 16:9 for cinematic
6. **Text on images** — Nano Banana struggles with exact text. Add branding in post.

## Lessons from Production
- The model tends to "interpret" logos rather than copy them exactly
- For blob/mascot characters: explicitly state "NOT human, blob creature" or it will humanize
- Multiple input images: put character first, logo/reference second
- When iterating, use the previous output as input for faster convergence

Source: Plexiz production (Feb-Mar 2026)
