---
name: motion-design
description: Professional video production with Remotion + Figma + GSAP animation principles. Triggers on "video", "animation", "motion design", "remotion", "video transition", "logo animation", "product video", "explainer video", "promo video", "render video", "motion graphics", "animate", "GSAP", "GreenSock"
---

# Motion Design — Professional Animation System

## ⚠️ MANDATORY WORKFLOW — Follow in order, NO SKIPPING

### Step 1: Understand the Idea
- Get the COMPLETE concept before touching anything
- Goal, audience, tone/style, duration, format (9:16 / 16:9 / 1:1)
- Plan each scene: what happens, what transitions to next, what makes it visually interesting

### Step 2: Gather Assets
- ALL visual files: logos, images, fonts, brand colors
- Save everything to `public/` before proceeding

### Step 3: Design in Figma (DO NOT SKIP)
- One frame per scene at target resolution
- Pixel-perfect: sizes, positions, typography, spacing
- Separate elements on layers for animation
- Get user approval BEFORE moving to code

### Step 4: Build in Remotion (with GSAP principles)
- Reference approved Figma frames
- Apply the Animation System below
- Every transition intentional and creative

### Step 5: Audio + Polish
- Background music, SFX, voiceover (ElevenLabs)
- Sync to beats if using music

### Step 6: Render + Deliver
- `npx remotion render` with appropriate codec/resolution

---

## 🎯 Animation System — The GSAP-Informed Approach

### Philosophy
We use **Remotion** for rendering (frame-by-frame → MP4), but we think in **GSAP principles** — timing, easing, sequencing, and stagger. The knowledge transfers directly.

### The 4 Pillars

#### 1. TIMING — Position Parameter Thinking
GSAP's position parameter is the most powerful concept in animation sequencing.

**In GSAP:**
```js
tl.to(".a", { x: 100 })           // sequential (default)
tl.to(".b", { y: 50 }, "-=0.5")   // overlap 0.5s with previous
tl.to(".c", { z: 10 }, "<")       // start WITH the previous
tl.to(".d", { w: 20 }, "<0.2")    // 0.2s after previous STARTS
```

**Translated to Remotion:**
```tsx
// Sequential: each scene starts after previous ends
<Sequence from={0} durationInFrames={90}><SceneA /></Sequence>
<Sequence from={90} durationInFrames={90}><SceneB /></Sequence>

// Overlap "-=0.5" (15 frames at 30fps):
<Sequence from={0} durationInFrames={90}><SceneA /></Sequence>
<Sequence from={75} durationInFrames={90}><SceneB /></Sequence>

// Start together "<":
<Sequence from={0} durationInFrames={90}><SceneA /></Sequence>
<Sequence from={0} durationInFrames={90}><SceneB /></Sequence>

// Staggered start "<0.2" (6 frames at 30fps):
<Sequence from={0} durationInFrames={90}><SceneA /></Sequence>
<Sequence from={6} durationInFrames={90}><SceneB /></Sequence>
```

**Rules:**
- Overlap scenes by 15-30 frames for smooth transitions
- Never cut hard between scenes (unless intentional flash/cut)
- Use percentage-based overlaps: 10-25% of scene duration
- The overlap IS the transition — animate out + animate in simultaneously

#### 2. EASING — Personality Through Curves
Each easing curve communicates something different. Stop using `spring()` for everything.

**Easing Vocabulary (GSAP → Remotion mapping):**

| Feel | GSAP Ease | Remotion Equivalent |
|------|-----------|-------------------|
| Smooth, natural | `power2.out` | `Easing.bezier(0.25, 0.46, 0.45, 0.94)` |
| Snappy, confident | `power3.out` | `Easing.bezier(0.22, 0.61, 0.36, 1)` |
| Dramatic entrance | `power4.out` / `expo.out` | `Easing.bezier(0.16, 1, 0.3, 1)` |
| Elegant, refined | `sine.inOut` | `Easing.bezier(0.37, 0, 0.63, 1)` |
| Overshoot/bounce back | `back.out(1.7)` | `Easing.bezier(0.34, 1.56, 0.64, 1)` |
| Playful bounce | `bounce.out` | Custom bounce function (see below) |
| Organic, physical | `elastic.out` | `spring({ damping: 8, stiffness: 100 })` |
| Linear (avoid!) | `none` | `Easing.linear` |

