# 📋 PLEXIZ — Brief Generator Skill
> Versión: 1.0 | Creado: 2026-03-07 | Autor: Subsy (para Pablo González)
> **Bobe's mandate:** "Haz un skill para que todos nuestros briefs salgan igualitos"

---

## Propósito

Este skill genera briefs estandarizados para TODOS los entregables de Plexiz, siguiendo el **Strategy First Workflow (SFW)** de Pau Buchanan.

**Regla de oro:** El brief documenta una decisión estratégica que ya fue tomada. NUNCA es el punto de partida — la estrategia va primero.

---

## Cuándo usar este skill

**✅ SÍ usar cuando:**
- Ya hubo junta estratégica con Pau → cuenta → AM
- El cliente dio input/solicitud
- Se va a meter en Monday para producción
- Dani, Celene, Rubén, Gaby necesitan instrucciones claras

**❌ NO usar cuando:**
- No hay contexto estratégico aún → primero junta con Pau
- Es un cambio menor sobre pieza existente (usar update, no brief nuevo)

---

## Flujo de Trabajo

```
Solicitud cliente
      ↓
Investigación (AM)
      ↓  
Junta estratégica (Pau + AM) → DECISIÓN ESTRATÉGICA
      ↓
ESTE SKILL → Brief con Claude
      ↓
Monday → Producción → QA 0 → QA 1 → QA 2 → Publicación
```

### Opción A — Junta grabada (recomendado):
1. Graba la junta con **Fireflies.ai**
2. Exporta notas/transcript a **Granola**
3. Pega el resumen aquí → el skill genera el brief automáticamente

### Opción B — Input manual:
Responde las preguntas del skill una por una.

---

## Proceso del Skill

### PASO 1 — Identificar el tipo de entregable

Pregunta obligatoria antes de cualquier otra:

> "¿Qué tipo de entregable es este brief?"
> 1. 🎬 Video (reel, TikTok, YouTube, corporativo)
> 2. 🎨 Diseño gráfico (post, story, banner, flyer, carrusel)
> 3. 🌐 Web design (landing page, micrositio, actualización)
> 4. 🎥 Producción (sesión foto/video profesional)
> 5. ✉️ Newsletter / Email

El tipo determina qué secciones y preguntas aplican.

---

### PASO 2 — Recopilar contexto

Si el usuario pegó notas de Granola/Fireflies, extrae automáticamente. Si no, pregunta:

**Contexto universal (todos los tipos):**
```
1. Cliente/Cuenta: [nombre del cliente]
2. Campaña/Proyecto: [contexto general, si aplica]
3. Objetivo del negocio: ¿Qué quiere lograr el cliente con esta pieza?
4. Audiencia objetivo: ¿A quién va dirigido? (demo, pain points, momento de vida)
5. Mensaje principal: En UNA oración — ¿qué debe recordar la audiencia?
6. Mensajes secundarios: 2-3 puntos de soporte
7. Call to Action: ¿Qué acción debe tomar la audiencia?
8. Tono de voz: [formal/casual/aspiracional/cercano/técnico/otro]
9. Timeline: ¿Cuándo se necesita? ¿Hay fechas de aprobación clave?
10. Restricciones: Legal, marca, presupuesto, recursos disponibles
```

**Contexto por tipo de entregable:**

#### 🎬 Video
```
- Duración objetivo: [segundos/minutos]
- Formato: [9:16 / 16:9 / 1:1 / otro]
- Plataforma principal: [TikTok / Reels / YouTube / LinkedIn / corporativo]
- ¿Hay talent/vocero? ¿Quién? ¿Actor, empleado, AI (HeyGen)?
- Estilo visual: [referencia, moodboard URL, descripción]
- ¿Subtítulos? ¿En qué idioma?
- ¿Música? [estilo, mood, si ya tienen track]
- Script disponible: [sí/no — si sí, pegar aquí]
- ¿Over-performer potential? Justificar por qué podría superar 2x alcance promedio
```

#### 🎨 Diseño Gráfico
```
- Tipo de pieza: [post, story, carrusel, banner, flyer, infografía]
- Dimensiones: [px o formato]
- Plataforma: [Instagram, Facebook, LinkedIn, imprimir, OOH]
- Elementos obligatorios: [logo, tagline, producto específico, precio]
- Paleta de color: [colores de marca o libre]
- Tipografía: [fuentes de marca]
- ¿Assets disponibles? [fotos, íconos, ilustraciones del cliente]
- ¿Variantes necesarias? [cuántos formatos/idiomas]
```

#### 🌐 Web Design
```
- Tipo: [landing page nueva, actualización, micrositio]
- URL actual (si aplica): 
- Objetivo de conversión: [lead, venta, registro, descarga]
- Secciones requeridas: [hero, features, testimonials, CTA, FAQ...]
- Copy: [¿lo escribimos o el cliente provee?]
- Tecnología/CMS: [WordPress, Webflow, Framer, custom]
- Responsive: [mobile-first obligatorio]
- Integraciones: [formulario, CRM, pixel, analytics]
```

