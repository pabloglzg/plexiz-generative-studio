# Virtual Production Pipeline: Claude + Nano Banana + OpenArt Worlds

*Fuente: [Amir Mušić (@AmirMushich)](https://x.com/AmirMushich/status/2036169931612467708) — Creative Director, Ex-Warner Music / PepsiCo / Spotify. 341K views, 2,383 bookmarks.*

---

## Qué es

Un pipeline de producción visual de nivel agencia que combina Claude (brainstorming/prompting), Nano Banana (generación de imágenes), y OpenArt Worlds (mundos 3D persistentes) para lograr **consistencia total de escena, personaje y cámara** — el problema #1 de AI generativa para trabajo comercial.

## Por qué importa

| Problema | Antes | Con este pipeline |
|----------|-------|-------------------|
| Consistencia de escena | Cada generación cambia el fondo | Mundo 3D persistente — mismo escenario siempre |
| Control de cámara | No eliges ángulo, el modelo decide | Navegas el mundo y eliges la composición exacta |
| Consistencia de personaje | El modelo varía cara/ropa/poses | Character Kit de 4 ángulos, avatar reutilizable |
| Velocidad de campaña | Días/semanas para un set | Horas para escenario + personaje + shots |

## El Stack

| Herramienta | Rol en el pipeline | Costo |
|-------------|-------------------|-------|
| **Claude** | Deconstruir referencias → prompts detallados | Ya lo tenemos |
| **Nano Banana 2** (Gemini) | Generar escenas y personajes en 2D | Ya lo tenemos (API key activa) |
| **OpenArt Worlds** | Convertir imagen 2D → mundo 3D navegable | Desde $14.50/mes (Advanced, con derechos comerciales) |
| **OpenArt Characters** | Crear avatares consistentes multi-ángulo | Incluido en OpenArt |

---

## Pipeline Completo

### FASE 1: THE STAGE — Construir la locación

#### 1.1 Buscar referencia

**Dónde buscar:**
- Pinterest
- [Savee.it](https://savee.it)
- [ShotDeck.com](https://shotdeck.com) — referencia cinematográfica
- [FrameSet.app](https://frameset.app) — frames de películas
- [ArchDaily.com](https://archdaily.com) — arquitectura/interiores

**Términos de búsqueda para estudios virtuales:**
- Infinity cove
- Colored cyclorama studio
- Soundstage set design
- Limbo background lighting
- LED volume stage

#### 1.2 Deconstruir con Claude

Sube la imagen de referencia a Claude y usa este prompt:

```
Analyze this reference image and create a detailed generation prompt.

Break it down into these components:
- ENVIRONMENT: Describe the space, materials, surfaces, architectural elements
- LIGHTING: Direction, color temperature, shadows, ambient vs key light
- MOOD: Atmosphere, feeling, visual tone
- CAMERA: Angle, lens type, depth of field
- COLOR PALETTE: Dominant and accent colors with hex values if possible

Output a single, cohesive prompt optimized for image generation.
Do NOT include people, text, or branding elements.
Keep the space clean and empty — characters will be added separately.
```

#### 1.3 Generar con Nano Banana 2

- Copiar el prompt de Claude
- Generar en [OpenArt con Nano Banana 2](https://openart.ai)
- **Tip crítico:** NO agregar personajes, texto ni branding a la escena base. Mantenerla limpia para evitar distorsiones en el mundo 3D.

#### 1.4 Crear mundo 3D en OpenArt Worlds

- Ir a [openart.ai/suite/world](https://openart.ai/suite/world)
- Subir la imagen generada → "Create World"
- Esperar ~5 minutos
- El mundo es **persistente** — no cambia entre shots
- Navegar libremente, elegir ángulos, tomar capturas

---

### FASE 2: THE ACTOR — Crear personaje consistente

#### 2.1 Buscar referencia del personaje

**Dónde buscar:**
- [Savee.it](https://savee.it) — filtrar por editorial boards
- [Models.com](https://models.com) — casting shots limpios
- [Vogue Runway](https://www.vogue.com/fashion-shows) — styling de alta gama

**Términos de búsqueda:**
- High-fashion street casting polaroid
- Athletic sportswear editorial model full body
- Minimalist activewear turnaround
- Cinematic character portrait raw lighting

#### 2.2 Deconstruir con Claude

Sube la imagen de referencia del modelo a Claude:

```
Analyze this character reference and create a detailed generation prompt.

Break it down into:
- PHYSICAL: Age range, build, skin tone, hair (color, length, style)
- CLOTHING: Every garment top to bottom, fabrics, fits, colors
- ACCESSORIES: Jewelry, bags, shoes, watches — be specific
- EXPRESSION: Facial expression, gaze direction, energy
- POSE: Body position, weight distribution, hand placement

Output a single prompt with a [FRAMING & ANGLE] variable placeholder.
This prompt will be used 4 times with different framing values.
Background should be: clean studio, soft neutral lighting, no distractions.
```

#### 2.3 Generar 4 vistas con Nano Banana 2

Usar el prompt de Claude, reemplazando `[FRAMING & ANGLE]` con:

1. **Full Body Shot, frontal view** — silueta completa, ropa y zapatos visibles
2. **Bust Up Close-up portrait** — detalle de cara, pelo, accesorios superiores
3. **Strict Profile view** — vista lateral completa
4. **From Behind (back view)** — espalda, pelo por detrás, zapatos desde atrás

Generar las 4 imágenes por separado.

#### 2.4 Crear Character en OpenArt

- Ir a [OpenArt Characters](https://openart.ai)
- Subir las 4 imágenes
- OpenArt sintetiza un avatar consistente
- Darle nombre al personaje
- Invocarlo con **@nombre** en cualquier prompt o mundo

---

### FASE 3: TOKEN MATRIX — Control preciso de prompts

En vez de escribir párrafos, usar tokens modulares que se insertan en un **Base Prompt**:

#### Tokens de Cámara y Espacio
```
[FRAMING]:
- Extreme Wide Shot — vista más amplia del espacio
- Full Body Shot — cuerpo completo, foco en silueta y outfit
- Medium Shot — de cintura para arriba
- Bust Up / Close-up — retrato cercano
- Extreme Close-up — detalle (ojos, manos, texturas)

[POSITION]:
- Centered Composition — simetría perfecta
- Left-Aligned — sujeto a la izquierda
- Right-Aligned — sujeto a la derecha
- Rule of Thirds — intersecciones de tercios

[ANGLE]:
- Eye Level — a la altura de los ojos
- Low Angle — cámara baja mirando hacia arriba
- High Angle — cámara alta mirando hacia abajo
- Dutch Angle — inclinación diagonal
- Overhead / Bird's Eye — vista aérea cenital
```

#### Tokens de Energía y Expresión
```
[KINETIC ENERGY]:
- Static/Still — pose estática, control total
- Subtle Movement — movimiento sutil (pelo, tela)
- Dynamic Motion — acción clara (caminar, girar)
- Explosive Energy — movimiento extremo (saltar, correr)

[EXPRESSION]:
- Neutral Gaze — mirada neutra a cámara
- Candid / Off-Guard — momento natural capturado
- Intense / Dramatic — expresión intensa
- Joyful / Laughing — expresión alegre
- Pensive / Looking Away — mirada pensativa, fuera de cámara
```

#### Base Prompt Template
```
[SCENE DESCRIPTION]. [CHARACTER @nombre] in [FRAMING], [POSITION], 
shot from [ANGLE]. [KINETIC ENERGY]. [EXPRESSION]. 
[LIGHTING DESCRIPTION]. [ADDITIONAL STYLE NOTES].
```

---

### FASE 4: THE BUSINESS — De raw a asset comercial

Una vez generadas las imágenes:

1. **Post-producción ligera** — Photoshop/Lightroom para ajustes finos de color y retoque
2. **Agregar branding** — logos, tipografía, CTAs en post (NO durante la generación)
3. **Adaptar formatos** — recortar a 1:1, 9:16, 16:9 según plataforma
4. **Pasar a video** — usar como keyframe para Kling 3.0 o Seedance
5. **Iterar** — volver al mundo 3D para nuevos ángulos sin regenerar nada

---

## Datos de performance (fuente: Amir Mušić)

- Imágenes con personas: **3x mejor engagement rate** en redes
- **60% mejor** en eye-tracking
- **30%+ mejor CTR** en ads

---

## Cuándo usar este pipeline

✅ **Ideal para:**
- Campañas con múltiples shots del mismo escenario
- Contenido de producto que necesita consistencia visual
- Pitches y mockups fotorrealistas rápidos
- Influencers AI con personaje recurrente
- Social media content at scale

❌ **NO usar para:**
- Un solo shot rápido (overkill — usa Nano Banana directo)
- Video generativo (Kling/Seedance son mejores)
- Retoque fotográfico fino (Photoshop sigue siendo rey)
- Assets 3D exportables (Worlds aún no exporta mesh)

---

## Pricing de OpenArt (marzo 2026, precio anual)

| Plan | $/mes | Créditos | Imágenes | Personajes | Comercial |
|------|-------|----------|----------|------------|-----------|
| Essential | $7 | 4,000 | ~4,000 | ~13 | ❌ |
| **Advanced** | **$14.50** | **12,000** | **~12,000** | **~40** | **✅** |
| Infinite | $28 | 24,000 | ~24,000 | ~80 | ✅ |
| Wonder | $120 | 106,000 | ~106,000 | ~353 | ✅ |

**Recomendación:** Advanced ($14.50/mes) para empezar. Incluye derechos comerciales + suficientes créditos para probar.

---

## Links

- [OpenArt Worlds](https://openart.ai/suite/world)
- [OpenArt Characters](https://openart.ai)
- [Artículo original (Amir Mušić)](https://x.com/AmirMushich/status/2036169931612467708)
- Prompts y tokens completos: Notion Doc de Amir (link en el artículo original)

---

*Destilado para Plexiz Generative Studio — 29 Mar 2026*