**When to use what:**
- **Hero text appearing:** `power3.out` or `back.out` — confident, slightly overshoots
- **Numbers counting:** `power2.inOut` — smooth acceleration and deceleration
- **Elements fading out:** `power2.in` — slow start, then quick exit
- **Subtle UI movement:** `sine.out` — gentle, barely noticeable easing
- **Logo reveal:** `expo.out` — dramatic fast start, elegant settle
- **Staggered list items:** `power2.out` with increasing delay — cascade effect
- **Scene transitions:** `power3.inOut` — smooth both ends

**Custom bounce for Remotion:**
```tsx
const bounce = (t: number): number => {
  const n1 = 7.5625;
  const d1 = 2.75;
  if (t < 1 / d1) return n1 * t * t;
  if (t < 2 / d1) return n1 * (t -= 1.5 / d1) * t + 0.75;
  if (t < 2.5 / d1) return n1 * (t -= 2.25 / d1) * t + 0.9375;
  return n1 * (t -= 2.625 / d1) * t + 0.984375;
};

// Usage:
const progress = interpolate(frame, [0, 30], [0, 1], { extrapolateRight: 'clamp' });
const y = interpolate(bounce(progress), [0, 1], [100, 0]);
```

**Custom back (overshoot) for Remotion:**
```tsx
const backOut = (overshoot = 1.70158) => (t: number): number => {
  return 1 + (overshoot + 1) * Math.pow(t - 1, 3) + overshoot * Math.pow(t - 1, 2);
};

// Usage:
const progress = interpolate(frame, [0, 20], [0, 1], { extrapolateRight: 'clamp' });
const scale = backOut(1.7)(progress); // slight overshoot on scale
```

#### 3. STAGGER — Orchestrated Motion
Never animate multiple elements at exactly the same time. Stagger creates rhythm.

**GSAP concept:**
```js
gsap.from(".chars", { y: 100, opacity: 0, stagger: 0.05, duration: 0.8 });
// Each char starts 0.05s after the previous
```

**In Remotion:**
```tsx
// Stagger helper
const stagger = (index: number, delayPerItem: number, fps: number) =>
  Math.floor(index * delayPerItem * fps);

// Text stagger (chars)
const text = "OWN YOUR POTENTIAL";
{text.split('').map((char, i) => {
  const delay = stagger(i, 0.05, fps); // 0.05s between each char
  const localFrame = Math.max(0, frame - delay);
  const opacity = interpolate(localFrame, [0, 8], [0, 1], { extrapolateRight: 'clamp' });
  const y = interpolate(localFrame, [0, 12], [40, 0], {
    extrapolateRight: 'clamp',
    easing: Easing.bezier(0.22, 0.61, 0.36, 1), // power3.out
  });
  return (
    <span key={i} style={{ opacity, transform: `translateY(${y}px)`, display: 'inline-block' }}>
      {char === ' ' ? '\u00A0' : char}
    </span>
  );
})}
```

**Stagger patterns:**
| Pattern | Delay | Feel |
|---------|-------|------|
| Fast cascade | 0.03s (1f) | Machine-gun, energetic |
| Standard | 0.05s (1.5f) | Natural, readable |
| Relaxed | 0.08s (2.5f) | Elegant, cinematic |
| Dramatic | 0.12s (3.5f) | Theatrical, one-by-one |

**Advanced stagger — from center:**
```tsx
const centerIndex = Math.floor(items.length / 2);
const distanceFromCenter = Math.abs(i - centerIndex);
const delay = stagger(distanceFromCenter, 0.05, fps);
```

**Advanced stagger — random:**
```tsx
// Pre-compute random delays (stable per render)
const randomDelays = items.map((_, i) => {
  const seed = i * 7919; // prime number for pseudo-random
  return (seed % 100) / 100 * 0.3; // 0-0.3s random delay
});
```

#### 4. SPLIT TEXT — Professional Text Animation
The single most impactful technique for motion graphics. Based on GSAP's SplitText.

**Three levels of split:**

