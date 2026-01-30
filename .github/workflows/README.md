# Nexus Workflows

Workflows are organized into two categories based on their usage pattern.

---

## 🏗️ Nexus Orchestration

**Primary workflow:** [`/nexus`](./nexus.md)

The Nexus orchestrator manages the complete feature development lifecycle through these sub-workflows:

### Internal Workflows (Called by Nexus)

These workflows are **invoked automatically** by Nexus as part of the structured development flow. **Don't call them directly.**

- **[planner.md](./nexus/planner.md)** - Phase 1: Strategic planning and architecture
- **[task-manager.md](./nexus/task-manager.md)** - Phase 2: Task breakdown and organization
- **[reviewer.md](./nexus/reviewer.md)** - Phase 4: Implementation validation

### Usage Example

```
/nexus Create a user authentication system with JWT
```

Nexus will automatically:

1. Invoke `planner` to create implementation_plan.md
2. Invoke `task-manager` to create task.md
3. Implement the feature (Phase 3)
4. Invoke `reviewer` to validate the implementation

---

## 🛠️ Standalone Tools

Independent utilities you can invoke **anytime**, outside the Nexus flow.

### Available Tools

- **[`/audit`](./tools/audit.md)** - Comprehensive project health check

  - Analyzes code quality, security, architecture
  - Generates detailed audit report
  - Updates memory with findings

- **[`/code-review`](./tools/code-review.md)** - Review uncommitted changes
  - Automatically captures git diff (excluding `.github/`)
  - Analyzes against project rules
  - Generates code review report

### Usage Examples

```bash
# Run project audit
/audit

# Review your uncommitted changes before commit
/code-review

# Review with specific focus
/code-review
Focus on security and performance
```

---

## 📊 Quick Reference

| Workflow       | Type         | When to Use              | Invocation                     |
| -------------- | ------------ | ------------------------ | ------------------------------ |
| `/nexus`       | Orchestrator | Full feature development | `/nexus <feature description>` |
| `/audit`       | Standalone   | Project health check     | `/audit`                       |
| `/code-review` | Standalone   | Review your changes      | `/code-review`                 |

---

## 🎯 Decision Guide

**Use `/nexus` when:**

- ✅ Building a new feature from scratch
- ✅ You want full planning → implementation → review cycle
- ✅ You need the agent to write the code

**Use `/code-review` when:**

- ✅ You wrote code manually
- ✅ You want quick feedback before commit/PR
- ✅ You need validation against project rules

**Use `/audit` when:**

- ✅ Starting work on an existing project
- ✅ After major refactoring
- ✅ Periodic quality checks

---

**Version:** 1.0  
**Last update:** 2026-01-29
