# Copilot Instructions for `vip-management-frontend`

You are the Copilot coding agent working in the `vip-management-frontend` repository. Always follow the instructions below in addition to your default behavior.

## 1. Sources of truth and priority

1. Prefer repository-specific rules in `.github/rules/` over generic guesses.
2. Use project skills in `.github/skills/**` when relevant to the task (React, TypeScript, backend, architecture, etc.).
3. Treat `.github/memory.md` as historical context and past decisions. When it conflicts with generic best practices, prefer what is recorded there unless clearly outdated.

If there is any conflict between these sources, apply this order:

1. `.github/rules/rules-agent-core.md` and task-specific rules
2. Technology/architecture rules (e.g. React, TypeScript, Golang, architecture, UI design)
3. Project memory in `.github/memory.md`

## 2. How to use `.github/rules`

Before proposing or implementing non-trivial changes, quickly check the most relevant rule files:

- Agent behavior:
  - `.github/rules/rules-agent-core.md`
  - `.github/rules/rules-agent-memory.md`
- Architecture & design:
  - `.github/rules/rules-architecture.md`
  - `.github/rules/rules-design-ui.md`
- Engineering practices:
  - `.github/rules/rules-soft-clean-code.md`
  - `.github/rules/rules-soft-git.md`
  - `.github/rules/rules-soft-patterns.md`
- Technology-specific:
  - `.github/rules/rules-tech-react.md` for React/UI work
  - `.github/rules/rules-tech-typescript.md` for TS/types work
  - `.github/rules/rules-tech-golang.md` for Go/backend work

When answering or editing code, follow these files as **hard constraints**, not suggestions. If you deviate for a good reason, call it out explicitly and explain why.

## 3. How to use `.github/skills`

This repository defines Agent Skills under `.github/skills/**` (for example `react-expert`, `typescript-expert`, `backend-expert`, `system-architecture-expert`, `clean-code-expert`, `git-expert`).

- When the user asks for work that clearly matches one of these domains, load and follow the corresponding skill.
- Use skills as detailed playbooks: they refine _how_ to apply the rules above for a given specialty.
- When a skill and a rule overlap, prefer the **rule** for global constraints and the **skill** for implementation details and techniques.

## 4. How to use `.github/memory.md`

- Use `.github/memory.md` to understand:
  - Architectural decisions already made (styling, theme, components, patterns).
  - Current feature status and what is considered "done".
  - Known technical debt and accepted trade-offs.
- When planning or suggesting changes, try to align with these decisions instead of redefining them from scratch.
- If you propose changing a recorded decision, clearly mark it as a **proposal** and explain the motivation.

## 5. How to use `.github/tools` (Nexus)

This repository exposes helper tools under `.github/tools/`, which act as a **Nexus** (central brain) for analyze → implement → review workflows:

- Read `.github/tools/README.md` to understand the intent and conventions for local/agent tools.
- Scripts live under `.github/tools/scripts/` (for example `example-tool.sh`, `generate-diff.sh`).
- Prefer using these scripts (or extending them) when you need to:
  - Automate diffs or code transformations.
  - Perform repeatable project-specific operations.

Follow this Nexus-style workflow for larger tasks:

1. **Analyze**: Use the relevant rules, skills, and `.github/memory.md` to understand context; when helpful, use tools in `.github/tools` (for example diff generators) to inspect current state.
2. **Implement**: Apply changes in small, verifiable steps, using existing project commands and scripts instead of ad-hoc shell commands whenever possible.
3. **Review**: Before handing results back, use diffs and available tools/scripts under `.github/tools` together with tests/linters to sanity-check the changes.

## 6. Answer style in this repository

- Be concise and action-oriented; avoid restating large rule or skill files verbatim.
- Always reference concrete files, symbols, and paths (e.g. `src/features/vip/...`, `.github/rules/rules-tech-react.md`) so that the user can navigate quickly.
- If your reasoning depends on a specific rule, skill, or memory entry, mention which file you used.
- Default to the existing architecture and patterns in this repo instead of introducing new frameworks or styles unless the user explicitly asks for it.

## 7. Maintaining this Copilot / Nexus setup

- This repository uses a shared `.github/` library (rules, skills, workflows, tools) to guide Copilot/Nexus.
- When you need to explain how to keep this setup in sync, instruct the user to run `make agents` from the repository root.
- The `agents` target runs `.github/scripts/sync-copilot-setup.sh`, which synchronizes this `.github` library with the central `antigravity-setup` repository.
- Prefer this sync workflow instead of asking the user to manually edit many rules/skills across projects.