**A. By lines** (reveal/mask effect):
```tsx
const lines = ["WE CREATE", "DIGITAL", "EXPERIENCES"];
{lines.map((line, i) => {
  const delay = i * 8; // 8 frames between lines
  const clipProgress = interpolate(frame - delay, [0, 15], [100, 0], {
    extrapolateLeft: 'clamp', extrapolateRight: 'clamp',
    easing: Easing.bezier(0.22, 0.61, 0.36, 1),
  });
  return (
    <div key={i} style={{ overflow: 'hidden' }}>
      <div style={{
        transform: `translateY(${clipProgress}%)`,
        opacity: interpolate(frame - delay, [0, 10], [0, 1], { extrapolateRight: 'clamp' }),
      }}>
        {line}
      </div>
    </div>
  );
})}
```

**B. By words** (staggered entrance):
```tsx
const words = text.split(' ');
{words.map((word, i) => {
  const delay = i * 4;
  const progress = interpolate(frame - delay, [0, 12], [0, 1], {
    extrapolateLeft: 'clamp', extrapolateRight: 'clamp',
  });
  const y = interpolate(backOut(1.5)(progress), [0, 1], [30, 0]);
  const opacity = interpolate(progress, [0, 0.3], [0, 1], { extrapolateRight: 'clamp' });
  return (
    <span key={i} style={{ display: 'inline-block', marginRight: 12, transform: `translateY(${y}px)`, opacity }}>
      {word}
    </span>
  );
})}
```

**C. By characters** (most dramatic):
```tsx
// Use the char stagger pattern from section 3 above
// Best for: hero titles, brand names, short impactful text
// Avoid for: paragraphs or long text (too slow to read)
```

**Mask reveal (premium technique):**
```tsx
// The "mask" = overflow:hidden parent, child slides up into view
// This is how professional motion graphics reveal text
<div style={{ overflow: 'hidden', lineHeight: 1.1 }}>
  <div style={{
    transform: `translateY(${interpolate(frame, [startFrame, startFrame + 15], [110, 0], {
      extrapolateRight: 'clamp',
      easing: Easing.bezier(0.22, 0.61, 0.36, 1),
    })}%)`,
  }}>
    YOUR TEXT HERE
  </div>
</div>
```

---

## 🎬 Scene Transitions — Beyond Fade-to-Black

### Transition Library

**1. Cross-dissolve (safe default):**
```tsx
// Scene A fades out in last 15 frames, Scene B fades in first 15 frames
// Both scenes overlap by 15 frames in the Sequence timeline
const fadeOut = interpolate(frame, [duration - 15, duration], [1, 0], { extrapolateRight: 'clamp' });
const fadeIn = interpolate(frame, [0, 15], [0, 1], { extrapolateRight: 'clamp' });
```

**2. Slide (directional energy):**
```tsx
// Scene exits left, next enters from right
const exitX = interpolate(frame, [duration - 20, duration], [0, -width], {
  extrapolateRight: 'clamp',
  easing: Easing.bezier(0.76, 0, 0.24, 1), // power4.inOut
});
```

**3. Scale zoom (dramatic):**
```tsx
const scale = interpolate(frame, [duration - 20, duration], [1, 3], {
  extrapolateRight: 'clamp',
  easing: Easing.bezier(0.16, 1, 0.3, 1), // expo.out
});
const opacity = interpolate(frame, [duration - 10, duration], [1, 0], { extrapolateRight: 'clamp' });
```

**4. Wipe (geometric):**
```tsx
const wipeProgress = interpolate(frame, [0, 20], [0, 100], {
  extrapolateRight: 'clamp',
  easing: Easing.bezier(0.76, 0, 0.24, 1),
});
// clipPath: `inset(0 ${100 - wipeProgress}% 0 0)` // left-to-right wipe
```

**5. Flash cut (impact):**
```tsx
// White flash frame for 2-3 frames at transition point
const flash = interpolate(frame, [0, 3], [1, 0], { extrapolateRight: 'clamp' });
<AbsoluteFill style={{ backgroundColor: `rgba(255,255,255,${flash})`, zIndex: 10 }} />
```

