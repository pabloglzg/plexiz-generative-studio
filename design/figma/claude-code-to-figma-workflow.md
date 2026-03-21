# Claude Code → Figma MCP Workflow

**Sources:** 
- [@zoink (Dylan Field, Figma CEO)](https://x.com/zoink/status/2023760388530307167) | 2,936 ❤️
- [@hewarsaber](https://x.com/hewarsaber/status/2024868598980690350) | 1,032 ❤️
- [@felixleezd](https://x.com/felixleezd/status/2023803631812874242) | 1,450 ❤️

**Date:** Feb 2026

## What It Does

Build in Claude Code → type "Send this to Figma" → browser's rendered state becomes fully editable Figma layers. Bidirectional: Figma MCP can also pull design changes back into codebase.

## Setup (3 Steps)

### Step 1: Get Figma Token
```
Figma.com → Profile (top-left) → Settings → Security → Personal access tokens → Generate → Copy
```

### Step 2: Connect via Claude Code
```bash
claude mcp add figma -e FIGMA_PERSONAL_ACCESS_TOKEN=figd_xxxxxxxxxx
```

### Step 3: Enable in Figma
Shift+D (Dev Mode) → find MCP option → enable

**Verify:** In Claude Code, type `/mcp` → should see `figma ✓ connected`  
Then `/figma` to see available capabilities.

## The New Workflow

```
BEFORE (Handoff Hell)              AFTER (Vibe Coding)
─────────────────────              ────────────────────
Design                             Design
↓                                  ↓
Spec doc                           Claude reads Figma directly
↓                                  ↓
Dev interprets                     Prompt: "Build this"
↓                                  ↓
Review                             Production code
↓                                  ↓
Feedback loop ×10                  Ship 🚀
↓
"Close enough"

Timeline: Weeks                    Timeline: Minutes
```

## Dylan Field's Mental Model

The design canvas > IDE for navigating possibility space because:
- See big picture by comparing approaches side-by-side
- Direct manipulation for details
- Divergent exploration before committing

**Key insight:** Avoid tunnel vision — the first version often becomes the final version. Use Figma to zoom out and explore alternatives.

## No Coding Background Required

Felix Lee built a game in one shot using Figma MCP + Claude Code. Every color, spacing, and component variant flows directly — zero design-to-dev translation loss.
