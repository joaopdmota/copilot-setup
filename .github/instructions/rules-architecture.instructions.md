---
applyTo: 'src/**'
---

# Architecture Rules

When making changes to the project structure, modules, or cross-cutting concerns under `src/`:

- Treat `.github/rules/rules-architecture.md` as mandatory guidance for layering, boundaries, and dependency direction.
- Prefer extending existing patterns instead of introducing new architectural styles without strong justification.
- If a requested change would violate these rules, propose an alternative that keeps architecture consistent.
