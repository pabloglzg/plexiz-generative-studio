---
name: ai-video-generation
description: AI video generation with Kling 3.0, Runway, Sora, and other image/text-to-video models. Triggers on "Kling", "AI video", "generate video", "text to video", "image to video", "video generation", "animate character", "AI clip", "video AI", "Runway", "Sora", "Pika", "Luma Dream Machine", "Seedance", "Hailuo"
---

# AI Video Generation — Production System

## Philosophy
**Treat AI video like a shoot day, not a casino.**
Every generation costs credits. Plan shots, write precise prompts, minimize retries. Generation is for story and motion. Editing is for timing, text, and polish.

---

## 🎯 The 5-Part Prompt Spine (MANDATORY)

Every prompt MUST have these 5 elements. No exceptions.

```
1. WHO    — Clear subject with specific visual descriptors
2. WHAT   — ONE single action (never multiple)
3. WHERE  — Environment / setting
4. STYLE  — Appearance, lighting, mood
5. CAMERA — Specific camera move or angle
```

### Example — BAD:
```
A cool character walks into a room and looks around and picks something up, cinematic vibes
```

### Example — GOOD:
```
WHO: Blue blob character with light-blue Frikko baseball cap, dark mustache, tool belt with wrench and screwdriver
WHAT: Walks confidently through a front door carrying a red toolbox
WHERE: Bright suburban home entrance, morning light through windows
STYLE: 3D Pixar-style render, soft shadows, warm lighting, shallow depth of field
CAMERA: Medium shot, slow dolly-in following the character from behind
```

### Flattened for Kling input:
```
Blue blob character with light-blue Frikko baseball cap, dark mustache, and tool belt walks confidently through a bright suburban home entrance carrying a red toolbox. 3D Pixar-style render with soft shadows and warm morning light. Medium shot, slow dolly-in from behind. Shallow depth of field.
```

### Extended 7-Part Spine (for maximum control):
```
1. CAMERA   — medium tracking shot, slow dolly-in
2. SUBJECT  — who is in the shot (full visual description)
3. ACTION   — what they're doing (ONE action)
4. ENVIRONMENT — setting, location, background
5. LIGHTING — warm morning light, dramatic shadows, neon glow
6. TEXTURE  — soft focus, film grain, clean 3D render
7. AUDIO    — dialogue, ambient sounds, music cues
```
Parts 5-7 are optional but improve output quality significantly.

---

## 🔑 Rules That Save Credits

### 1. One Subject, One Action, One Shot
- If you want two actions → that's two generations
- Complex scenes with multiple characters doing different things = wasted credits
- Think in 10-15 second beats, not story arcs

### 2. Character Consistency = Repeat Exact Descriptors
- NEVER say "the guy", "our hero", "the character" in follow-up shots
- ALWAYS repeat the full short description every single time:
  - ✅ "Blue blob character with light-blue Frikko cap, dark mustache, tool belt"
  - ❌ "Lucio" or "the blue character from before"
- Anchor character clearly in Shot 1, then copy-paste descriptors to every subsequent shot

### 3. Specify Camera Moves (Kills "Meh" Clips)
Vague prompts = static boring output. Always specify:

| Camera Move | When to Use |
|-------------|-------------|
| `slow dolly-in` | Building tension, focus on subject |
| `locked-off tripod shot` | Clean, stable, professional |
| `low-angle close-up` | Power, authority, hero moment |
| `tracking shot from side` | Walking, movement scenes |
| `slow orbit around subject` | Product reveal, 360 showcase |
| `push-in to face` | Emotional beat, reaction |
| `pull-back reveal` | Establishing shot, surprise |
| `crane up` | Epic, grand, establishing |
| `handheld slight shake` | Documentary, raw, urgent |
| `static wide shot` | Context, environment |

### 4. Minimum 10 Seconds Per Clip
- 3-second clips look cool in the interface, useless in edit
- 10-15 seconds gives room to cut, punch in, find the moment
- Fewer but longer generations = less total spend

### 5. Don't Fix in Generation — Fix in Edit
Stop regenerating entire clips for:
- Subtitle/text tweaks
- Minor timing issues
- Logo/overlay additions
- Trimming 2 seconds

Generation = story + motion. Everything else = post-production.

---

## 💸 Budget Framework

### Cost Reality (Kling 3.0)
- **Per usable clip:** $0.50 - $1.50 (factoring retries)
- **45%** of spend = experiments that never get used
- **35%** = retries of "almost there" shots
- **20%** = actual keepers

### Budget by Use Case
| User Type | Generations/Session | Budget Estimate |
|-----------|-------------------|-----------------|
| Hobbyist/Testing | 5-10 | $5-15 |
| Serious creator | 20-30 per project | $15-45 |
| Agency work | 40-80 with shot list | $30-120 |

