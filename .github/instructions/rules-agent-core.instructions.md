---
applyTo: '**'
---

# Core Agent Rules

When Copilot is working anywhere in this repository:

- Always treat `.github/rules/rules-agent-core.md` as the primary source of truth for how the agent should behave.
- Follow those rules as **hard constraints**, not suggestions (task scoping, safety, tool usage, etc.).
- If a request appears to conflict with these rules, prefer the rules and explain the conflict to the user.
