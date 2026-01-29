---
trigger: always_on
---

# 🚀 React & Next.js Enterprise Standards

> Patterns, conventions, and best practices for engineering scalable, high-performance interfaces with React and Next.js.

---

## 🏗️ Architecture Patterns (Folder Structure)

The organizational structure must be chosen based on the product's scale.  
**Functional Components** are mandatory; the use of **Class Components** is prohibited.

---

## 1. Feature-Based (Vertical Slice)

**Scenario:**  
SaaS products and Dashboards with well-defined business domains.

**Concept:**  
Everything a feature needs to exist is contained within a single folder. High cohesion and easy module removal.

```text
src/features/tickets/
├── api/                # Data hooks (useCreateTicket.ts)
├── components/         # Feature-specific components
├── types/              # TypeScript interfaces for the feature
├── utils/              # Feature-specific helpers (formatters)
└── index.ts            # Public API (Authorized exports only)
```

---

## 2. Atomic Design (System-Oriented)

**Scenario:**  
UI libraries or projects with a strict focus on visual consistency.

**Concept:**  
Components organized by incremental complexity.

```text
src/components/
├── atoms/              # Button.tsx, Input.tsx (Indivisible units)
├── molecules/          # SearchBar.tsx (Composition of atoms)
├── organisms/          # Header.tsx, Sidebar.tsx (Complex sections)
└── templates/          # AuthLayout.tsx (Structural layouts)
```

---

## 3. Bulletproof (Clean Architecture)

**Scenario:**  
Enterprise applications with complex business logic that must remain independent of frameworks/APIs.

**Concept:**  
Strict layers of responsibility separating domain logic from infrastructure.

```text
src/
├── domain/             # Pure entities, interfaces, and business rules
├── infrastructure/     # API clients, SDK configs, and persistence
├── application/        # Use cases and hooks that orchestrate logic
└── presentation/       # UI Components and interface-specific logic
```

---

## 🏎️ Next.js & Rendering Strategies

**Server Components (RSC) Priority:**  
Use RSC by default to minimize the client-side bundle.

**Client Boundary:**  
Use the `'use client'` directive only at the deepest leaf of the component tree that requires interactivity or browser hooks.

**Data Fetching:**  
Fetch data directly on the server (`page.tsx` or `layout.tsx`) to prevent network waterfalls.

**Server Actions:**  
Centralize data mutations and validations in Server Actions, eliminating the need for internal API routes.

---

## 🎣 Hooks & State Management

**Standard Hooks:**  
Respect official rules (do not use inside loops or conditionals).

**Custom Hooks:**  
Extract complex effect or state logic into custom hooks (`useAuth`, `useProjectData`).

**Server State (TanStack Query):**  
Mandatory for caching, revalidation, and API data synchronization.

**Global State:**  
Context API or Zustand (preferred for simplicity) for states that transcend routes.

**URL SearchParams:**  
Use the URL to manage filter, pagination, and modal states to ensure shareability.

**Local State:**  
Use `useState` or `useReducer` for state restricted to a single component.

---

## ⚡ Performance & Clean Code

**Memoization:**  
Use `useMemo` and `useCallback` only when necessary (heavy processing or stable effect dependencies).

## 🧠 Cognitive Load & Logic Extraction

**Logic in useEffect:**  
**Prohibited.** `useEffect` should only be used for synchronization that cannot be extracted (e.g., event listeners).  
Complex business logic, data fetching, or subscriptions **MUST** be extracted to custom hooks (`useMatchSession`, `useWatchlistSync`).

**Component Size:**  
Soft limit of **150 lines**. If a component exceeds this, it likely has too many responsibilities.  
Split into smaller sub-components or extract logic to hooks.

**God Components:**  
Avoid components that "know too much". Separate Data Fetching from UI Rendering.

**One Hook per Feature:**  
Group related state and effects into a single custom hook (e.g., `useMatchLogic` instead of 5 separate `useState` + 3 `useEffect`).

**Code Splitting:**  
Use `next/dynamic` or `React.lazy` / `Suspense` to load heavy components only when needed.

**Forms:**  
Prefer controlled components for simple forms and `react-hook-form` for complex ones.

**Naming:**  
- Components: PascalCase  
- Non-component files: camelCase  

**One Component per File:**  
Each file must contain only one exported component.

---

## 🎨 UI & Props

**Composition:**  
Prefer component composition (using `children`) over passing dozens of configuration props.

**Strict Typing:**  
Use TypeScript interfaces for all props. Avoid `PropsWithChildren` to be explicit about component requirements.

**Destructuring:**  
Always destructure props in the function signature.

**Image Optimization:**  
Mandatory use of `next/image` with defined dimensions or priority for LCP images.

**Validation (Zod):**  
Validate input (forms) and output (API responses) at runtime to ensure type integrity.

---

## 🧪 UI Testing & Quality

**User-Centric:**  
Test behavior (what the user sees), not the internal implementation.

**Testing Library:**  
Use `@testing-library/react`.

**Accessibility (a11y):**  
Test accessibility using selectors like `getByRole` and `getByLabelText`.  
Enforce `jsx-a11y` via ESLint.

**Integration:**  
Validate the data flow between components and hooks within the same feature.

## 🔑 Keys, Indexes and `Math.random()`

**Absolute Rule:**  
❌ It is **forbidden** to use the array `index` or `Math.random()` as a `key` in lists.

### 🚫 What NOT to do

```tsx
{items.map((item, index) => (
  <Card key={index} />         // ❌ Wrong
))}

{items.map(item => (
  <Card key={Math.random()} /> // ❌ Even worse
))}


❗ Why this is critical

React uses key to identify elements between renders (reconciliation).
If the key changes, React cannot preserve component identity, which causes:

loss of internal state

inputs losing focus

broken animations

unnecessary re-renders

visual bugs that are hard to reproduce

Math.random() creates permanent instability.
Using index breaks whenever there is filtering, sorting, insertion, or removal.

✅ Correct approach

A key must be:

Unique

Stable between renders

Based on the real identity of the data


---

## 🚦 Decision Criteria

- **Use Feature-Based:** If the project has many independent business domains.
- **Use Atomic Design:** If the primary goal is creating a scalable UI Design System.
- **Use Bulletproof:** If business rules are complex and must remain technology-agnostic.

---

_Last update: 2026-01-21_