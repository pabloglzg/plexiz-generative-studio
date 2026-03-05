# Figma to Claude Code: The Designer's Playbook
- **Source:** https://x.com/felixleezd/status/2023803631812874242
- **Author:** Felix Lee — CEO ADPList, 31K followers
- **Engagement:** 1.4K ❤️ | 171 🔁 | 4.6K 📎 (414K views)

## Setup
1. Figma → Settings → Security → Personal Access Token
2. `claude mcp add figma -e FIGMA_PERSONAL_ACCESS_TOKEN=figd_xxx`
3. Verify: `/mcp` → figma ✓

## What Claude CAN read from Figma
- Layer names & hierarchy, Auto Layout, Colors, Typography, Effects, Design tokens, Spacing, Component variants, Constraints, Text content

## What Claude CANNOT read
- Image pixels, Prototype interactions, Comments, Version history

## 4-Phase Workflow
1. **Analyze** — Read Figma URL, get structure/sections/palette/typography
2. **Extract tokens** — Tailwind config with custom colors, fonts, spacing + CSS variables
3. **Generate components** — One by one, matching exact styling with all variants
4. **Build sections** — Full responsive sections using generated components

## 3 MCP Use Cases
1. **Figma Design → Production code** (most used)
2. **FigJam wireframes/flows → Working app** (powerful)
3. **Figma Make AI-generated UI → Inject into codebase** (fastest)

## Power Workflows
- **A: Design System → Full Site** — tokens → atoms → molecules → sections → pages
- **B: Speedrun single page** — one prompt, entire page (needs well-organized Figma)
- **C: Component-first** — atomic design progression

## Figma Checklist Before Starting
- Layers: semantic names (hero-section ✓, Frame 427 ✗)
- Components: clear names (Button/Primary ✓, Component 1 ✗)
- Auto Layout on ALL containers
- Colors/typography as styles (not hardcoded)

## Pro Tips
1. Name layers like CSS classes
2. Work section by section (not entire page at once)
3. Reference Figma directly ("Look at the card in Features")
4. Export assets first (images → /public/)
5. Share stack upfront ("Next.js 14 + Tailwind + TypeScript")
