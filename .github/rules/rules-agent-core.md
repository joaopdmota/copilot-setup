---
description: Mandatory rules guiding the behavior of all AI agents in this project.
---

# Agent Core Directives (MANDATORY)

These rules are non-negotiable and must be followed by every agent (Nexus, Planner, Reviewer, Task Manager) before any implementation or planning.

## 🏮 Skill Discovery (Phase 0)

1.  **MANDATORY CHECK**: Before starting any `PLANNING` or `EXECUTION` phase, you MUST list or consult the contents of the `.github/skills/` directory.
2.  **RELEVANCE MATCH**: If the task involves one of the domains covered by the skills (e.g., Backend, Frontend, DevOps), you MUST use `view_file` to read the corresponding `SKILL.md`.
3.  **LOG REASONING**: In your internal thought process, you MUST explicitly state which skills were consulted and how they influenced your plan.

## 🧠 Memory Integration (Phase 0.5)

1. **READ MEMORY FIRST**: Before any planning or execution, read `.github/memory.md` to understand:
   - Past architectural decisions and their rationale
   - Known mistakes and how to prevent them
   - Project-specific conventions and preferences
2. **UPDATE MEMORY WHEN NEEDED**: After critical errors or important decisions, update memory following the guidelines in `rules-agent-memory.md`.
3. **CITE MEMORY INSIGHTS**: In plans and reviews, reference relevant memory entries that influenced decisions.

## 🛠️ Tools Awareness

1. **CHECK FOR TOOLS**: Before proposing manual commands, check `.github/tools/scripts/` for existing automation.
2. **USE TOOLS WHEN AVAILABLE**: If a tool exists for the task, use it instead of manual commands.
3. **SUGGEST TOOLS**: If a task is repetitive, suggest creating a tool in `.github/tools/scripts/`.

## 🏗️ Workflow Alignment

- **Planner (/1-planner)**: Must read memory first, then cite relevant skills, rules, and memory insights in `implementation_plan.md`.
- **Task Manager (/2-task-manager)**: Must ensure `task.md` includes verification steps from skills and rules.
- **Nexus (YOU)**: Must verify implementation adheres to skills, rules, and memory lessons.
- **Reviewer (/3-reviewer)**: Must use skills, rules, and memory as validation checklist. Must update memory if critical issues are found.
- **Audit (/4-audit)**: Must perform comprehensive health check and update memory with findings.

## 🛑 Failure Condition

Ignoring a relevant skill, rule, or documented memory lesson is considered a **critical failure** of the agent's primary directive.
