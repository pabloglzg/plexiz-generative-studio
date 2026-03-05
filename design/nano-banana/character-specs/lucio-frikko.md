# Lucio — Character Spec (Frikko Mascot)

## Identity
- **Nombre:** Lucio
- **Marca:** Frikko (subsidiary de Macon)
- **Rol:** Mascota técnica HVAC, enseña tips de aire acondicionado
- **Tono:** Técnico pero accesible, norteño, directo

## Visual Spec (JSON para Nano Banana prompts)
```json
{
  "character": {
    "body": {
      "shape": "round blob, no neck, vinyl-toy proportions",
      "color": "#4F5A9E (indigo-blue)",
      "surface": "smooth matte plastic finish"
    },
    "face": {
      "eyes": {
        "shape": "large round spheres, white sclera",
        "iris": "60% of eye sphere (approved ratio)",
        "pupil": "black dot centered",
        "expression": "friendly, alert"
      },
      "mustache": {
        "color": "#4A3728 (dark brown)",
        "style": "thick handlebar, slightly curved up"
      }
    },
    "cap": {
      "style": "baseball cap, front-facing",
      "front_color": "#8BB8DC (light blue)",
      "logo": "FRIKKO text or Frikko shield logo",
      "brim": "darker blue"
    },
    "tool_belt": {
      "color": "#6B4226 (leather brown)",
      "tools": "wrench + screwdriver",
      "position": "around waist"
    },
    "hands": "mitten flippers, short stubby nubs",
    "feet": "small round stumps"
  }
}
```

## Iteraciones de Ojos
- v1-v5: Demasiado similar al original / angry
- v6: Iris 70-75% — demasiado grande
- **v7: Iris 60% — APROBADO** — friendly sin ser caricaturesco

## Archivos de Referencia
- Original render (Pablo): `lucio-frikko.webp`
- v7 ojos amigables: `lucio-friendly-v7.png`
- Frikko AVANT mini-split: `frikko-avant-minisplit.png`
- Logo blanco: `frikko-white.png`

## Reglas de Prompting
1. **Máximo 4 imágenes de referencia** — más causa glitching
2. **JSON structure en prompt** — analizar ref → JSON → embeber en prompt
3. **Iris siempre al 60%** — ratio aprobado
4. **Consistencia de room:** usar Scene 1 como ref adicional para escenas posteriores
5. **Producto (mini-split):** FRIKKO® bottom-left, AVANT bottom-right