#### 🎥 Producción
```
- Tipo de sesión: [foto, video, entrevista, evento]
- Locación: [estudio, exterior, instalaciones cliente]
- Talent necesario: [nombres o perfiles]
- Equipment checklist: [cámara, luces, audio, teleprompter]
- # de piezas esperadas post-producción
- Entregables de post: [edición, corrección color, subtítulos, formato]
```

#### ✉️ Newsletter / Email
```
- Plataforma: [Mailchimp, HubSpot, Klaviyo, otro]
- Segmento: [lista, etiqueta, criterio de filtro]
- Asunto propuesto (2-3 opciones)
- Estructura: [secciones del email]
- CTA principal + URL de destino
- Personalización requerida: [nombre, empresa, otro]
```

---

### PASO 3 — Generar el Brief

Una vez recopilado el contexto, genera el brief en este formato estandarizado:

---

## TEMPLATE: BRIEF PLEXIZ

```markdown
# 📋 BRIEF — [NOMBRE DEL ENTREGABLE]
**Folio:** PX-[AÑO]-[###]  
**Cuenta:** [Cliente]  
**Tipo:** [Video / Diseño / Web / Producción / Newsletter]  
**Fecha de brief:** [YYYY-MM-DD]  
**Fecha de entrega:** [YYYY-MM-DD]  
**Strategist:** Pau Buchanan  
**Account Manager:** [Nombre AM]  
**Project Manager:** [Nombre PM]  
**Creativo responsable:** [Nombre]  

---

## 🎯 OBJETIVO ESTRATÉGICO
> [En 2-3 líneas: qué quiere lograr el cliente, conectado con su estrategia de negocio. No es el objetivo creativo — es el objetivo de negocio.]

**KPI de éxito:** [¿Cómo medimos si esta pieza funcionó?]  
**Over-performer potential:** [¿Podría superar 2x el alcance promedio? Justificar.]

---

## 👤 AUDIENCIA
**Perfil primario:** [Edad, género, ocupación, plataforma principal]  
**Momento de vida:** [¿Qué está viviendo esta persona? ¿Qué problema tiene?]  
**Qué sabe de la marca:** [nada / algo / fan consolidado]

---

## 💬 MENSAJE
**Principal (una oración):**  
> "[El mensaje que debe quedarse grabado]"

**Mensajes secundarios:**
1. [Punto de soporte 1]
2. [Punto de soporte 2]
3. [Punto de soporte 3 — opcional]

**Call to Action:**  
> "[Acción específica que queremos que tome la audiencia]"  
> **Destino:** [URL, número, lugar, acción offline]

---

## 🎨 DIRECCIÓN CREATIVA
**Tono de voz:** [Formal / Cercano / Aspiracional / Técnico / Humor / Urgente]  
**Estilo visual:** [Descripción en 2-3 líneas + referencia/moodboard si existe]  
**Paleta:**  [Colores específicos o referencia a brandbook]  
**Referencias:** [Links o nombres de piezas inspiración]

---

## 📐 ESPECIFICACIONES TÉCNICAS
[Sección variable según tipo de entregable — ver detalles abajo]

---

## ⚠️ RESTRICCIONES
- **Legales:** [Claims prohibidos, disclaimers necesarios, menciones reguladas]  
- **Marca:** [Elementos que NO deben aparecer, uso correcto de logo]  
- **Técnicas:** [Limitaciones de plataforma, peso de archivo, etc.]  
- **Presupuesto/Recursos:** [Si aplica]

---

## 📅 TIMELINE
| Etapa | Fecha | Responsable |
|-------|-------|-------------|
| Brief aprobado | [fecha] | AM |
| Primer concepto / borrador | [fecha] | Creativo |
| QA 0 — Revisión creativa | [fecha] | Director Creativo |
| QA 1 — Revisión técnica | [fecha] | PM |
| QA 2 — Revisión estratégica | [fecha] | AM |
| Aprobación final cliente | [fecha] | AM |
| Publicación / entrega | [fecha] | Community / AM |

---

## 📎 ASSETS DISPONIBLES
- [ ] Logo en alta resolución
- [ ] Fotos del producto/servicio
- [ ] Videos de referencia
- [ ] Copy base del cliente
- [ ] Credenciales de plataformas
- [ ] Otros: [especificar]

---

## 💡 NOTAS ADICIONALES
[Contexto extra de la junta, decisiones tomadas, qué fue descartado y por qué]

---

## ✅ FIRMAS DE APROBACIÓN
- **Strategist (Pau):** _________________ Fecha: _______
- **Account Manager:** _________________ Fecha: _______  
- **Cliente (si aplica):** _______________ Fecha: _______
```

---

