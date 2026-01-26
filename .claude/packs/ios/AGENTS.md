# iOS Pack - Agent Orchestration

Extends Core Pack with iOS/macOS-specific capabilities.

**Inherits from:** `core/AGENTS.md`

## iOS Agent Personas

### iOS Developer Agent
**Inherits:** Developer Agent (from Core)
**Additional Skills:** ios-swift-development
**Patterns:** SwiftUI, MVVM, Combine, async/await
**Triggers:** "SwiftUI", "iOS", "macOS", "Swift", "Xcode"

**Enhanced Workflow:**
1. Write failing XCTest (RED)
2. Implement with SwiftUI/UIKit (GREEN)
3. Check accessibility (VoiceOver)
4. Refactor following Swift conventions (REFACTOR)

**iOS-Specific Checks:**
- @MainActor for UI updates
- Memory management ([weak self])
- Accessibility labels and hints
- Dynamic Type support

---

### App Store Agent
**Skills:** app-store-optimization, ios-swift-development
**Triggers:** "App Store", "ASO", "launch", "release", "submit"

**Workflow:**
1. Review app metadata and screenshots
2. Optimize keywords and descriptions
3. Prepare release notes
4. Pre-submission checklist

---

### iOS UI Agent
**Inherits:** Developer Agent
**Additional Skills:** ios-swift-development, interface-design, accessibility-a11y

**Workflow:**
1. Apply Rams design principles
2. Follow Apple HIG patterns
3. Implement with SwiftUI
4. Test with VoiceOver
5. Verify Dynamic Type scaling

**Checklist:**
- [ ] Uses system colors (adapts to dark mode)
- [ ] SF Symbols for iconography
- [ ] Accessibility labels on all controls
- [ ] Touch targets ≥ 44pt
- [ ] Respects reduced motion

---

## iOS Skill Chains

### iOS Feature Development
```
brainstorming → writing-plans → ios-swift-development + test-driven-development → interface-design audit → accessibility-a11y check → code-reviewer → finishing-a-development-branch
```

### iOS UI Implementation
```
interface-design (design thinking) → ios-swift-development (implementation) → accessibility-a11y (verification) → code-reviewer
```

### App Store Submission
```
ios-swift-development (final build) → app-store-optimization (metadata) → code-reviewer (checklist)
```

---

## Platform-Specific Patterns

### SwiftUI View Pattern
```swift
struct FeatureView: View {
    @StateObject private var viewModel: FeatureViewModel
    @Environment(\.accessibilityReduceMotion) var reduceMotion

    var body: some View {
        // Content
    }
}
```

### MVVM + Combine
```swift
@MainActor
class FeatureViewModel: ObservableObject {
    @Published private(set) var state: State = .idle

    func load() async {
        state = .loading
        // ...
    }
}
```

### Testing Pattern
```swift
final class FeatureTests: XCTestCase {
    @MainActor
    func testFeature() async throws {
        // Arrange
        let sut = FeatureViewModel()

        // Act
        await sut.load()

        // Assert
        XCTAssertEqual(sut.state, .loaded)
    }
}
```

---

## Sub-Agent iOS Extensions

When using `dispatching-parallel-agents` or `subagent-driven-development`:

**iOS sub-agents additionally use:**
- ios-swift-development
- interface-design (for UI tasks)
- accessibility-a11y (for UI tasks)

**iOS-specific sub-agent prompts should include:**
- Target iOS version
- SwiftUI vs UIKit preference
- Accessibility requirements
- Any platform constraints (iPad, Mac Catalyst)

---

## iOS Quick Reference

### Build Commands
```bash
# Build
xcodebuild -project Annotie.xcodeproj -scheme Annotie build

# Test
xcodebuild -project Annotie.xcodeproj -scheme Annotie test

# Clean
xcodebuild -project Annotie.xcodeproj -scheme Annotie clean
```

### Common Imports
```swift
import SwiftUI
import Combine
import Foundation
```

### Key Apple Frameworks
- SwiftUI (UI)
- Combine (Reactive)
- Core Data (Persistence)
- CloudKit (Sync)
- StoreKit (Purchases)
- AppIntents (Shortcuts)
