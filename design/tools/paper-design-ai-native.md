# Paper.design — AI-Native Design Tool

**Source:** [@tkkong (TK Kong)](https://x.com/tkkong/status/2034368184036561160) | 1,238 ❤️ | Mar 2026

## What It Is

AI-native design tool for human+agent collaboration. Claude Code can generate HTML/CSS and directly modify the Paper canvas via MCP. Output = editable frames with auto-layout (flex). After editing in Paper, push designs back to AI agent to write code.

## Setup with Claude Code

```bash
claude mcp add paper --transport http http://127.0.0.1:29979/mcp --scope user
```
Restart CC, type `/mcp` to verify Paper is connected. Download Paper desktop app from paper.design.

## Key Workflow

### Starting from Scratch
1. **Paper Snapshot** (Chrome extension) — copy any live website directly into Paper as editable layers. No screenshots needed.
2. Prompt Claude to remix the references with your spec: "look at references in {pageName} and design based on spec below..."
3. Break tasks into specific pages or components, not entire user journeys

### Working with Existing Designs
- Use Paper Snapshot on QA/deploy branch to bring real app into canvas
- Claude knows which frame you've selected: "look at the frame I've selected in Paper and do..."
- For customer previews: "fill in the frame with information for X persona"

## Why Paper Over Other AI Design Tools

- **Human-first** — you're the commander, agents do repetitive work
- **Native React** — agents write vanilla HTML/CSS (not complex data structures in WebGL)
- **Faster and smoother** than alternatives
- Built specifically for UI work by creator of Radix UI (Stephen Haney)
- Includes Shaders for visual effects

## The Workflow Loop

1. Claude designs initial frames
2. You edit styles, change layouts directly on canvas
3. Ask Claude to explore variants
4. Once ready → prompt Claude to implement specific pages/components
5. Push to prod

**Key:** Be specific and bite-sized when asking for implementation — same as manual coding.
