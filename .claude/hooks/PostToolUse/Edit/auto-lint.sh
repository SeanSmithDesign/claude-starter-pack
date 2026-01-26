#!/bin/bash
# PURPOSE: Run linter automatically after code edits
# FOR HUMAN: Keeps code consistent without manual invocation
# FOR AGENT: Provides immediate feedback on style issues
#
# Claude Code Hook: PostToolUse/Edit
# Runs after any Edit tool call completes

FILE="$1"
EXTENSION="${FILE##*.}"

# Only lint if the file exists and is a code file
if [ ! -f "$FILE" ]; then
    exit 0
fi

case "$EXTENSION" in
    swift)
        # SwiftLint for Swift files
        if command -v swiftlint &> /dev/null; then
            swiftlint lint --path "$FILE" --quiet 2>/dev/null
        fi
        ;;
    ts|tsx|js|jsx)
        # ESLint for TypeScript/JavaScript
        if command -v npx &> /dev/null && [ -f "package.json" ]; then
            npx eslint "$FILE" --fix --quiet 2>/dev/null
        fi
        ;;
    py)
        # Ruff for Python
        if command -v ruff &> /dev/null; then
            ruff check "$FILE" --fix --quiet 2>/dev/null
        fi
        ;;
    go)
        # gofmt for Go
        if command -v gofmt &> /dev/null; then
            gofmt -w "$FILE" 2>/dev/null
        fi
        ;;
esac

# Always exit 0 - linting is advisory, not blocking
exit 0
