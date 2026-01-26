# WCAG 2.1 AA Checklist

Complete checklist for Web Content Accessibility Guidelines 2.1 Level AA compliance.

## 1. Perceivable

### 1.1 Text Alternatives
- [ ] **1.1.1 Non-text Content (A)**: All images have alt text
  - Informative images: Describe content
  - Decorative images: Empty alt="" or aria-hidden="true"
  - Functional images (buttons): Describe action
  - Complex images: Long description available

### 1.2 Time-based Media
- [ ] **1.2.1 Audio-only/Video-only (A)**: Transcript or audio description
- [ ] **1.2.2 Captions (A)**: Synchronized captions for video
- [ ] **1.2.3 Audio Description (A)**: For prerecorded video
- [ ] **1.2.4 Captions Live (AA)**: Real-time captions
- [ ] **1.2.5 Audio Description (AA)**: For prerecorded video

### 1.3 Adaptable
- [ ] **1.3.1 Info and Relationships (A)**: Semantic structure
  - Headings use h1-h6 correctly
  - Lists use ul/ol/dl
  - Tables have headers
  - Form inputs have labels
- [ ] **1.3.2 Meaningful Sequence (A)**: Reading order logical
- [ ] **1.3.3 Sensory Characteristics (A)**: Don't rely on shape/position alone
- [ ] **1.3.4 Orientation (AA)**: Works in portrait and landscape
- [ ] **1.3.5 Identify Input Purpose (AA)**: Autocomplete on form fields

### 1.4 Distinguishable
- [ ] **1.4.1 Use of Color (A)**: Color not the only indicator
- [ ] **1.4.2 Audio Control (A)**: Can pause/stop auto-playing audio
- [ ] **1.4.3 Contrast Minimum (AA)**: 4.5:1 for text, 3:1 for large text
- [ ] **1.4.4 Resize Text (AA)**: Readable at 200% zoom
- [ ] **1.4.5 Images of Text (AA)**: Use real text, not images
- [ ] **1.4.10 Reflow (AA)**: No horizontal scroll at 320px width
- [ ] **1.4.11 Non-text Contrast (AA)**: 3:1 for UI components
- [ ] **1.4.12 Text Spacing (AA)**: Supports increased spacing
- [ ] **1.4.13 Content on Hover/Focus (AA)**: Dismissible, hoverable, persistent

---

## 2. Operable

### 2.1 Keyboard Accessible
- [ ] **2.1.1 Keyboard (A)**: All functionality via keyboard
- [ ] **2.1.2 No Keyboard Trap (A)**: Can navigate away from any element
- [ ] **2.1.4 Character Key Shortcuts (A)**: Single-key shortcuts can be turned off

### 2.2 Enough Time
- [ ] **2.2.1 Timing Adjustable (A)**: Can extend/disable timeouts
- [ ] **2.2.2 Pause, Stop, Hide (A)**: Moving content controllable

### 2.3 Seizures
- [ ] **2.3.1 Three Flashes (A)**: No content flashes more than 3x/second

### 2.4 Navigable
- [ ] **2.4.1 Bypass Blocks (A)**: Skip to main content link
- [ ] **2.4.2 Page Titled (A)**: Descriptive page titles
- [ ] **2.4.3 Focus Order (A)**: Logical focus sequence
- [ ] **2.4.4 Link Purpose (A)**: Link text describes destination
- [ ] **2.4.5 Multiple Ways (AA)**: Multiple ways to find pages
- [ ] **2.4.6 Headings and Labels (AA)**: Descriptive headings
- [ ] **2.4.7 Focus Visible (AA)**: Keyboard focus always visible

### 2.5 Input Modalities
- [ ] **2.5.1 Pointer Gestures (A)**: Single-pointer alternative
- [ ] **2.5.2 Pointer Cancellation (A)**: Up-event or undo available
- [ ] **2.5.3 Label in Name (A)**: Visible label in accessible name
- [ ] **2.5.4 Motion Actuation (A)**: Motion not required

---

## 3. Understandable

### 3.1 Readable
- [ ] **3.1.1 Language of Page (A)**: lang attribute on html
- [ ] **3.1.2 Language of Parts (AA)**: lang on foreign phrases

### 3.2 Predictable
- [ ] **3.2.1 On Focus (A)**: Focus doesn't change context
- [ ] **3.2.2 On Input (A)**: Input doesn't auto-submit
- [ ] **3.2.3 Consistent Navigation (AA)**: Same order across pages
- [ ] **3.2.4 Consistent Identification (AA)**: Same labels for same functions

### 3.3 Input Assistance
- [ ] **3.3.1 Error Identification (A)**: Errors clearly described
- [ ] **3.3.2 Labels or Instructions (A)**: Labels for inputs
- [ ] **3.3.3 Error Suggestion (AA)**: Suggestions for fixing errors
- [ ] **3.3.4 Error Prevention (AA)**: Review before submit (legal/financial)

---

## 4. Robust

### 4.1 Compatible
- [ ] **4.1.1 Parsing (A)**: Valid HTML
- [ ] **4.1.2 Name, Role, Value (A)**: Custom controls have ARIA
- [ ] **4.1.3 Status Messages (AA)**: Status announced to screen readers

---

## Quick Reference by Element

### Images
```html
<!-- Informative -->
<img src="chart.png" alt="Sales grew 25% in Q4">

<!-- Decorative -->
<img src="divider.png" alt="" role="presentation">

<!-- Complex -->
<figure>
  <img src="complex-chart.png" alt="Quarterly results (details below)">
  <figcaption>Full data in adjacent table</figcaption>
</figure>
```

### Forms
```html
<label for="email">Email *</label>
<input type="email" id="email" required
       aria-describedby="email-error"
       autocomplete="email">
<span id="email-error" role="alert">Please enter valid email</span>
```

### Buttons
```html
<!-- Text button -->
<button type="button">Save Draft</button>

<!-- Icon button -->
<button type="button" aria-label="Close">
  <svg aria-hidden="true">...</svg>
</button>
```

### Headings
```html
<h1>Page Title</h1>
  <h2>Section</h2>
    <h3>Subsection</h3>
  <h2>Another Section</h2>
```
