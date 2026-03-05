# Kling 3.0 — Prompt Rules

## Regla de Oro
**El personaje viene de la imagen. El prompt describe SOLO movimiento y cámara.**

## Estructura del Prompt (Image-to-Video)
```
[Acción principal del escenario] + [Movimiento del personaje] + [Detalles ambientales] + [Cámara]
```

### Ejemplo real (Lucio Scene 1):
> "Sheer white curtains billow dramatically inward from two open windows as hot wind rushes in. The blue mascot character shifts his weight nervously and glances between the windows with a worried expression. The wall-mounted air conditioner works hard with a visible blue LED glow. Warm golden light pulses through the flowing curtains. Slow push-in camera toward the character."

### Desglose:
1. **Acción escenario:** cortinas volando por el viento
2. **Movimiento personaje:** cambia peso, mira nervioso entre ventanas
3. **Detalle ambiental:** AC con LED azul, luz dorada
4. **Cámara:** slow push-in

## 7-Part Prompt Spine (Text-to-Video)
1. **Who** — sujeto principal
2. **What** — acción específica
3. **Where** — escenario/ambiente
4. **Style** — estilo visual (3D Pixar, cinematic, etc.)
5. **Camera** — movimiento de cámara
6. **Lighting** — tipo de iluminación
7. **Texture/Audio** — detalles sensoriales

## Anti-Patterns (NO hacer)
- ❌ Describir la apariencia del personaje (ya está en la imagen)
- ❌ Múltiples acciones en un shot
- ❌ Prompts de 5+ frases
- ❌ "Make a video of..." — describe la escena, no el proceso
- ❌ Ignorar la cámara — SIEMPRE especificar movimiento de cámara
- ❌ Prompt genérico sin detalles de motion

## Camera Language
- `push-in` / `dolly in` — acercarse al sujeto
- `pull-back` / `dolly out` — alejarse
- `pan left/right` — mover cámara horizontalmente
- `tilt up/down` — mover cámara verticalmente
- `tracking shot` — seguir al sujeto
- `static` / `holds steady` — cámara fija
- `low angle` / `heroic angle` — desde abajo (poder/grandeza)
- `high angle` — desde arriba (vulnerabilidad)
- `zoom-in` — zoom óptico/digital

## Duración Óptima
- **5s** — un beat narrativo, una acción
- **10s** — dos beats, transición natural
- **15s** — máximo, solo si la acción lo justifica
- **<5s** — muy corto, poco donde cortar

## Lip Sync
- Solo funciona bien en los **primeros 10 segundos**
- Después de 10s → solo acción, sin diálogo

## Consistencia entre shots
- El movimiento se **hereda** entre shots (lean in shot 1 → continues in shot 2)
- Usar **last frame de clip anterior como first frame del siguiente** para continuidad
- Kling 3.0 recuerda detalles (marcas en pared, ropa, iluminación) entre multi-shots
