# Figma → Remotion Animation Pipeline

**Source:** [@daumantasbanys](https://x.com/daumantasbanys/status/2022309419317436892) — Feb 13, 2026 · 30 likes (early, high signal)

## CRITICAL WORKFLOW — Figma to Video with AI

### 4 Steps

1. **Ideate script with AI** — use Claude/ChatGPT to write scene-by-scene script
2. **Design scenes in Figma** — lay out each frame as a Figma artboard
3. **Install Remotion skill** — run Claude Code or Codex CLI with Remotion agent skill installed
4. **Paste script + Figma frame URLs** → AI generates full animated React/Remotion video code

### Tools Required

- Figma (design scenes)
- Remotion (React video framework)
- Claude Code or Codex CLI
- Remotion agent skill (install via Claude Code skill manager)

### Why This Matters

Converts static Figma designs into animated videos without a motion designer. The AI handles the React/Remotion code generation when you provide the design reference via Figma MCP.

### Related

- Claude Code + Figma MCP: build in code → push to Figma → explore variants
- See `design/agent-skills/` for skill patterns
- Remotion best practices: `~/.openclaw/workspace/skills/remotion-best-practices/SKILL.md`
