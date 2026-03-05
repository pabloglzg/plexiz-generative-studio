# KIE.ai — API Gateway para Kling 3.0

## Configuración
- **Base URL:** `https://api.kie.ai`
- **File Upload Base:** `https://kieai.redpandaai.co`
- **Auth:** `Authorization: Bearer <API_KEY>`
- **Model:** `kling-3.0/video`

## Flujo Completo

### 1. Subir imágenes (GRATIS)
```bash
curl -X POST "https://kieai.redpandaai.co/api/file-stream-upload" \
  -H "Authorization: Bearer $KIE_API_KEY" \
  -F "file=@scene1.png" \
  -F "uploadPath=project-name" \
  -F "fileName=scene1.png"
```
Respuesta: `data.downloadUrl` → usar como `image_urls[0]`

⚠️ Archivos expiran en **3 días**.

### 2. Crear Task (Kling 3.0)
```bash
curl -X POST "https://api.kie.ai/api/v1/jobs/createTask" \
  -H "Authorization: Bearer $KIE_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
  "model": "kling-3.0/video",
  "input": {
    "prompt": "SOLO MOVIMIENTO Y CÁMARA — no describir personaje",
    "image_urls": ["https://tempfile.redpandaai.co/..."],
    "sound": true,
    "duration": "5",
    "aspect_ratio": "9:16",
    "mode": "pro",
    "multi_shots": false
  }
}'
```

### 3. Poll Status
```bash
curl "https://api.kie.ai/api/v1/jobs/recordInfo?taskId=TASK_ID" \
  -H "Authorization: Bearer $KIE_API_KEY"
```
Estados: `waiting` → `queuing` → `generating` → `success` / `fail`

### 4. Descargar resultado
```bash
# Extraer URL del resultJson
URL=$(... | python3 -c "import sys,json; print(json.loads(json.load(sys.stdin)['data']['resultJson'])['resultUrls'][0])")
curl -L -o output.mp4 "$URL"
```

## Resoluciones

| Modo | 16:9 | 9:16 | 1:1 |
|------|------|------|-----|
| **std** | 1280×720 | 720×1280 | 720×720 |
| **pro** | 1920×1080 | 1080×1920 | 1080×1080 |

## Costos
- ~135 créditos por clip (pro, 5s)
- Duración: 3-15 segundos
- Pro tarda ~3-5 min, puede variar

## Multi-Shot Mode
```json
{
  "multi_shots": true,
  "multi_prompt": [
    {"prompt": "Shot 1 action@element_char", "duration": 5},
    {"prompt": "Shot 2 action@element_char", "duration": 5}
  ],
  "kling_elements": [{
    "name": "element_char",
    "description": "blue mascot character",
    "element_input_urls": ["url1.png", "url2.png"]
  }]
}
```
- Hasta 5 shots, cada uno 1-12s
- Solo first frame (no last frame)
- Element references: 2-4 imágenes por elemento

## Element References
- Sintaxis: `@element_name` dentro del prompt
- Definir en `kling_elements[]` con `name`, `description`, `element_input_urls`
- 2-4 imágenes por elemento (JPG/PNG, max 10MB c/u)
- Útil para consistencia de personaje en multi-shot

## Créditos
```bash
curl "https://api.kie.ai/api/v1/chat/credit" \
  -H "Authorization: Bearer $KIE_API_KEY"
```

## Best Practices
1. **Prompt = SOLO movimiento + cámara** — el personaje viene del first frame
2. **1-2 frases máximo** — más largo = más confuso
3. **Una acción por shot** — nunca múltiple
4. **Especificar cámara SIEMPRE** — push-in, zoom, pan, hold steady
5. **`aspect_ratio` explícito** — aunque auto-detecta, mejor ser explícito
6. **`std` para testing, `pro` para final** — ahorra créditos en iteración
7. **Exponential backoff en polling** — no bombardear el API
8. **Si task stuck >15 min** — lanzar nuevo, el API tiene colas intermitentes
