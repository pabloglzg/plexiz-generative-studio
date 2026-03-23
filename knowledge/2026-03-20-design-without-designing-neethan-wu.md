# Design Without Designing — 3-Layer Agent Harness for Design

**Source:** [@neethanwu](https://x.com/neethanwu/status/2034786360356204934) — Mar 20, 2026 · 634 ❤️ · 68 🔁
**Type:** X Article — full breakdown of a non-designer shipping design weekly with agents

## Context

Neethan Wu is an engineer who never did UI/UX until 3 months ago. Built a 3-layer agent harness that lets him ship production design weekly. This is the most structured framework we've seen for "design via agents."

## The 3-Layer Framework

### Layer 1: Skills (borrowed expertise)

Instruction files installed into your AI agent that transfer design expertise:

1. **Impeccable** — `impeccable.style` (@pbakaus)
   - ✅ WE HAVE THIS
   - 20+ commands: /audit, /polish, /animate, /typeset, /arrange
   - `/delight` is his most-used — "changed my output overnight"
   - Built by creator of jQuery UI

2. **Emil Kowalski's Design Engineer Skill** — `emilkowal.ski/skill` (@emilkowalski)
   - Design engineer at Linear, ex-Vercel
   - Created Sonner + Vaul (15M+ weekly npm downloads)
   - Focus: animations, UI polish, small details
   - Free version available + paid with animations.dev course

3. **Interface Design** — `interface-design.dev` (@Dammyjay93)
   - Solves: agent forgets design decisions between sessions
   - Stores specs (spacing, colors, depth, components) in persistent `system.md`
   - Auto-loads on every session

4. **UI Skills** — `ui-skills.com` (@ibelick)
   - By Julien Thibeaut (creator of motion-primitives)
   - 15 open-source skills: baseline UI, accessibility, motion, performance, metadata
   - Broad coverage foundation

### Layer 2: Agent Canvas (design surfaces)

Tools where YOUR agent does the visual work. Canvas = shell, your agent = kernel.

5. **Paper** — `paper.design` (@paper)
   - Canvas built on real HTML/CSS — what you design IS code
   - MCP tools with full read/write access
   - No translation layer, no handoff
   - Used for: design systems, design tokens, page iterations
   - Free tier with limited MCP calls

6. **Pencil** — `pencil.dev` (@tomkrcha)
   - JSON-based `.pen` format — Git-diffable, versionable
   - **Swarm mode:** up to 6 agents working on canvas simultaneously
   - One handles typography, another layout, third propagates design system
   - Currently free

### Layer 3: Inspiration (training the eye)

7. **Variant** — `variant.ai` (@variantui)
   - Type idea → infinite non-repeating design interpretations
   - **Style Dropper:** absorbs visual DNA from any design, transfers to another
   - Export as React, copy prompts with HTML refs for agents
   - He spends 20 min/day scrolling to warm up his eye
   - Bridge from inspiration → actual product code

8. **Mobbin** — `mobbin.com` (@mobbin)
   - Mobile apps + websites, real flows from top apps
   - Figma plugin for pulling references directly

9. **Awwwards** — `awwwards.com` (@awwwards)
   - Jury-scored cutting edge web craft
   - Conferences + academy

10. **Cosmos** — `cosmos.so` (@thecosmos)
    - Personal inspiration collection + community collections
    - Hex color search + vague description search
    - Build clusters of visual references

## Key Insight

> "You don't need to become a designer. You need the right harness."

Three layers: Skills for expertise. Canvases for agents to work on. Inspiration to train the eye.

## Action Items for Plexiz

| Tool | Status | Action |
|---|---|---|
| Impeccable | ✅ Have it | None |
| Emil Kowalski Skill | ❌ | Install (review line by line) |
| Interface Design | ❌ | Install |
| UI Skills | ❌ | Install |
| Paper.design | ❌ | Setup MCP |
| Pencil.dev | ❌ | Setup MCP |
| Variant.ai | ❌ | Create account (Pablo) |
| Cosmos.so | ❌ | Create account (Pablo) |

**Category:** knowledge, design, workflow, agent-skills
