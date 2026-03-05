# HeyGen Avatar IV - Proceso Exacto

> Documentado 16-FEB-26. Este es el proceso que FUNCIONA. No improvisar.

## Prerequisitos
- Imagen generada con Nano Banana Pro (9:16, 2K)
- Audio generado con ElevenLabs eleven_v3

## Paso 1: Subir imagen como Talking Photo

**Endpoint:** `POST https://upload.heygen.com/v1/talking_photo`
**Método:** Raw binary body (NO multipart form)

```python
import requests

url = "https://upload.heygen.com/v1/talking_photo"
headers = {
    "X-Api-Key": "sk_V2_hgu_kd4U6as7mhT_aK0Lpv7R3vXUKR2rmesaa8zwN28uZlFP",
    "Content-Type": "image/png"
}

with open("/path/to/imagen.png", "rb") as f:
    resp = requests.post(url, headers=headers, data=f.read())
    talking_photo_id = resp.json()["data"]["talking_photo_id"]
```

**⚠️ CRÍTICO:**
- Content-Type: `image/png` (o `image/jpeg` según formato)
- Body: raw bytes del archivo, NO multipart form-data
- NO usar campo "file", "data", "image", etc. — es body directo
- El endpoint está "deprecated" pero FUNCIONA

## Paso 2: Subir audio a URL pública

**NO usar Google Drive** — causa error "word time metadata missing" por los redirects.

**Usar tmpfiles.org:**
```bash
curl -s -F "file=@/path/to/audio.mp3" https://tmpfiles.org/api/v1/upload
```

Response: `{"status":"success","data":{"url":"http://tmpfiles.org/XXXXXXX/filename.mp3"}}`

**Convertir a URL directa:** Cambiar `tmpfiles.org/XXXXXXX/` → `tmpfiles.org/dl/XXXXXXX/`

Ejemplo: `https://tmpfiles.org/dl/24559508/jobita_audio.mp3`

**⚠️ Archivos en tmpfiles.org expiran en ~1 hora. Subir justo antes de generar.**

## Paso 3: Generar video con Avatar IV

**Endpoint:** `POST https://api.heygen.com/v2/video/generate`

```python
import requests, json

url = "https://api.heygen.com/v2/video/generate"
headers = {
    "X-Api-Key": "sk_V2_hgu_kd4U6as7mhT_aK0Lpv7R3vXUKR2rmesaa8zwN28uZlFP",
    "Content-Type": "application/json"
}

payload = {
    "video_inputs": [{
        "character": {
            "type": "talking_photo",
            "talking_photo_id": "<ID del paso 1>",
            "talking_style": "stable",
            "expression": "default",
            "super_resolution": True,
            "use_avatar_iv_model": True
        },
        "voice": {
            "type": "audio",
            "audio_url": "<URL directa del paso 2>"
        }
    }],
    "dimension": {
        "width": 1080,
        "height": 1920
    },
    "aspect_ratio": "9:16"
}

resp = requests.post(url, headers=headers, json=payload)
video_id = resp.json()["data"]["video_id"]
```

**Parámetros clave:**
- `use_avatar_iv_model: True` → activa Avatar IV
- `talking_style: "stable"` → movimiento suave
- `super_resolution: True` → mejor calidad
- `dimension` + `aspect_ratio` → AMBOS para asegurar 9:16

## Paso 4: Esperar y descargar

**Endpoint:** `GET https://api.heygen.com/v1/video_status.get?video_id=<VIDEO_ID>`

```python
import time

while True:
    resp = requests.get(
        f"https://api.heygen.com/v1/video_status.get?video_id={video_id}",
        headers={"X-Api-Key": "sk_V2_hgu_kd4U6as7mhT_aK0Lpv7R3vXUKR2rmesaa8zwN28uZlFP"}
    )
    data = resp.json()["data"]
    status = data["status"]
    
    if status == "completed":
        video_url = data["video_url"]
        break
    elif status == "failed":
        print(f"ERROR: {data.get('error')}")
        break
    
    time.sleep(30)  # Polling cada 30 seg
```

**Tiempos esperados:**
- Audio ~60 seg → video tarda ~8-10 min en procesarse
- Audio más corto → ~3-5 min

## Paso 5: Subir a Google Drive

```bash
gog drive upload /path/to/video.mp4 --parent <VIDEO_FOLDER_ID> --account pablo@plexiz.com
```

---

## Errores conocidos y soluciones

| Error | Causa | Solución |
|-------|-------|----------|
| "asset data must be provided" | Usando multipart form en upload | Usar raw binary body |
| "word time metadata missing" | Audio URL con redirects (Drive) | Usar tmpfiles.org URL directa |
| "talking_photo_id is invalid: Field required" | Intentando usar URL en vez de ID | Subir foto primero, usar el ID |
| Video sale 1:1 | Falta dimension + aspect_ratio | Poner AMBOS en el payload |

## Resultado exitoso (16-FEB-26)
- Video ID: `5a165ad78e274f3cb5fb26383619980a`
- Resolución: 1080x1920 (9:16) ✅
- Duración: 86.4 seg ✅
- Avatar IV ✅
- UN solo intento ✅
