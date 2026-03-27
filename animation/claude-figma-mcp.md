# Claude Code + Figma MCP Integration

**Source:** [@claudeai](https://x.com/claudeai/status/2024148286844649887) — Feb 18, 2026 · 16.7K likes

## Feature

Build a working prototype in Claude Code → push directly to Figma canvas via Figma MCP server → explore multiple design versions side-by-side.

## Workflow

```
Claude Code → code prototype
     ↓
"Send to Figma" command (Figma MCP)
     ↓
Figma canvas — editable layers, multiple variants
     ↓
Pick best version → Figma MCP pulls changes back to codebase
```

## Mental Model (from Figma CEO Dylan Field)

- Design canvas > IDE for exploring possibilities
- Compare variants side-by-side with direct manipulation
- **Explore divergently before committing** — avoid tunnel vision of "first version = final"
- After polishing in Figma → MCP syncs back to code

## Setup

1. Install Figma MCP server
2. Use Claude Code with Figma MCP connected
3. Command: "push this to Figma" or via MCP tool

## Our Config

- Figma Personal Token: `YOUR_FIGMA_TOKEN`
- MCP Channel: `YOUR_MCP_CHANNEL`
- Native MCP: `https://mcp.figma.com/mcp`
