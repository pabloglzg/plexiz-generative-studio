# Seedance 2.0 — Guía de Prompting

*Fuente: [YouTube](https://youtube.com/watch?v=tZReV23ncuc) — Seedance 2.0 prompt breakdown (easy, medium, hard). Destilado 1 Abr 2026.*

---

## Fórmula base (CADA prompt debe seguir esto)

```
Subject + Action + Scene + Camera + Lighting + Style + Audio + Quality Suffix + Constraints
```

---

## Quality Suffix (SIEMPRE al final de cada prompt)

```
4K, ultra HD, rich detail, sharp clarity, cinematic textures, stable picture.
```

## Constraints (SIEMPRE al final después del quality suffix)

```
Maintaining face and clothing consistency, without distortion or high detail. Generate the video without subtitles.
```

---

## Nivel 1: FÁCIL — 1 imagen + 1 párrafo

**Input:** Una imagen como primer frame.

**Estructura del prompt:**
```
Image 1 as the first frame.

[SUBJECT]: A boy in a blue jersey.
[ACTION]: He dribbles forward.
[CAMERA]: Medium tracking shot.
[ENVIRONMENT]: Grass pitch.
[LIGHTING]: Warm afternoon sunlight.
[STYLE]: Cinematic texture with film grain.
[AUDIO]: Boots on grass, ball thud, crowd murmur.

4K, ultra HD, rich detail, sharp clarity, cinematic textures, stable picture.
Maintaining face and clothing consistency, without distortion or high detail. Generate the video without subtitles.
```

**Resultado:** El modelo genera física realista del balón, zancadas naturales, audio sincronizado, tracking de cámara suave.

---

## Nivel 2: MEDIO — 1 imagen + multi-shot prompting

**El unlock:** Etiquetar shots (Shot 1, Shot 2, Shot 3). Cada shot tiene su propia acción, cámara y audio. Puedes asignar timestamps.

**Técnica clave:** Escalar el tamaño del shot intencionalmente (wide → medium → close-up). Es técnica de cine clásica: wide te dice DÓNDE estás, close-up te dice CÓMO SE SIENTE.

**Estructura:**
```
Image 1 as the first frame.

Shot 1 (0:00-0:03): [SUBJECT] dribbles past the defender.
Camera: Medium tracking shot.
Audio: Boots scraping on grass.

Shot 2 (0:03-0:07): He strikes a sharp pass.
Camera: Wide shot.
Audio: Crack of the ball, crowd building.

Shot 3 (0:07-0:10): He watches the ball sail away.
Camera: Close-up on his face.
Audio: Crowd roar swelling.

4K, ultra HD, rich detail, sharp clarity, cinematic textures, stable picture.
Maintaining face and clothing consistency, without distortion or high detail. Generate the video without subtitles.
```

**Resultado:** Mismo punto de partida que el nivel fácil, resultado completamente diferente. Estás DIRIGIENDO, no solo describiendo.

---

## Nivel 3: DIFÍCIL — 2 imágenes + 5 shots + técnicas de cámara avanzadas

**El unlock:** Usar DOS imágenes — primer frame (inicio) y último frame (final). La AI construye todo lo de en medio.

**Estructura:**
```
Image 1 as the first frame: Player receives a pass, ball at his feet.
Image 2 as the last frame: The ball hitting the back of the net.

Shot 1 (0:00-0:03): Player receives the pass and starts running.
Camera: Tracking shot moving backwards as he runs toward camera.
Audio: Ball on grass, boots thudding.

Shot 2 (0:03-0:06): He accelerates past a defender.
Camera: Low angle wide with whip pan following his direction change.
Audio: Crowd swelling.

Shot 3 (0:06-0:09): He nutmegs a defender with a quick touch.
Camera: Tight side tracking shot with slight orbit.
Audio: Crowd gasp.

Shot 4 (0:09-0:12): He lines up the shot, eyes on goal.
Camera: Close-up with rack focus (focus shifts from his face to goalkeeper behind).
Audio: Heartbeat.

Shot 5 (0:12-0:15): He strikes — ball flies into the net.
Camera: Dolly in following the ball into the net.
Audio: Crowd eruption.

4K, ultra HD, rich detail, sharp clarity, cinematic textures, stable picture.
Maintaining face and clothing consistency, without distortion or high detail. Generate the video without subtitles.
```

**Técnicas de cámara usadas:**
| Shot | Técnica |
|------|---------|
| 1 | Tracking shot (backwards) |
| 2 | Low angle wide + whip pan |
| 3 | Side tracking + slight orbit |
| 4 | Close-up + rack focus |
| 5 | Dolly in |

**Resultado:** 2 imágenes se convierten en una secuencia cinematográfica de 15 segundos. El modelo mantiene el mismo personaje en los 5 cortes sin necesitar inputs separados para cada escena.

---

## Tips rápidos

1. **Quality suffix en CADA prompt** — sin excepción
2. **Constraints en CADA prompt** — mantiene consistencia facial/ropa
3. **Videos de referencia cortos** — cuando uses esa función, recorta al segmento exacto que quieres
4. **Audio específico, NO genérico** — ❌ "sound effects" → ✅ "the metallic clink of a coin hitting a stone"
5. **Escalar shots** — wide → medium → close-up (contexto → emoción)
6. **Multi-shot = dirigir** — cada shot con su propia acción, cámara, audio
7. **2 imágenes** — primer frame + último frame, la AI construye todo lo de en medio

---

## Vocabulario de cámara para Seedance 2.0

### Movimientos
- **Tracking shot** — cámara sigue al sujeto lateralmente
- **Dolly in/out** — cámara se acerca/aleja en línea recta
- **Whip pan** — giro rápido horizontal
- **Orbit** — cámara gira alrededor del sujeto
- **Crane/Jib** — movimiento vertical
- **Steadicam** — seguimiento suave a pie

### Ángulos
- **Eye level** — a la altura de los ojos
- **Low angle** — cámara baja mirando hacia arriba (da poder)
- **High angle** — cámara alta mirando hacia abajo (da vulnerabilidad)
- **Dutch angle** — inclinación diagonal (tensión)
- **Bird's eye / overhead** — vista cenital

### Tipos de plano
- **Extreme wide** — establece locación
- **Wide / Full body** — sujeto completo + entorno
- **Medium** — de cintura para arriba
- **Close-up** — cara o detalle
- **Extreme close-up** — ojos, manos, texturas

### Técnicas especiales
- **Rack focus** — cambiar el foco de un objeto a otro (ej: cara → fondo)
- **Pull focus** — el foco sigue al sujeto en movimiento
- **Shallow depth of field** — fondo borroso, sujeto nítido
- **Lens flare** — destello de luz en la lente

---

*Destilado para Plexiz Generative Studio — 1 Abr 2026*
