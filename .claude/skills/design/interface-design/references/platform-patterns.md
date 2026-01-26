# Platform Design Patterns

## iOS / macOS (Apple Human Interface Guidelines)

### Core Principles
- **Clarity:** Content is paramount, UI supports it
- **Deference:** Fluid motion and crisp interface defer to content
- **Depth:** Visual layers and realistic motion convey hierarchy

### Navigation Patterns

**Tab Bar (iOS)**
- 5 tabs maximum
- Use SF Symbols for icons
- Labels always visible
- Badge for notifications

**Navigation Bar**
- Title centered (iOS) or left (macOS)
- Back button with previous screen title
- Right side for actions (Edit, Add, Share)

**Sidebar (macOS/iPadOS)**
- Primary navigation in sidebar
- Collapsible for space efficiency
- Source list style for document-based apps

### Typography
```swift
// System Fonts
.font(.largeTitle)      // 34pt, Bold
.font(.title)           // 28pt
.font(.title2)          // 22pt
.font(.title3)          // 20pt
.font(.headline)        // 17pt, Semibold
.font(.body)            // 17pt
.font(.callout)         // 16pt
.font(.subheadline)     // 15pt
.font(.footnote)        // 13pt
.font(.caption)         // 12pt
.font(.caption2)        // 11pt
```

### Colors
```swift
// Semantic Colors (adapt to light/dark)
Color.primary           // Main text
Color.secondary         // Supporting text
Color.accentColor       // Tint color (user-configurable)

// Background Colors
Color(.systemBackground)
Color(.secondarySystemBackground)
Color(.tertiarySystemBackground)
```

### Spacing
- 8pt grid system
- Standard margins: 16pt (compact), 20pt (regular)
- Cell padding: 12-16pt
- Section spacing: 35pt

### Key Patterns
- Pull-to-refresh for list updates
- Swipe actions on table rows
- Context menus (long press)
- Share sheets for content sharing
- Sheets for focused tasks

---

## Web / React

### Responsive Breakpoints
```css
/* Mobile First */
@media (min-width: 320px)  { /* Mobile */ }
@media (min-width: 768px)  { /* Tablet */ }
@media (min-width: 1024px) { /* Desktop */ }
@media (min-width: 1440px) { /* Large Desktop */ }
```

### Typography (System Stack)
```css
font-family: -apple-system, BlinkMacSystemFont, "Segoe UI",
             Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;

/* Scale */
--font-xs: 0.75rem;   /* 12px */
--font-sm: 0.875rem;  /* 14px */
--font-base: 1rem;    /* 16px */
--font-lg: 1.125rem;  /* 18px */
--font-xl: 1.25rem;   /* 20px */
--font-2xl: 1.5rem;   /* 24px */
--font-3xl: 1.875rem; /* 30px */
```

### Spacing (4px base)
```css
--space-1: 0.25rem;   /* 4px */
--space-2: 0.5rem;    /* 8px */
--space-3: 0.75rem;   /* 12px */
--space-4: 1rem;      /* 16px */
--space-6: 1.5rem;    /* 24px */
--space-8: 2rem;      /* 32px */
--space-12: 3rem;     /* 48px */
```

### Touch Targets
- Minimum: 44×44px (iOS), 48×48px (Material)
- Preferred: 48×48px with 8px gap
- Links in text: 44px line-height minimum

### Navigation Patterns
- Top navigation for primary sections
- Side navigation for complex apps
- Breadcrumbs for deep hierarchies
- Mobile: Bottom tabs or hamburger menu

### Focus States
```css
/* Always visible focus for accessibility */
:focus-visible {
  outline: 2px solid var(--accent-color);
  outline-offset: 2px;
}
```

---

## Cross-Platform Considerations

### What to Share
- Design tokens (colors, spacing, typography scales)
- Brand elements (logos, icons, voice)
- Core UX flows and information architecture

### What to Adapt
- Navigation patterns (tabs vs. drawer)
- Gesture behaviors (back swipe)
- System integrations (share sheets, notifications)
- Typography (SF Pro vs. Roboto vs. system)

### Platform-Specific Navigation

| Action | iOS | Android | Web |
|--------|-----|---------|-----|
| Primary Nav | Tab Bar | Bottom Nav | Top Nav |
| Back | Swipe/Button | System Back | Browser Back |
| Menu | Long Press | Overflow Menu | Right Click |
| Share | Share Sheet | Share Intent | Web Share API |

### Color Adaptation
```
// Define semantic tokens
--color-primary: #007AFF;        // iOS blue
--color-primary-android: #6200EE; // Material purple
--color-primary-web: #0066CC;    // Web convention

// Or use CSS custom properties with fallbacks
--color-action: var(--platform-primary, #007AFF);
```

### Motion Principles
- **iOS:** Spring physics, bouncy, playful
- **Material:** Easing curves, responsive, physical
- **Web:** Subtle, fast, non-blocking

```css
/* Platform-appropriate timing */
--duration-fast: 150ms;
--duration-normal: 250ms;
--duration-slow: 400ms;

/* iOS-style spring */
--ease-spring: cubic-bezier(0.175, 0.885, 0.32, 1.275);

/* Material standard */
--ease-standard: cubic-bezier(0.4, 0.0, 0.2, 1);
```
