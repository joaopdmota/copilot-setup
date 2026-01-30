# `.github` – Copilot / Nexus Ecosystem

This directory is a **shared Copilot/Nexus library**. It defines how AI agents should work in this repository (and can be copied to others).

It is structured to combine:

- **Global instructions** (`copilot-instructions.md`)
- **Path-specific instructions** (`instructions/*.instructions.md`)
- **Rules** (`rules/*.md`)
- **Skills** (`skills/*/SKILL.md`)
- **Project memory** (`memory.md`)
- **Workflows** (`workflows/**/*.md`)
- **Tools / Nexus scripts** (`tools/**/*`, `scripts/*`)

The goal is to make Copilot:

- More predictable
- Closer to your standards
- Easier to reuse across projects

---

## 1. Global behavior – `copilot-instructions.md`

File: `.github/copilot-instructions.md`

- Describes **how Copilot should work in this repo**.
- Defines the **priority order**:
  1. `.github/rules/rules-agent-core.md` and task-specific rules
  2. Tech/architecture rules (React, TS, Go, UI, patterns)
  3. Project memory in `.github/memory.md`
- Explains how to use:
  - `.github/rules/**`
  - `.github/skills/**`
  - `.github/memory.md`
  - `.github/tools/**` (Nexus)

Copilot automatically loads this file as **repository-wide custom instructions**.

---

## 2. Path-specific instructions – `.github/instructions/*.instructions.md`

Folder: `.github/instructions/`

Each `*.instructions.md` file has YAML frontmatter with `applyTo` and targets a part of the tree, for example:

- `rules-agent-core.instructions.md` → `applyTo: "**"` (applies to the whole repository)
- `rules-architecture.instructions.md` → `applyTo: "src/**"`
- `rules-design-ui.instructions.md` → `applyTo: "src/components/**/*.tsx,src/features/**/components/**/*.tsx,src/pages/**/*.tsx"`
- `rules-tech-react.instructions.md` → `applyTo: "src/**/*.tsx"`
- `rules-tech-typescript.instructions.md` → `applyTo: "src/**/*.ts,src/**/*.tsx"`
- `rules-tech-golang.instructions.md` → `applyTo: "**/*.go"`

Each file:

- Tells Copilot **which rule file(s)** in `.github/rules` must be followed for those paths.
- Sometimes suggests which **skills** (from `.github/skills`) to load.

When Copilot works on a file that matches `applyTo`, the instructions from that `*.instructions.md` are **automatically combined** with the global `copilot-instructions.md`.

---

## 3. Rules – `.github/rules/*.md`

Folder: `.github/rules/`

These are the **hard rules** for this repo:

- `rules-agent-core.md` – core behavior for all agents (Nexus, planner, reviewer, etc.).
- `rules-agent-memory.md` – how to read/update `.github/memory.md`.
- `rules-architecture.md` – high-level architecture & layering.
- `rules-design-ui.md` – UI/UX/design-system rules.
- `rules-soft-clean-code.md` – clean code & readability.
- `rules-soft-git.md` – Git/branch/PR etiquette.
- `rules-soft-patterns.md` – preferred patterns & anti-patterns.
- `rules-tech-react.md` – React/TSX technical standards.
- `rules-tech-typescript.md` – TS typing & patterns.
- `rules-tech-golang.md` – Go code standards (if applicable).

When there is a conflict between “generic best practice” and these rules, **the rules win**.

---

## 4. Skills – `.github/skills/**`

Folder: `.github/skills/`

Project **skills** are specialized playbooks that Copilot can load on demand. Each skill lives in a subfolder and has a `SKILL.md` with frontmatter:

```yaml
---
name: react-expert
description: Expert in React, Next.js, and UI Styling standards. Mandatory when implementing frontend features.
---
```

Available skills include (examples):

- `backend-expert`
- `clean-code-expert`
- `git-expert`
- `golang-expert`
- `react-expert`
- `system-architecture-expert`
- `typescript-expert`

