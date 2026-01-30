# Project Memory - VIP Management Frontend

## Architectural Decisions
- **Styling**: Using `styled-components` for global styles and internal components.
- **Global Styles**: Applied `html, body, #root { height: 100% }` and margin/padding reset.
- **Theme**: Using `@frete.com/fuel-foundation` theme tokens.
- **UI Components**: Preference for `FuelTypography` for text to ensure consistency.
- **Modal Pattern**: Custom modal implementation using fixed overlay and content divs (no FuelModal component available).
- **Form Inputs**: Using `FuelTextField` with `onFuel-change` event handler pattern.

## Feature Status
- [x] Initial Research & Structure
- [x] Margin Reset & Height setup
- [x] Global Typography implementation
- [x] Profile Feature with formatted data display (CPF, dates)
- [x] Profile Search Modal with UUID validation
- [x] Home Page with 3-card responsive grid layout

## Technical Debt
- Some inline styles in `vip-management.tsx` could be moved to styled-components or a theme-based approach.
- The use of `defaultProps` in `FuelFlex` is inconsistent; some styles work inside, others outside. Recommendation: use props directly when possible.

## Recent Implementations (2026-01-29)
- **Profile Formatters**: Created `formatters.ts` with `formatCPF` and `formatDate` utilities for Brazilian format.
- **ProfileCard Enhancements**: Applied formatting to CPF (XXX.XXX.XXX-XX) and dates (dd de mmmm de yyyy).
- **ProfileSearchModal**: New modal component for searching driver profiles by UUID with validation.
- **Home Page Update**: Added third card "Buscar Perfil de Motorista" with responsive grid layout (1 col mobile, 2 cols tablet, 3 cols desktop).
