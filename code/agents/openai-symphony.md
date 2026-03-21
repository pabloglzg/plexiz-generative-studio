# OpenAI Symphony — AI Coding Orchestrator

**Source:** [@odysseus0z](https://x.com/odysseus0z/status/2031850264240800131) | 680 ❤️ | Mar 2026

## What It Is

Open-source orchestrator by OpenAI. Points at a Linear board and turns tickets into pull requests using Codex agents.

Real result: 50 Linear tickets pushed overnight → 30 merged PRs, 7,000 lines deleted, nothing broken.

## Setup

```bash
npx skills add odysseus0/symphony -s symphony-setup -y
```

Then tell your agent: "set up Symphony for my repo."

Fork with easier setup: [odysseus0/symphony](https://github.com/odysseus0/symphony)

## How It Works

- Each worker gets its own workspace clone
- Reads the ticket → posts plan as Linear comment (catch bad plans before bad PRs)
- Implements → validates → opens PR
- CDP browser attachment for E2E validation of UI changes
- Checks off todos during run, delivers demo video at end

## Control Surface (Linear States)

| Action | Result |
|--------|--------|
| Push to **Todo** | Idle agent claims it within seconds |
| Move to **Rework** with comments | Agent picks up and addresses feedback |
| Cancel | Agent stops on next poll |
| Move to **Backlog** | Hold it |

## Key Config (WORKFLOW.md — hot-reloads instantly)

- `agent.max_concurrent_agents` — start at 2-3, scale up
- `agent.max_turns` — per ticket. Higher for complex, lower to cap token spend

## Best Practice

Start with big idea → let agent decompose into Linear tickets with dependencies → review and adjust → push batch to Todo → Symphony parallelizes non-blocked work.
