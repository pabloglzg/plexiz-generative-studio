# Figma Canvas Now Open to Agents — use_figma + Skills

**Source:** [Figma Blog](https://www.figma.com/blog/the-figma-canvas-is-now-open-to-agents/) — Mar 24, 2026
**Status:** ✅ CONNECTED AND TESTED (pablo@plexiz.com, Plexiz Web Team Pro seat)

## What Changed

Figma's MCP server now has **write access** to the canvas. Previously it was read-only (get_design_context, get_screenshot). Now agents can CREATE and MODIFY real Figma content — frames, components, variables, auto layout, text, fills — all using the Plugin API.

## New Tool: `use_figma`

The killer feature. Executes JavaScript (Plugin API) directly in Figma files. Can:
- Create/edit/delete nodes (frames, text, components, etc.)
- Set up variables, design tokens, styles
- Build/update component and variant systems
- Fix layout, auto-layout, fills
- Search design system libraries for reuse
- Self-heal: take screenshots and iterate on mismatches

**Free during beta.** Will become usage-based paid feature.

## All 16 MCP Tools Available

| Tool | Purpose |
|---|---|
| `use_figma` | **NEW** — Write to canvas (Plugin API JS execution) |
| `search_design_system` | **NEW** — Search libraries for components/variables/styles |
| `create_new_file` | **NEW** — Create blank Figma/FigJam files |
| `generate_figma_design` | Send live UI → Figma layers (code to canvas) |
| `get_design_context` | Get design context for code generation |
| `get_variable_defs` | Get variables/styles from selection |
| `get_metadata` | Sparse XML of selection (IDs, names, positions) |
| `get_screenshot` | Screenshot of selection |
| `get_code_connect_map` | Figma→Code component mapping |
| `add_code_connect_map` | Add component mapping |
| `get_code_connect_suggestions` | Auto-detect code mappings |
| `send_code_connect_mappings` | Confirm suggested mappings |
| `create_design_system_rules` | Generate rules file for agents |
| `get_figjam` | FigJam diagram → XML |
| `generate_diagram` | Mermaid → FigJam diagram |
| `whoami` | Auth identity check |

## Skills System

Figma now has a Skills ecosystem — markdown instruction files that teach agents how to work in Figma:

### Official Figma Skills
- **figma-use** — Foundation skill (MUST load before every use_figma call)
- **figma-generate-design** — Build screens using design system components
- **figma-generate-library** — Build/update design system from codebase
- **figma-implement-design** — Turn Figma design → working code
- **figma-create-new-file** — Create blank files
- **figma-create-design-system-rules** — Generate agent rules from codebase
- **figma-code-connect-components** — Link Figma components to code

### Community Skills (9 launch partners)
- /figma-generate-library: Create components from codebase
- /figma-generate-design: Create designs using existing components
- /create-voice: Screen reader specs from UI specs (Ian Guisard, Uber)
- /cc-figma-component: Components from JSON contract (Nick Villapiano, One North)
- /apply-design-system: Connect designs to system components (Edenspiekermann)
- /rad-spacing: Hierarchical spacing with variables (Rad Collab)
- /edit-figma-design: Orchestrate with Warp and Oz (Warp)
- /sync-figma-token: Token drift detection between code/Figma (Firebender)
- /multi-agent: Parallel workflows (Augment Code)

### Creating Custom Skills
Skills are just markdown files with frontmatter. Structure:
```
skills/my-skill/
  SKILL.md          # Main instructions
  scripts/          # Optional executable scripts
  references/       # Optional detailed docs
  assets/           # Optional templates/data
```

## Our Setup

### Connection
- **MCP Server:** `https://mcp.figma.com/mcp` (remote, HTTP transport)
- **Auth:** OAuth (via Claude Code) — authenticated as pablo@plexiz.com
- **Access:** Plexiz Web Team (Pro tier, Full Expert seat)
- **Invocation:** Via Claude Code CLI (`claude --print --permission-mode bypassPermissions`)

### Skills Downloaded
Full Figma skills repo cloned at `/tmp/mcp-server-guide/skills/`:
- figma-use (234 lines + 12 reference docs)
- figma-generate-design
- figma-generate-library (with references for tokens, components, naming, etc.)
- figma-implement-design
- figma-create-new-file

### Test Results (Mar 24, 2026)
1. ✅ `whoami` — Confirmed pablo@plexiz.com, Plexiz Web Team
2. ✅ `create_new_file` — Created "Subsy MCP Test" file
3. ✅ `use_figma` — Created Hero Section frame (1440x800, dark bg, auto-layout, 2 text nodes)
4. ✅ `get_screenshot` — Verified visual output matches spec

## Critical Rules for use_figma (from figma-use SKILL.md)

1. **Use `return` for output** — no console.log, no figma.closePlugin()
2. **Plain JS with top-level await** — no async IIFE wrapping
3. `figma.notify()` **throws** — never use it
4. **Work incrementally** — small steps, validate after each
5. Colors are **0-1 range** (not 0-255)
6. Fills/strokes are **read-only arrays** — clone, modify, reassign
7. **Load fonts before text ops:** `await figma.loadFontAsync({family, style})`
8. **Page resets between calls** — always set page at start
9. **Return ALL created node IDs** — essential for subsequent calls
10. **On error, STOP** — don't retry blindly, fix first

## Replaces

This is a MASSIVE upgrade from our previous Figma MCP setup:
- **Old:** `figma-developer-mcp` (PAT-based, 2 tools: get_figma_data + download_figma_images) — READ ONLY
- **Old:** `claude-talk-to-figma-mcp` (WebSocket plugin, needed Figma desktop app running)
- **New:** 16 tools, full read+write, OAuth, no desktop app needed, skills ecosystem

**Category:** design, figma, mcp, workflow
