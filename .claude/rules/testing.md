# Testing Rules (Always Active)

These rules enforce Test-Driven Development and quality testing practices.

## TDD Requirements

- **No production code without a failing test first**
- Follow: 🔴 Red → 🟢 Green → 🔵 Refactor
- Watch the test fail before implementing
- Write minimal code to pass the test

### The Iron Law
```
Production code → test exists and failed first
Otherwise → not TDD
```

## Test Quality

### One Behavior Per Test
- Test name describes the single behavior
- "and" in test name = split into multiple tests
- Bad: `test_validates_email_and_saves_user`
- Good: `test_rejects_invalid_email`, `test_saves_valid_user`

### Clear Names
- Describe expected behavior, not implementation
- Pattern: `test_<action>_<condition>_<expectation>`
- Example: `test_login_with_invalid_password_shows_error`

### Real Code Over Mocks
- Use real implementations when possible
- Mock only external dependencies (network, file system)
- If mocking everything, design may need refactoring

## Test Structure

### Arrange-Act-Assert (AAA)
```swift
func testUserRegistration() {
    // Arrange
    let service = UserService()
    let input = RegistrationInput(email: "test@example.com")

    // Act
    let result = service.register(input)

    // Assert
    XCTAssertTrue(result.isSuccess)
}
```

### Test Independence
- Each test sets up its own state
- Tests can run in any order
- No shared mutable state between tests

## What to Test

### Must Test
- Business logic and domain rules
- Edge cases and error conditions
- Integration points (APIs, databases)
- User-facing functionality

### Don't Over-Test
- Don't test framework code
- Don't test trivial getters/setters
- Don't test private implementation details

## Bug Fixes

- Write failing test reproducing the bug first
- Then fix the bug
- Test proves fix and prevents regression

## Swift/XCTest Specifics

- Use `XCTAssertEqual` for value comparisons
- Use `XCTAssertThrowsError` for error cases
- Use `expectation` for async tests
- Keep test targets fast (< 10 seconds)

## Quick Checklist

- [ ] Test written before implementation
- [ ] Watched test fail first
- [ ] One behavior per test
- [ ] Clear, descriptive test name
- [ ] Uses real code where possible
- [ ] Edge cases covered
- [ ] All tests pass before commit