### How to Cut Costs
1. **Plan before generating** — write shot list first
2. **Use free daily credits for experiments** — paid credits for planned shots only
3. **Test at lower quality first** — only upscale keepers
4. **Batch similar shots** — same character, same environment, change only the action

---

## 🎬 Shot List Template

Before touching any AI video tool, fill this out:

```markdown
# Project: [Name]
# Character: [Full visual description — copy-paste this into EVERY prompt]
# Style: [Visual style that stays consistent across all shots]

## Shot List

### Shot 1 — [Beat name]
- Action: [Single action]
- Environment: [Setting]
- Camera: [Specific move]
- Duration: [10-15s]
- Audio: [Who speaks, what line, what tone, background sound]

### Shot 2 — [Beat name]
- Action: ...
- Environment: ...
- Camera: ...
- Duration: ...
- Audio: ...

[repeat for each shot]
```

---

## 🎬 Shot Sequence Technique (Kling 3.0 Multi-Shot)

Kling 3.0 thinks in coverage, not clips. Write prompts like a director writes a shot list — each prompt = one beat in a scene.

### The Pattern: Wide → Medium → Insert → Reaction

```
Shot 1 (WIDE/ESTABLISH):
Wide crane down into the workshop. Lucio stands at workbench organizing tools.
Slow dolly in. Ambient hum of AC units, fluorescent lighting.

Shot 2 (MEDIUM/PERFORMANCE):
Medium over-shoulder as Lucio inspects a mini-split unit on the wall.
35mm lens feel, subtle handheld sway. Focus shifts to the unit's display panel.

Shot 3 (INSERT/DETAIL):
Close-up on Lucio's gloved hands adjusting a thermostat dial.
Shallow depth of field. Quick snap zoom as the display lights up green. Soft beep.

Shot 4 (REACTION/PAYOFF):
Medium shot — Lucio steps back, crosses arms, nods approvingly.
Cool air visibly flows. He tips his Frikko cap to camera. Satisfied smile.
```

### Why This Works:
- Each shot is 3-10 seconds (how real scenes are built on set)
- You're speaking **editor grammar**: establish, perform, detail, resolve
- Kling translates camera language into actual camera motion
- Output = rough storyboard with motion + sound, not random cool moment
- You can already CUT this sequence in post

### Beat Structure for Any Scene:
1. **Entry** — establish the space and character
2. **Action** — the main thing happening
3. **Detail** — close-up that sells the moment
4. **Resolution** — character reacts, scene lands

---

## 🔊 Audio Direction

When the model supports native audio, be explicit:

```
BAD:  "Characters talking in a bar"
GOOD: "Man says 'I told you this would work' in a confident, low voice. 
       Woman laughs softly. Background: muffled bar chatter, jazz piano."
```

Specify:
- **Who** speaks
- **Exact line** (in quotes)
- **Tone** (confident, nervous, excited, whispered)
- **Background sound** (ambient noise, music, silence)

---

## ❌ What Burns Credits Fast (Avoid)

1. **Huge crowds** with everyone doing something detailed
2. **Complex VFX** — explosions, fire, heavy particles in one shot
3. **Fast chaotic action** with many cuts baked into one prompt
4. **Multiple speaking characters** without clear audio direction
5. **"Vibes-only" prompts** — poetic but no clear subject/action
6. **Free-tier mentality on paid plans** — spamming "let's see what happens"

---

## 🛠️ Tool-Specific Notes

### Kling 3.0
- Best for: Realistic motion, character consistency, native audio
- **Thinks in SEQUENCES, not shots** — chains shots with transitions and continuity in one run
- Multi-shot mode: Define 3-15 second sequences that feel like rough animatics
- Subject binding: Character survives across angles (same jacket, face, hair)
- Image-to-video: Start with key art/character design → Kling moves them through sequence
- **Camera language is first-class** — dolly, crane, handheld, POV, whip pan all work
- Native audio: Dialogue, ambience, footsteps (audio trails visuals but good for previz)
- Sweet spot: 10-15s clips, 720p for testing, 1080p for finals
- Always repeat exact character descriptors in every prompt

**Kling 3.0 is lethal for:**
- Pitch films and sizzle reels
- Animatics for agencies (show mood piece instead of static deck)
- Look tests and mood pieces
- Series concepts you want to SHOW instead of describe
- YouTube format experiments before building full sets

**Where it's NOT ready (use for previz, not final):**
- Ultra-clean dialogue and voice nuance
- Flawless photoreal close-ups in all lighting
- Perfect anatomy in extreme poses
- Pixel-crisp text and UI elements

**⚠️ Known Limitations:**
- **Lip sync breaks after ~10 seconds** — keep dialogue in first 10s, use action-only for remaining 5s
- **Morphing increases with complexity + length** — simpler prompts or <10s = less morphing
- **Multi-shot NOT available with both start AND end frame** — only start frame or text-only
- **More references = more glitching** — 1-3 refs = stable, 5-7 refs = risky for complex scenes

