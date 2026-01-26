---
name: interface-design
description: Cross-platform interface design principles inspired by Dieter Rams. Apply timeless design thinking to iOS, web, and native applications. Use when designing UI, reviewing visual hierarchy, choosing typography, or when user mentions design, layout, visual, or interface.
license: MIT
metadata:
  version: 1.0.0
  category: design
  domain: interface-design
  platforms: iOS, macOS, Web, Cross-Platform
---

# Interface Design

Timeless design principles for digital interfaces, inspired by Dieter Rams' philosophy: **Good design is as little design as possible.**

## Core Philosophy

Design is not decoration. Every element must earn its place. Remove until it breaks, then add back only what's essential.

## The 10 Principles Applied to UI

### 1. Good Design is Innovative
- Push boundaries within platform conventions
- Find new solutions to interaction problems
- Don't copy—understand why something works, then improve

### 2. Good Design Makes a Product Useful
- Every element serves the user's goal
- Reduce cognitive load, not features
- Measure success by task completion, not aesthetics

### 3. Good Design is Aesthetic
- Beauty emerges from clarity, not ornament
- Harmony between elements creates calm
- Visual rhythm guides the eye naturally

### 4. Good Design Makes a Product Understandable
- Interface explains itself
- Affordances match expectations
- Progressive disclosure over overwhelming options

### 5. Good Design is Unobtrusive
- Tools, not obstacles
- Content first, chrome second
- The best interface is invisible

### 6. Good Design is Honest
- Don't promise what you can't deliver
- Loading states, error states, empty states matter
- No dark patterns

### 7. Good Design is Long-Lasting
- Avoid trends that will age poorly
- Classic typography over novelty fonts
- Timeless over fashionable

### 8. Good Design is Thorough
- Every detail considered
- Edge cases handled gracefully
- Consistency across all states

### 9. Good Design is Environmentally Friendly
- Efficient rendering, minimal battery drain
- Dark mode for OLED efficiency
- Respect system preferences

### 10. Good Design is as Little Design as Possible
- Remove until it breaks
- White space is a feature
- Complexity is failure

## Visual Hierarchy

### The 60-30-10 Rule
- **60%** Primary/background (creates calm)
- **30%** Secondary (supports content)
- **10%** Accent (draws attention)

### Typography Scale
Use a consistent scale (1.25 ratio recommended):
```
Base:  16px / 17pt
Small: 13px / 14pt (0.8×)
Body:  16px / 17pt (1×)
Large: 20px / 21pt (1.25×)
Title: 25px / 26pt (1.56×)
Hero:  31px / 33pt (1.95×)
```

### Spacing System
Use 4pt/8pt base grid:
- **4pt:** Tight relationships (icon + label)
- **8pt:** Related elements (form fields)
- **16pt:** Grouped sections
- **24pt:** Major separations
- **32pt+:** Page-level spacing

## Platform Patterns

### iOS/macOS (Apple HIG)
- SF Pro/SF Compact for system feel
- SF Symbols for iconography
- System colors adapt to light/dark
- Respect Dynamic Type sizes
- Use semantic colors (`.label`, `.secondaryLabel`)

### Web
- System font stack for native feel
- CSS custom properties for theming
- Responsive breakpoints: 320, 768, 1024, 1440
- Touch targets: 44×44px minimum

### Cross-Platform
- Platform-specific navigation (tabs iOS, drawer Android)
- Adapt, don't force foreign patterns
- Shared design tokens, platform-specific expression

## Quick Audit Checklist

- [ ] Clear visual hierarchy (what's most important?)
- [ ] Consistent spacing (using the grid?)
- [ ] Typography limited (2-3 weights max)
- [ ] Color purposeful (60-30-10 rule?)
- [ ] Touch targets adequate (44pt minimum)
- [ ] States complete (loading, empty, error)
- [ ] Accessible contrast (4.5:1 for text)

## When to Use This Skill

- Designing new screens or components
- Reviewing existing UI for improvements
- Choosing typography, colors, spacing
- Ensuring cross-platform consistency
- Auditing visual hierarchy

## References

- `references/10-principles.md` - Deep dive on each Rams principle
- `references/platform-patterns.md` - iOS HIG, Material, Web specifics
- `references/visual-hierarchy.md` - Typography, spacing, color systems

## Keywords

interface design, UI design, visual design, Dieter Rams, design principles, typography, spacing, visual hierarchy, iOS design, HIG, design system, layout, composition