## Especificaciones Técnicas por Tipo

### 🎬 Video
```markdown
## 📐 ESPECIFICACIONES TÉCNICAS — VIDEO
**Duración:** [seg / min]  
**Formato/Aspecto:** [9:16 vertical / 16:9 horizontal / 1:1 cuadrado]  
**Resolución mínima:** [1080p / 4K]  
**Plataforma principal:** [TikTok / Instagram Reels / YouTube / Facebook / LinkedIn / Otro]  
**Plataformas secundarias (si aplica):** [lista]  
**Talent:** [Nombre, tipo: real/AI, instrucciones de dirección]  
**Subtítulos:** [Sí / No | Idioma | Estilo]  
**Voz en off:** [Sí / No | Tono | ElevenLabs Voice ID si aplica]  
**Música:** [Estilo / Track específico / Libre de derechos necesaria]  
**Script:** [Incluido abajo / Por desarrollar / Ya aprobado]

### Script (si disponible):
[Pegar aquí o marcar "pendiente"]
```

### 🎨 Diseño Gráfico
```markdown
## 📐 ESPECIFICACIONES TÉCNICAS — DISEÑO
**Tipo de pieza:** [post / story / carrusel / banner / flyer / otro]  
**Dimensiones:** [1080x1080px / 1080x1920px / otro]  
**Formato de entrega:** [PNG / JPG / PDF / MP4 si tiene animación]  
**Plataforma:** [Instagram / Facebook / LinkedIn / Impresión / OOH]  
**Variantes requeridas:** [lista de formatos o idiomas]  
**Fuentes:** [Lista de fuentes de marca o libre]  
**Elementos obligatorios:** [Logo, tagline, producto, precio, etc.]  
**Elementos prohibidos:** [Lo que NO debe aparecer]
```

---

## Estándares de Calidad

Antes de entregar el brief, verificar:

- [ ] **Objetivo estratégico** conecta con meta de negocio del cliente (no es solo "hacer una pieza bonita")
- [ ] **Mensaje principal** cabe en una oración y es memorable
- [ ] **CTA** es específico y accionable (no "visítanos en redes")
- [ ] **Timeline** tiene fechas reales (no "ASAP")
- [ ] **Responsables** están asignados en cada etapa
- [ ] **Restricciones** documentadas para evitar rechazos en QA
- [ ] **Over-performer check** — si no hay argumento para superar 2x → replantear enfoque

---

## Reglas Importantes

1. **Un brief = una pieza.** Si son 3 formatos del mismo concepto → 1 brief con variantes. Si son 3 conceptos distintos → 3 briefs.
2. **Folio obligatorio.** Formato: PX-2026-001 (siguiente número disponible en Monday).
3. **Brief va a Monday antes de producción.** No hay producción sin brief en Monday aprobado.
4. **QA sin triple review no sale.** QA 0 + QA 1 + QA 2 son obligatorios, no opcionales.
5. **El brief es el contrato interno.** Si no está en el brief → no es un requerimiento oficial.

---

## Prompts de Referencia Rápida

### Para extraer brief de notas de junta (Fireflies/Granola):
```
Estas son las notas de una junta estratégica de Plexiz Media. 
Extrae la información necesaria para llenar un brief estandarizado.
Identifica: cliente, objetivo, audiencia, mensaje principal, tipo de entregable, 
restricciones, y cualquier decisión creativa mencionada.
Si algo no está claro, marca como [PENDIENTE — preguntar a AM].

NOTAS:
[pegar aquí]
```

### Para completar un brief a medias:
```
Este es un brief de Plexiz incompleto. Identifica qué secciones 
faltan o están vagas y genera preguntas específicas para el AM 
o el cliente que permitan completarlas.
```

---

## Sobre el Triple QA

| QA | Quién | Qué revisa |
|----|-------|------------|
| QA 0 | Director Creativo | ¿Está bien ejecutado? ¿Calidad visual/técnica? ¿Coherencia con brief? |
| QA 1 | Project Manager | ¿Cumple specs técnicas? ¿Formatos correctos? ¿Sin errores de producción? |
| QA 2 | Account Manager | ¿Cumple el objetivo estratégico? ¿Mensaje correcto? ¿Alineado con cliente? |

**Nada sale sin pasar los 3 QAs.** Si hay duda en QA 2 → regresa a creativo, NO al cliente.

---

## Conexión con Herramientas Plexiz

- **Reuniones:** Grabar con Fireflies.ai → exportar a Granola → paste aquí
- **Tracking:** Brief aprobado → crear card en Monday con número de folio
- **Archivos:** Assets van a Google Drive → `Cuentas/[Cliente]/[Campaña]/Brief-PX-XXXX/`
- **Comunicación:** Brief es el documento de referencia para TODOS — si no está en el brief, no cuenta

---

*Skill creado por Subsy para Plexiz Media — Strategy First, siempre.*
