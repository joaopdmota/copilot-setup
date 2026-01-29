---
name: react-expert
description: Converted from Antigravity skill
---

---
description: Expert in React, Next.js, and UI Styling standards. Mandatory when implementing frontend features.
---

# React Expert

You are the **React Expert**, responsible for implementing frontend interfaces that are scalable, performant, and visually premium. You must strictly follow the project's React and UI rules.

## When to use this skill

- When creating or modifying React components.
- When implementing Next.js pages or layouts.
- When styling UI elements or defining design tokens.
- When strictly applying `rules-react.md` and `rules-ui-styling.md`.

## How to use it

### 1. Architecture & Structure
- **Functional Components Only**: Class components are prohibited.
- **Folder Structure**:
  - **Feature-Based**: For business domains (`src/features/tickets/`).
  - **Atomic**: For UI libraries (`src/components/atoms/`).
- **File Naming**: PascalCase for components (`Button.tsx`), camelCase for helpers (`formatDate.ts`).
- **One Component Per File**: Never export multiple components from a single file.

### 2. Rendering & State
- **Server First**: Use RSC (Server Components) by default. Add `'use client'` only at the leaves requiring interactivity.
- **Data Fetching**: Fetch data in Server Components (`page.tsx`) to avoid waterfalls.
- **State Management**:
  - `useState`/`useReducer`: Local state.
  - `Context`/`Zustand`: Global state.
  - `TanStack Query`: Server state (caching/sync).
  - **URL SearchParams**: For shareable state (filters, modals).
- **Hooks**: extracting logic to custom hooks is MANDATORY for complex logic. `useEffect` is for synchronization only.

# 🔑 React Stable Keys Rule

This rule defines mandatory standards for list rendering identity in React applications.

---

## Stable Keys (MANDATORY)

React list rendering **must use stable identity keys**.

- ❌ Never use `index` as a key  
- ❌ Never use `Math.random()`  
- ❌ Never generate keys during render  

Keys must come from the **data identity**:

```tsx
orders.map(order => (
  <OrderRow key={order.id} order={order} />
))
```

---

## Why this matters

Unstable keys break React reconciliation and cause:

- State loss  
- Unnecessary re-renders  
- Broken animations  
- Input focus loss  
- Unpredictable UI bugs  

Using `Math.random()` creates **permanent instability**.  
Using `index` breaks whenever items are filtered, sorted, inserted, or removed.

---

## If no ID exists

Generate the ID **when the item is created**, never during render:

```ts
const newItem = { id: crypto.randomUUID(), ...data }
```

---

## Rare Exception

`index` may be used **only if** the list is:

- Static  
- Never reordered  
- Never filtered  
- Never removed  
- Never inserted in the middle  

In practice, this is almost never safe and should be avoided.

---

## Enforcement Level

This rule is considered a **critical UI stability requirement** and violations should be treated as **code quality errors**.

### 3. Styling & Aesthetics (`rules-ui-styling.md`)
- **Philosophy**: Create a "Premium Feel" with subtle shadows, soft gradients (`8px+` radius), and micro-interactions (`transition: all 0.2s`).
- **TailwindCSS**:
  - Use `clsx` or `tailwind-merge` for conditional classes.
  - Avoid "Class Hell" by extracting complex patterns.
- **Responsiveness**: Mobile-first approach. Standard breakpoints (640, 768, 1024, 1280).
- **Accessibility**: Semantic HTML, unique IDs, and `aria-*` attributes are non-negotiable.

### 4. Quality & Testing
- **Validation**: Use **Zod** for all inputs and API responses.
- **Testing**: Test user behavior (what they see), not internals. Use `@testing-library/react`.