**3 Generation Methods (from least to most control):**
1. **Text-to-video** — type prompt, AI decides everything. Quick but unpredictable.
2. **Multi-shot** — up to 6 shots per generation, custom duration each (within 15s total). Good for sequences.
3. **Image-to-video (start/end frame)** — most popular, most control. Start frame = visual reference, AI only does motion.

**Continuous Video Technique:**
Grab last frame of generated clip → use as start frame for next generation. Chain clips together for longer sequences.

**3-Angle Character Trick:**
Feed AI front + side + back angles of your character to prevent glitching and inconsistency. Use Nano Banana Pro to generate 3 angles from one image:
```
Generate three views of this character: front-facing, left side profile, 
and back view. Maintain exact same clothing, proportions, and details. 
Clean background, consistent lighting across all three angles.
```

**Meta-Prompting:**
Feed Kling's official prompt docs + your character image to ChatGPT/Claude → get optimized multi-shot prompt. Still review and rewrite — don't blindly paste AI output.

**Movement Carries Between Shots:**
If character is leaning in at end of shot 1, shot 2 picks up that momentum. Use this for continuity — end shots with directional energy that the next shot can continue.

### Seedance 2.0 (ByteDance)
- Best for: Character consistency, quad-modal (text+image+audio+motion)
- 90%+ usable rate reported
- Monitor for CapCut global integration

### Runway Gen-3/4
- Best for: Stylized content, artistic looks
- More expensive per clip than Kling

### Sora (OpenAI)
- Best for: Cinematic quality, longer clips
- Limited availability, expensive

### Pika
- Best for: Quick iterations, lower cost
- Good for testing concepts before committing to Kling

### Hailuo / MiniMax
- Best for: Fast generation, decent quality
- Good budget option for volume work

### JoggAI
- Best for: Talking head videos with avatars
- Native 9:16 without aspect ratio bugs
- Free tier available

---

## 📐 Format Reference

| Platform | Aspect | Resolution | Duration Sweet Spot |
|----------|--------|------------|-------------------|
| TikTok/Reels | 9:16 | 1080×1920 | 15-60s |
| YouTube Shorts | 9:16 | 1080×1920 | 15-60s |
| YouTube | 16:9 | 1920×1080 | 30s-5min |
| Instagram Feed | 1:1 or 4:5 | 1080×1080 / 1080×1350 | 15-60s |
| Stories | 9:16 | 1080×1920 | 5-15s |
| Presentation | 16:9 | 1920×1080 | 5-30s |

---

## 🔄 Production Workflow

```
1. PLAN    → Shot list with 5-part spine for each shot
2. TEST    → Low-quality/free credits to validate concept
3. GENERATE → Paid credits, planned shots only
4. SELECT  → Pick keepers (expect ~20% hit rate initially, ~50% with good prompts)
5. EDIT    → CapCut/Premiere/DaVinci for timing, text, music, polish
6. EXPORT  → Platform-specific format
```

---

## 💼 Use Case: Client Pitch Workflow

En vez de mandar un deck estático al cliente, genera un mood piece de 30 segundos:

1. Escribe shot list con el tono exacto que quieres vender
2. Genera en Kling 3.0 con image-to-video (adjunta key art del personaje/marca)
3. Corta en CapCut/Premiere — agrega música, texto, logo
4. Muestra al cliente: "así se va a ver tu contenido"

Esto es **exactamente** lo que Plexiz puede ofrecer: previz de campañas de video antes de producción real. Lucio, Don Chuy, cualquier mascota/personaje de cliente.

---

## 📚 References
- @rovvmut_ "Kling 3.0: I Burned $1,000 in Credits So You Don't Have To" (Feb 27, 2026) — 79 ❤️, 120 🔖
  - Saved: `articles/2026-02-27-kling-3-prompt-guide.md`
- @AngryTomtweets "Kling 3.0: AI Video Model That Thinks Like a Filmmaker" (Feb 28, 2026) — 117 ❤️
  - Saved: `articles/2026-02-28-kling3-filmmaker-guide.md`
- "STOP Wasting Credits & Master Kling 3.0 in 25 Minutes" (YouTube, ~Mar 2026)
  - 3 methods, multi-shot details, references system, lip sync limits, 3-angle trick
  - Saved: `articles/2026-03-01-kling3-masterclass-video.md`
- Kling 3.0 complete guide: https://invideo.io/blog/kling-3-0-complete-guide/
- See also: `skills/motion-design/SKILL.md` for Remotion/GSAP animation
- See also: `skills/ai-influencer/SKILL.md` for HeyGen avatar pipeline
