# Figma MCP Native — Claude Code Integration

**Source:** https://x.com/hewarsaber/status/2024868598980690350
**Author:** Hewar (@hewarsaber) — Founder of konvert.design
**Date:** 2026-02-20

## Summary
Figma launched native MCP support in Dev Mode. Claude Code can now connect directly to Figma without third-party plugins.

## Setup
1. Install Claude Code: `npm install -g @anthropic-ai/claude-code`
2. Figma → Dev Mode (Shift+D) → Enable MCP
3. Claude Code → `/mcp` → Authenticate Figma
4. `/figma` to confirm capabilities

## Key Points
- Bidirectional: Claude→Figma and Figma→Claude
- Designs land as **fully editable layers** (not flattened images)
- No more WebSocket relay servers or Talk to Figma plugin
- Works with Claude Pro or API accounts

## Relevance
Replaces our painful Talk to Figma plugin workflow (port 3055, Bun dependency, connection drops). This is the proper solution for agent→Figma design pipelines.
