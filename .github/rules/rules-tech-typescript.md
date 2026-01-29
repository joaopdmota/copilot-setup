# TypeScript/JavaScript Development Rules

> Patterns, conventions, and best practices for TypeScript and JavaScript development in the AntiGravity ecosystem.

---

## 🏗️ Configuration & Strictness

- **Strict Mode**: `strict: true` in `tsconfig.json` is mandatory.
- **No Any**: The use of `any` is prohibited. Use `unknown` if the type is uncertain and perform type narrowing.
- **ES Modules**: Use ESM (`import/export`) instead of CommonJS (`require`).

---

## 💻 Code Patterns

### Typing
- **Interfaces vs Types**: Use `interface` for objects that can be extended and `type` for unions, tuples, or complex types.
- **Utility Types**: Leverage `Partial`, `Pick`, `Omit`, `Readonly`, etc.
- **Discriminated Unions**: Use for data models that can have multiple states (e.g., Result types).

### Functions & Async
- **Async/Await**: Always prefer `async/await` over `.then()/.catch()`.
- **Arrow Functions**: Use for anonymous functions or callbacks.
- **Functional patterns**: Prefer immutable array methods (`map`, `filter`, `reduce`) over `for/forEach` loops.

### Naming
- **Files**: `kebab-case.ts` or `PascalCase.tsx` for React components.
- **Types/Interfaces**: `PascalCase`. Do not use the `I` prefix (e.g., use `User` instead of `IUser`).
- **Variables/Functions**: `camelCase`.

---

## 🏛️ Architecture (Micro-Frontends / Monorepo)

- **Feature-Based Structure**: Organize by functionality, not by technical type (e.g., `/features/auth` instead of `/controllers/auth`).
- **Layers**:
  - `Domain/Models`: Data interfaces.
  - `Services/API`: External calls and persistence logic.
  - `Components/Views`: UI and local state.
  - `Hooks/State`: Global or complex state management.

---

## 🧪 Testing

- **Test Runner**: Vitest (preferred for speed) or Jest.
- **Testing Library**: For UI component testing.
- **Mocks**: Use `msw` (Mock Service Worker) to intercept network calls in tests.
- **Coverage**: Maintain high coverage in critical business logic.

---

## 🛠️ Tooling & Linting

- **Eslint**: Use the `@typescript-eslint/recommended` plugin.
- **Prettier**: For automatic formatting.
- **Package Manager**: `pnpm` (preferred for monorepos) or `npm`.
- **Path Aliases**: Use `@/` for the root directory (`src/`).

---

## 🚀 Performance & Tips

- **Tree Shaking**: Ensure you only import what is necessary from large libraries.
- **Immutability**: Never change state directly. Use the spread operator `...` or libraries like `immer`.
- **Error Handling**: Use `try/catch` blocks in asynchronous operations and create custom error classes if necessary.

---

**Last update:** 2026-01-16  
**Version:** 1.0
