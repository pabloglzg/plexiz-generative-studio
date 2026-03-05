# How to Force Your Agent to Obey Your Design System
## The 5-Layer Enforcement Model

Most design systems fail because they're optional. Make them a contract.

### Layer 1: Canonical Docs
Write rules that can be LINTED, not vague guidance:
- ❌ "Use consistent spacing"
- ✅ "Use semantic tokens (xxs, xs, s, m, l), NEVER raw utilities (mt-3, px-4)"

3 documents:
1. **Design rules** — hard DO/NEVER policy
2. **Visual language** — token mappings, component styling, typography/color contracts
3. **Interaction patterns** — layout and behavior contracts

### Layer 2: Agent Routing
SKILL.md dedicated to design system:
- Routes design tasks to the right docs
- Prevents ad-hoc styling decisions
- Keeps visual guidance centralized

### Layer 3: Custom Lint Rules
Custom checks for YOUR standards:
- Spacing token check: ban raw spacing utilities
- Color token check: ban raw hex/rgb/hsl
- Typography constant check: require shared heading constants
- Shared wrapper check: enforce form wrappers over raw primitives

### Layer 4: Pre-commit Hooks
`npm run lint:design-system:staged`
- Fast feedback on staged files
- Fixes happen while context is fresh

### Layer 5: CI Gates
Same design-system contract on PRs:
- Failures = blocking
- "We guarantee design consistency" > "we encourage design consistency"

## Exception Handling
- Inline marker required
- Must include short reason
- Review like code debt
- Periodic audit to remove stale exceptions

## Key Quote
> "If you want your agent to use your design system, don't ask politely. Encode it as a contract."

Source: Ryan Carson (174K followers) https://x.com/ryancarson/status/2028916090596643078
