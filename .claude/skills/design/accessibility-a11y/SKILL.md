---
name: accessibility-a11y
description: Accessibility expertise for WCAG compliance, screen reader support, and inclusive design. Use when building UI, auditing accessibility, testing with VoiceOver/NVDA, or when user mentions accessibility, a11y, WCAG, screen reader, or contrast.
license: MIT
metadata:
  version: 1.0.0
  category: design
  domain: accessibility
  platforms: iOS, macOS, Web, Cross-Platform
  standards: WCAG 2.1 AA, Section 508, EN 301 549
---

# Accessibility (a11y)

Accessibility is not a feature—it's a quality requirement. **1 in 4 adults** have a disability. Build for everyone.

## Core Principles (POUR)

### Perceivable
- Content available to all senses
- Text alternatives for non-text content
- Captions for video, descriptions for audio
- Color not the only way to convey information

### Operable
- All functionality via keyboard
- Enough time to read and interact
- No seizure-inducing content
- Clear navigation and focus

### Understandable
- Readable text
- Predictable behavior
- Input assistance and error prevention

### Robust
- Compatible with assistive technologies
- Valid, semantic markup
- Works across browsers and devices

## Quick Wins (Do These First)

1. **Color Contrast**: 4.5:1 for normal text, 3:1 for large text
2. **Focus Indicators**: Visible focus state on all interactive elements
3. **Alt Text**: Meaningful descriptions for all images
4. **Labels**: Every form input has a label
5. **Headings**: Logical heading hierarchy (h1→h2→h3)
6. **Touch Targets**: 44×44pt minimum

## Platform Implementation

### iOS/macOS (VoiceOver)

```swift
// Basic accessibility
Image(systemName: "star.fill")
    .accessibilityLabel("Favorite")
    .accessibilityHint("Double-tap to add to favorites")

// Button with action description
Button("Delete") { delete() }
    .accessibilityLabel("Delete photo")
    .accessibilityHint("Double-tap to permanently delete this photo")

// Grouping related elements
VStack {
    Text("John Doe")
    Text("Software Engineer")
}
.accessibilityElement(children: .combine)

// Hide decorative elements
Image("decorative-line")
    .accessibilityHidden(true)

// Custom actions
.accessibilityAction(named: "Mark as read") {
    markAsRead()
}
```

### Web (ARIA)

```html
<!-- Landmarks -->
<nav aria-label="Main navigation">
<main aria-labelledby="page-title">
<aside aria-label="Related content">

<!-- Buttons that look like links -->
<button type="button" aria-label="Close dialog">×</button>

<!-- Live regions for dynamic content -->
<div aria-live="polite" aria-atomic="true">
  <!-- Status updates announced here -->
</div>

<!-- Form inputs -->
<label for="email">Email address</label>
<input type="email" id="email" aria-describedby="email-hint" required>
<span id="email-hint">We'll never share your email</span>

<!-- Focus management -->
<dialog aria-modal="true" aria-labelledby="dialog-title">
```

## Testing Checklist

### Automated Testing
- [ ] Run aXe or Lighthouse accessibility audit
- [ ] Check color contrast with tool
- [ ] Validate HTML structure
- [ ] Test with ESLint accessibility plugin

### Manual Testing
- [ ] Navigate entire app with keyboard only
- [ ] Use with screen reader (VoiceOver, NVDA)
- [ ] Test at 200% zoom
- [ ] Disable CSS and check content order
- [ ] Check without images (alt text visible)

### Screen Reader Testing

**VoiceOver (macOS/iOS)**
- Cmd+F5 to enable (macOS)
- Triple-click home/side button (iOS)
- Use rotor for headings, links, form controls

**NVDA (Windows)**
- Free, open-source
- Test with Firefox for best compatibility

## Color Contrast Requirements

| Content Type | Minimum Ratio | Tools |
|-------------|---------------|-------|
| Normal text (<18pt) | 4.5:1 | WebAIM Contrast Checker |
| Large text (≥18pt or 14pt bold) | 3:1 | |
| UI components | 3:1 | |
| Graphical objects | 3:1 | |

### Common Failures
```css
/* ❌ FAIL: 2.4:1 ratio */
color: #888;  /* gray on white */

/* ✅ PASS: 4.6:1 ratio */
color: #595959;  /* darker gray on white */
```

## Focus Management

### Requirements
- All interactive elements focusable
- Focus order matches visual order
- Focus visible at all times
- Focus trapped in modals

### SwiftUI Focus
```swift
@FocusState private var isFocused: Bool

TextField("Name", text: $name)
    .focused($isFocused)

// Move focus programmatically
Button("Skip to main") {
    isFocused = true
}
```

### Web Focus
```css
/* Never do this */
*:focus { outline: none; }

/* Do this instead */
:focus-visible {
    outline: 2px solid #0066CC;
    outline-offset: 2px;
}
```

## Motion & Animation

```swift
// Respect reduced motion preference
@Environment(\.accessibilityReduceMotion) var reduceMotion

withAnimation(reduceMotion ? nil : .spring()) {
    // animation
}
```

```css
/* Reduce motion */
@media (prefers-reduced-motion: reduce) {
    * {
        animation-duration: 0.01ms !important;
        transition-duration: 0.01ms !important;
    }
}
```

## References

- `references/wcag-checklist.md` - Full WCAG 2.1 AA checklist
- `references/aria-patterns.md` - Common ARIA patterns
- `references/screen-reader-testing.md` - VoiceOver and NVDA guides
- `references/ios-accessibility.md` - iOS/SwiftUI specifics

## Keywords

accessibility, a11y, WCAG, screen reader, VoiceOver, NVDA, ARIA, contrast, focus, keyboard navigation, inclusive design, Section 508, alt text, semantic HTML