Copilot decides when to load a skill based on the **description** and your prompt (for example, anything React-heavy may trigger `react-expert`).

In practice:

- **Rules** define the global constraints.
- **Skills** describe **how** to implement within those constraints for each specialty.

---

## 5. Project memory – `.github/memory.md`

File: `.github/memory.md`

- Stores **architectural decisions**, **feature status**, and **technical debt**.
- Is referenced by:
  - `rules-agent-memory.md`
  - Nexus workflows (`.github/workflows/nexus*.md`)
  - `copilot-instructions.md`

Agents should:

- **Read** memory before significant changes (to respect previous decisions).
- **Update** it when there are new important decisions, accepted technical debt, or pattern changes.

This keeps context alive across sessions and implementations.

---

## 6. Workflows – `.github/workflows/**`

Folder: `.github/workflows/`

### 6.1 Nexus orchestration

- `nexus.md` – describes **Nexus**, the main orchestrator agent.
- `nexus/planner.md` – planning phase.
- `nexus/task-manager.md` – task decomposition phase (`task.md`).
- `nexus/reviewer.md` – final review phase (`code_review.md`).

These files explain:

- The phases (Skill Discovery, Planning, Task Decomposition, Implementation, Review, Memory update).
- How to use rules (`.github/rules/**`), skills (`.github/skills/**`), and memory.

### 6.2 Standalone tools workflows

In `.github/workflows/tools/`:

- `audit.md` – `/audit` flow: comprehensive project health check (quality, security, tests, documentation, technical debt).
- `code-review.md` – `/code-review` flow: automated review of uncommitted changes.

They describe step-by-step workflows that the agent should follow, usually including scripts in `.github/tools/scripts`.

---

## 7. Tools / Nexus scripts – `.github/tools/**` e `.github/scripts/*`

### 7.1 Tools

Folder: `.github/tools/`

- `README.md` – specific guide for these tools.
- `scripts/` – helper scripts, for example:
  - `generate-diff.sh` – generates `./github/brain/<conversation-id>/changes.diff` with the diff between the current branch and the default branch, excluding `.github/`.

Workflows (such as `/code-review`) invoke these scripts to automate parts of the process.

## 8. How to copy this ecosystem to another project

To reuse this setup in another repository:

1. **Add (or adjust) the `agents` target in the new repo `Makefile`**:

```
.PHONY: agents
agents:
	@bash -c "$$(curl -fsSL https://raw.githubusercontent.com/joaopdmota/copilot-setup/main/.github/scripts/sync-copilot-setup.sh)"
```

From that point, Copilot will automatically:
  - Read `.github/copilot-instructions.md` as the global instruction file.
  - Apply relevant `*.instructions.md` based on file paths.
  - Use rules, skills, memory, workflows and tools as described above.

---

## 9. How to ask the agent to use Nexus / workflows

Example prompts (in Chat or inline):

- "Use the flow described in `.github/workflows/tools/code-review.md` to review my changes."
- "Run the audit flow in `.github/workflows/tools/audit.md` and give me a summarized report."
- "Plan this feature using Nexus (see `.github/workflows/nexus.md` and sub-workflows)."

There is no magic `/command` mechanism here; `/audit` and `/code-review` are **naming conventions** in the workflows. It helps a lot to explicitly mention which workflow file the agent should follow.

---

## 10. Quick summary for humans

- **Want to understand how Copilot thinks in this repo?** Read `.github/copilot-instructions.md`.
- **Want to know the mandatory rules?** See `.github/rules/**`.
- **Want to see specializations (React, TS, backend)?** See `.github/skills/**/SKILL.md`.
- **Want to know the history of decisions?** Read `.github/memory.md`.
- **Want to use the orchestration flows?** See `.github/workflows/**`.
- **Want to sync with the central standard?** Run `make agents`.
````