**6. Blur transition:**
```tsx
const blur = interpolate(frame, [duration - 15, duration], [0, 20], { extrapolateRight: 'clamp' });
<div style={{ filter: `blur(${blur}px)` }}>{children}</div>
```

### Transition Rules
- **Same topic/continuation:** cross-dissolve or no transition
- **New section/topic:** slide or wipe (directional)
- **Climax/impact moment:** flash cut or scale zoom
- **Ending/outro:** slow fade to black (30+ frames)
- **Never** use the same transition twice in a row
- **Match direction** to content flow (left-to-right = forward progress)

---

## 🔢 Animated Counters — Numbers That Feel Alive

```tsx
const CounterNumber: React.FC<{
  target: number;
  startFrame?: number;
  duration?: number;
  prefix?: string;
  suffix?: string;
}> = ({ target, startFrame = 0, duration = 45, prefix = '', suffix = '' }) => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  const progress = interpolate(frame - startFrame, [0, duration], [0, 1], {
    extrapolateLeft: 'clamp',
    extrapolateRight: 'clamp',
    easing: Easing.bezier(0.25, 0.46, 0.45, 0.94), // power2.out
  });

  const current = Math.round(target * progress);
  const formatted = current.toLocaleString();

  return <span>{prefix}{formatted}{suffix}</span>;
};

// Usage:
<CounterNumber target={500} suffix="+" startFrame={10} />
<CounterNumber target={98} suffix="%" startFrame={15} />
<CounterNumber target={15000000} prefix="$" startFrame={20} />
```

---

## 🎨 Visual Polish — Subtle Details That Matter

### Glow / Light effects
```tsx
// Soft glow behind key elements
<div style={{
  position: 'absolute',
  width: 200, height: 200,
  borderRadius: '50%',
  background: 'radial-gradient(circle, rgba(244,63,94,0.3) 0%, transparent 70%)',
  filter: 'blur(40px)',
  transform: `scale(${spring({ frame, fps, config: { damping: 20 } })})`,
}} />
```

### Particle / dot accents
```tsx
// Small decorative dots that fade in
const dots = [
  { x: 50, y: 200, delay: 5 },
  { x: 900, y: 100, delay: 8 },
  { x: 400, y: 1600, delay: 12 },
];
{dots.map((dot, i) => (
  <div key={i} style={{
    position: 'absolute', left: dot.x, top: dot.y,
    width: 6, height: 6, borderRadius: '50%',
    backgroundColor: '#F43F5E',
    opacity: interpolate(frame - dot.delay, [0, 10], [0, 0.6], {
      extrapolateLeft: 'clamp', extrapolateRight: 'clamp',
    }),
  }} />
))}
```

### Gradient animation
```tsx
// Slowly shifting gradient background
const hueShift = interpolate(frame, [0, durationInFrames], [0, 30]);
background: `linear-gradient(135deg, hsl(${24 + hueShift}, 95%, 54%), hsl(${330 + hueShift}, 85%, 55%), hsl(${270 + hueShift}, 65%, 60%))`;
```

### Line / rule animations
```tsx
// Horizontal line that draws itself
const lineWidth = interpolate(frame - delay, [0, 20], [0, 100], {
  extrapolateRight: 'clamp',
  easing: Easing.bezier(0.22, 0.61, 0.36, 1),
});
<div style={{ width: `${lineWidth}%`, height: 2, backgroundColor: accent }} />
```

---

## 📐 Layout Patterns for Video

### 9:16 Vertical (Reels/TikTok) — 1080×1920
```
┌──────────────┐
│   Safe zone   │ ← Top 200px: platform UI overlay
│               │
│  MAIN CONTENT │ ← Center 1080×1200: primary content
│               │
│               │
│   CTA / Logo  │ ← Bottom 300px: call to action
│   Safe zone   │ ← Bottom 200px: platform UI overlay
└──────────────┘
```

### 16:9 Horizontal — 1920×1080
```
┌─────────────────────────────────┐
│ Logo    │    MAIN CONTENT    │   │
│         │                    │   │
│ Sidebar │    Center stage    │   │
│         │                    │   │
│         │    CTA / Bottom    │   │
└─────────────────────────────────┘
```

---

## ⏱️ Pacing Guide

### 30-second video @ 30fps = 900 frames

