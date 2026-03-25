# 5 Claude Skills para Frontend Design — @growthflo

**Source:** @growthflo screenshots (Mar 25, 2026)
**Purpose:** Stack completo de design skills para MC v4 dashboard build

## Skills (todas instaladas ✅)

### 1. web-design-guidelines (Vercel)
- `npx skills add vercel-labs/agent-skills@web-design-guidelines`
- **Qué hace:** Review de UI code contra Web Interface Guidelines de Vercel
- **Cuándo usar:** "review my UI", "check accessibility", "audit design"
- **Cómo funciona:** Fetch guidelines frescos desde GitHub → compara contra tu código → output `file:line`
- **Repo:** vercel-labs/agent-skills

### 2. web-accessibility (Supercent/Hoodini)
- `npx skills add hoodini/ai-agents-skills@web-accessibility` (original supercent-io es privado)
- **Qué hace:** WCAG 2.1 compliance — ARIA patterns, keyboard nav, screen reader, contrast
- **Cuándo usar:** Implementar a11y, ARIA, keyboard navigation, screen reader support
- **Incluye:** Patterns para button, modal, tabs, combobox, toast, form validation, focus management, skip links, responsive, color contrast

### 3. anthropics/frontend-design (Anthropic oficial)
- `npx skills add anthropics/skills@frontend-design`
- **Qué hace:** Transforma a Claude en production-ready frontend design partner
- **Cuándo usar:** Crear interfaces distintivas y pulidas — componentes, layouts, páginas completas
- **Diferenciador:** Anti-generic AI aesthetics — empuja hacia diseño único, no template-like
- **Ya teníamos instalado** ✅

### 4. UI-UX-Pro-Max (NextLevelBuilder)
- `npx skills add nextlevelbuilder/ui-ux-pro-max-skill@ui-ux-pro-max`
- **Qué hace:** UX strategist — user behavior, visual flow, design principles
- **Cuándo usar:** Antes de crear cualquier UI — para que las decisiones de diseño tengan fundamento
- **Incluye:** 100 reasoning rules, 67 UI styles, searchable style/color/font databases
- **Ya teníamos instalado** ✅

### 5. shadcn-ui (Giuseppe Trisciuoglio / Developer Kit)
- `npx skills add giuseppe-trisciuoglio/developer-kit@shadcn-ui`
- **Qué hace:** Deep knowledge de shadcn/ui component library + design system
- **Cuándo usar:** Picking components, applying consistent styling, following shadcn conventions
- **Ya teníamos instalado** ✅

## Cómo se complementan

```
UI-UX-Pro-Max         → UX strategy ANTES de diseñar
frontend-design       → Production-ready design partner
shadcn-ui            → Component knowledge
web-design-guidelines → Quality review DESPUÉS de diseñar  
web-accessibility     → A11y compliance check
```

## Uso para MC v4

Estas 5 skills son el stack de diseño para el dashboard de Mission Control v4:
1. **Plan** con UI-UX-Pro-Max (UX strategy)
2. **Build** con frontend-design + shadcn-ui (code generation)
3. **Review** con web-design-guidelines (quality)
4. **Verify** con web-accessibility (a11y)

**Category:** design, agent-skills, workflow
