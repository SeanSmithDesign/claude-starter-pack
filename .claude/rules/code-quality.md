# Code Quality Rules (Always Active)

These rules ensure consistent, maintainable code across platforms.

## Naming Conventions

### Functions/Methods
- Verb + noun: `getUserById()`, `calculateTotal()`, `fetchScreenshots()`
- Swift: Use Swift API Design Guidelines naming

### Booleans
- Prefix with: `is`, `has`, `should`, `can`, `will`
- Examples: `isValid`, `hasAccess`, `shouldRefresh`, `canEdit`

### Constants
- SCREAMING_SNAKE for true constants: `MAX_RETRIES`, `DEFAULT_TIMEOUT`
- Swift: Use camelCase for static let: `static let maxRetries = 3`

### Types/Classes
- PascalCase: `ScreenCaptureService`, `UserProfile`, `AnnotationWindow`
- Protocols: Often end with `-able`, `-ing`, or `-Delegate`

## Structure & Organization

### Functions
- One concern per function
- Target: Max 20 lines (suggest split if longer)
- No side effects in getters

### Files
- One primary type per file
- Related helpers can be extensions in same file
- Group by feature, not by type

### Dependencies
- Prefer composition over inheritance
- Use dependency injection for testability
- Minimize coupling between modules

## Swift Specifics

### Concurrency
- Use `@MainActor` for UI updates
- Prefer `async/await` over callbacks
- Use `Task` for structured concurrency

### Memory Management
- Use `[weak self]` in closures that outlive scope
- Avoid retain cycles in delegates
- Use `@State`, `@StateObject` appropriately in SwiftUI

### SwiftUI
- Extract reusable views as separate structs
- Use `@ViewBuilder` for conditional content
- Prefer `PreviewProvider` for design iteration

### Error Handling
- Use Swift's `throws` for recoverable errors
- Use `Result` type for async operations where appropriate
- Provide meaningful error messages

## TypeScript Specifics

### Types
- Prefer `const` over `let`
- Enable strict null checks
- Use union types over enums when appropriate

### React
- Prefer functional components with hooks
- Use `useMemo`/`useCallback` for performance
- Extract custom hooks for shared logic

## Code Smells to Avoid

- Magic numbers (extract as named constants)
- Deep nesting (refactor to early returns)
- Long parameter lists (use options objects)
- Commented-out code (delete it)
- Copy-paste duplication (extract shared logic)

## Quick Checklist

- [ ] Clear, descriptive names
- [ ] Functions under 20 lines
- [ ] No magic numbers
- [ ] Proper memory management
- [ ] Consistent formatting
- [ ] No commented-out code