**High energy (ads, promos):**
```
Scene 1: 0-105f   (3.5s) — Hook
Scene 2: 90-210f  (4s)   — Key message
Scene 3: 195-345f (5s)   — Value/proof
Scene 4: 330-510f (6s)   — Features/detail
Scene 5: 495-660f (5.5s) — Social proof
Scene 6: 645-795f (5s)   — CTA tease
Scene 7: 780-900f (4s)   — Close/logo
```
Note: 15-frame overlaps between each scene = transitions

**Cinematic (brand films):**
```
Act 1: 0-300f    (10s) — Establish mood, slow reveals
Act 2: 270-660f  (13s) — Build, show value
Act 3: 630-900f  (9s)  — Resolve, CTA
```

### Frame math cheat sheet
| Seconds | Frames (30fps) |
|---------|----------------|
| 0.5s | 15f |
| 1s | 30f |
| 2s | 60f |
| 3s | 90f |
| 5s | 150f |
| 10s | 300f |
| 15s | 450f |
| 30s | 900f |
| 60s | 1800f |

---

## 🛠️ Remotion Core Reference

### Setup
```bash
npx create-video@latest my-video
cd my-video && npm i
npx remotion preview  # Dev on port 3000
```

### Primitives
```tsx
import {
  useCurrentFrame, useVideoConfig, interpolate, spring,
  Sequence, Audio, Img, AbsoluteFill, staticFile,
  Easing, delayRender, continueRender
} from 'remotion';
```

### Render
```bash
npx remotion render src/index.ts CompositionId out/video.mp4 --codec h264 --crf 18
npx remotion render src/index.ts CompositionId out/video.mov --codec prores  # for editing
```

### Spring configs by feel
```tsx
// Snappy UI
spring({ frame, fps, config: { damping: 15, stiffness: 200, mass: 0.5 } })

// Smooth, elegant
spring({ frame, fps, config: { damping: 20, stiffness: 120, mass: 1 } })

// Bouncy, playful
spring({ frame, fps, config: { damping: 8, stiffness: 150, mass: 0.8 } })

// Heavy, dramatic
spring({ frame, fps, config: { damping: 25, stiffness: 80, mass: 2 } })

// Quick settle
spring({ frame, fps, config: { damping: 12, stiffness: 300, mass: 0.3 } })
```

---

## 📚 When to Read Each Reference

| Task | File |
|---|---|
| Animate elements | `references/animation-patterns.md` |
| Scene transitions | `references/scene-transitions.md` |
| Text animation | `references/typography-motion.md` |
| Audio/music/SFX | `references/audio-sync.md` |
| Figma → Remotion pipeline | `references/figma-to-remotion.md` |
| Resolution/render/export | `references/production-checklist.md` |
| Figma MCP setup | `references/figma-mcp-guide.md` |
| **GSAP timing concepts** | `references/gsap/guides/position-parameter.md` |
| **Easing curves deep-dive** | `references/gsap/easing/eases.md` |
| **Text split techniques** | `references/gsap/plugins/split-text.md` |
| **Layout transitions (FLIP)** | `references/gsap/plugins/flip.md` |
| **Timeline sequencing** | `references/gsap/core/gsap-timeline.md` |
| **Keyframe patterns** | `references/gsap/guides/keyframes.md` |
| **All GSAP docs** | `references/gsap/INDEX.md` |

---

## 🚫 Anti-Patterns — What NOT to Do

1. **Don't use `spring()` for everything** — match easing to the emotion
2. **Don't hard-cut between scenes** — always have a transition (even subtle)
3. **Don't animate everything at once** — stagger creates hierarchy
4. **Don't use `Easing.linear`** — nothing in nature moves linearly
5. **Don't make text too small** — minimum 48px for 9:16 body text, 80px+ for headlines
6. **Don't forget safe zones** — platform UI covers top/bottom 200px on mobile
7. **Don't skip Figma** — designing in code = guessing at layout
8. **Don't use the same transition twice in a row** — variety = professional
9. **Don't animate for more than 1s per element** — 0.3-0.8s is the sweet spot
10. **Don't forget `extrapolateRight: 'clamp'`** — unclamped values = broken animations
