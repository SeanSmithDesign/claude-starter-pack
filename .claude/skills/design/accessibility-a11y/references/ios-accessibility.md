# iOS/macOS Accessibility with SwiftUI

## VoiceOver Basics

### Accessibility Labels
```swift
// Simple label
Image(systemName: "star.fill")
    .accessibilityLabel("Favorite")

// Dynamic label
Text("\(count)")
    .accessibilityLabel("\(count) items")

// Button with context
Button(action: delete) {
    Image(systemName: "trash")
}
.accessibilityLabel("Delete \(item.name)")
```

### Accessibility Hints
```swift
// Hint describes result of action
Button("Share") { share() }
    .accessibilityHint("Opens share sheet")

// Don't repeat the label in the hint
// ❌ "Tap to share"
// ✅ "Opens share sheet"
```

### Accessibility Values
```swift
// For controls with state
Slider(value: $volume, in: 0...100)
    .accessibilityValue("\(Int(volume)) percent")

// For progress
ProgressView(value: progress)
    .accessibilityValue("\(Int(progress * 100)) percent complete")
```

## Element Grouping

### Combine Elements
```swift
// VoiceOver reads as single item
HStack {
    Image(systemName: "person")
    VStack(alignment: .leading) {
        Text("John Doe")
        Text("Engineer")
    }
}
.accessibilityElement(children: .combine)
// Reads: "John Doe, Engineer"
```

### Ignore Elements
```swift
// Skip decorative content
Image("decorative-wave")
    .accessibilityHidden(true)

// Skip container, keep children
VStack {
    Text("Title")
    Text("Subtitle")
}
.accessibilityElement(children: .contain)
```

### Custom Grouping
```swift
// Create logical groups
VStack {
    // Group 1: Header
    Group {
        Text("Settings")
        Text("Customize your experience")
    }
    .accessibilityElement(children: .combine)

    // Group 2: Options (keep separate)
    Toggle("Dark Mode", isOn: $darkMode)
    Toggle("Notifications", isOn: $notifications)
}
```

## Custom Actions

```swift
// Add swipe actions for VoiceOver
MessageRow(message: message)
    .accessibilityAction(named: "Reply") {
        reply(to: message)
    }
    .accessibilityAction(named: "Delete") {
        delete(message)
    }
    .accessibilityAction(named: "Mark as read") {
        markAsRead(message)
    }
```

## Traits

```swift
// Mark as header for rotor navigation
Text("Settings")
    .accessibilityAddTraits(.isHeader)

// Mark as button if not obvious
HStack { /* custom button UI */ }
    .accessibilityAddTraits(.isButton)

// Mark as selected in list
Row(item: item)
    .accessibilityAddTraits(item.isSelected ? .isSelected : [])

// Update trait (selected toggle)
Toggle("Option", isOn: $isOn)
    .accessibilityRemoveTraits(.isButton)
    .accessibilityAddTraits(.isToggle)
```

## Focus Management

```swift
@FocusState private var focusedField: Field?

enum Field {
    case email, password
}

VStack {
    TextField("Email", text: $email)
        .focused($focusedField, equals: .email)

    SecureField("Password", text: $password)
        .focused($focusedField, equals: .password)

    Button("Login") {
        if email.isEmpty {
            focusedField = .email
        } else {
            login()
        }
    }
}
.onAppear {
    focusedField = .email
}
```

## Accessibility Notifications

```swift
// Announce changes
AccessibilityNotification.Announcement("Item deleted")
    .post()

// Move focus after change
AccessibilityNotification.LayoutChanged(nil)
    .post()

// Screen changed completely
AccessibilityNotification.ScreenChanged(newView)
    .post()
```

## Dynamic Type

```swift
// Allow text to scale
Text("Body text")
    .font(.body)  // Scales automatically

// Fixed size when necessary
Text("Tab Label")
    .font(.caption)
    .dynamicTypeSize(...DynamicTypeSize.accessibility1)

// Check current size
@Environment(\.dynamicTypeSize) var typeSize

if typeSize >= .accessibility1 {
    // Use larger tap targets
}
```

## Reduce Motion

```swift
@Environment(\.accessibilityReduceMotion) var reduceMotion

// Conditional animation
withAnimation(reduceMotion ? nil : .spring()) {
    showDetails.toggle()
}

// Alternative for motion
if reduceMotion {
    // Fade instead of slide
    content.opacity(isVisible ? 1 : 0)
} else {
    content.offset(x: isVisible ? 0 : 100)
}
```

## Color & Contrast

```swift
// Increase contrast support
@Environment(\.colorSchemeContrast) var contrast

var buttonBackground: Color {
    contrast == .increased ? .black : .blue
}

// Differentiate without color
@Environment(\.accessibilityDifferentiateWithoutColor) var diffWithoutColor

if diffWithoutColor {
    // Add icons or patterns in addition to color
}
```

## Testing with VoiceOver

### Enable VoiceOver
- **macOS:** Cmd + F5
- **iOS Simulator:** Cmd + Ctrl + Z
- **iOS Device:** Triple-click side button

### Rotor Navigation
- **iOS:** Two-finger rotate gesture
- **macOS:** VO + U
- Options: Headings, Links, Form Controls, Containers

### Common VoiceOver Gestures
| Gesture | Action |
|---------|--------|
| Swipe right | Next element |
| Swipe left | Previous element |
| Double-tap | Activate |
| Two-finger swipe up | Read all from top |
| Three-finger swipe | Scroll |

## Checklist

- [ ] All interactive elements have labels
- [ ] Labels are concise and descriptive
- [ ] Buttons describe their action
- [ ] Images have appropriate alt text
- [ ] Decorative images are hidden
- [ ] Related elements are grouped
- [ ] Custom actions provided where needed
- [ ] Focus order is logical
- [ ] Dynamic content announced
- [ ] Reduce motion respected
- [ ] Dynamic Type supported
- [ ] Tested with VoiceOver
