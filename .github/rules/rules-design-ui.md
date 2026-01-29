# UI, Styling & Design System Rules

> Design principles, CSS patterns, and aesthetic guidelines for the AntiGravity ecosystem.

---

## 💎 Aesthetics & Philosophy

- **Premium Feel**: Design must be modern, clean, and responsive. Use subtle shadows, soft gradients, and rounded corners (8px+).
- **Glassmorphism**: Use transparency and blur effects on modals and overlays for a contemporary look.
- **Micro-interactions**: Add smooth transitions (`transition: all 0.2s ease-in-out`) on hovers and active states.

---

## 🎨 Design System Tokens

- **Colors**: Never use "pure" colors (like `#FF0000`). Use a harmonious color palette based on HSL.
- **Typography**: Use modern fonts (Inter, Outfit, Roboto). Maintain a clear hierarchy with defined typographic scales.
- **Spacing**: Use a base scale of 4px or 8px (4, 8, 12, 16, 24, 32, 48...).

---

## 🛠️ Frameworks (TailwindCSS / CSS Modules)

### If using TailwindCSS:
- **No Class Hell**: Avoid giant lists of classes in HTML. Use `@apply` in CSS files for reusable components or extract to React components.
- **Arbitrary Values**: Avoid `bg-[#123456]`. Add custom colors and spacing in `tailwind.config.js`.
- **Conditional Classes**: Use the `clsx` or `tailwind-merge` library to handle conditional classes cleanly.

### If using CSS Modules / Vanilla CSS:
- **BEM Methodology**: Use the `block__element--modifier` pattern for class organization.
- **Variables**: Use CSS Variables (`--primary-color`) to facilitate Dark Mode support.

---

## 🌗 Color Modes

- **Dark Mode First**: Every component must be designed with both Light and Dark versions in mind.
- **Consistency**: Use color variables that adapt automatically or Tailwind's `dark:` classes.

---

## 📱 Responsiveness

- **Mobile First**: Start development thinking about mobile and scale up to desktop.
- **Breakpoints**: Use market standards (640px, 768px, 1024px, 1280px).

---

**Last update:** 2026-01-16  
**Version:** 1.0
