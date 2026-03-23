# HeroUI v3 — React + React Native Component Library

**Source:** [@hero_ui](https://x.com/hero_ui/status/2035353807735976374) — Mar 21, 2026 · 2.6K ❤️ · 193 🔁
**URL:** https://heroui.com (previously NextUI)
**Company:** YC S24, 97K followers

## What It Is

Complete rewrite of NextUI → HeroUI v3. Dual-platform component library for React (web) and React Native (mobile).

## Key Features

- **Web:** 75+ components (21 new)
- **Native:** 37+ components (built from scratch)
- **Styling:** Tailwind CSS v4, CSS variables, OKLCH color space, BEM naming
- **Performance:** CSS-only animations — zero JavaScript runtime for transitions
- **Dual platform:** Same design system for web and mobile

## Why It Matters

- CSS-only animations = real performance, no Framer Motion overhead for basics
- React Native library is the differentiator — most component libs are web-only
- Tailwind v4 native support with modern color space (OKLCH)
- Serious alternative to shadcn/ui for rapid prototyping

## Comparison With Our Stack

| | HeroUI v3 | shadcn/ui (our default) | Taste Rules (our skill) |
|---|---|---|---|
| Approach | Pre-built, opinionated | Copy/paste, full control | Design enforcement rules |
| Tailwind | v4 native, OKLCH | v3/v4 | Agnostic |
| Customization | CSS vars themes | Full code ownership | N/A — enforcement layer |
| Mobile | React Native ✅ | No | No |
| Animations | CSS pure (zero JS) | Your choice (usually Framer) | Recommends CSS-first |
| "Slop" risk | Medium — pre-built = more generic | Low — you write it | Eliminates it |

## Verdict

Doesn't replace shadcn + Taste Rules for production work, but strong option for:
1. **React Native** — best option if we build mobile apps
2. **Rapid prototyping** — beautiful UI in 20 min without full design system setup
3. **CSS animation patterns** — their zero-JS approach is reference material

**Category:** web-design, component-library
