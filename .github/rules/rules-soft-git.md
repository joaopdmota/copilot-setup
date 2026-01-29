# Git & Workflow Conventions

> Standards for commits, branches, and Git workflow.

---

## 📝 Commits (Conventional Commits)

We follow the [Conventional Commits](https://www.conventionalcommits.org/) standard:

- `feat`: A new feature.
- `fix`: A bug fix.
- `docs`: Documentation changes.
- `style`: Changes that do not affect the meaning of the code (whitespace, formatting).
- `refactor`: A code change that neither fixes a bug nor adds a feature.
- `perf`: A code change that improves performance.
- `test`: Adding missing tests or correcting existing tests.
- `chore`: Updates to build tasks, dependencies, etc.

**Example:** `feat(auth): add login with google oauth2`

---

## 🌿 Branches

- **Naming Pattern**: `type/short-description`
  - `feature/user-auth`
  - `bugfix/issue-header-zindex`
  - `hotfix/critical-security-patch`
- **Main Branch**: Protected. Deploys only via approved Pull Request.

---

## 🔄 Workflow

1. **Update**: Always run `git pull --rebase` before starting.
2. **Branch**: Create the branch from `develop` or `main`.
3. **Draft PR**: Open a Draft PR early for visibility.
4. **Squash & Merge**: Prefer squash when merging to keep the main history clean.

---

**Last update:** 2026-01-16  
**Version:** 1.0
