#!/bin/bash
# PURPOSE: Prevent writing secrets/PII to code
# FOR HUMAN: Safety net - catches accidental credential commits
# FOR AGENT: Enforces Privacy by Design (from rules/security.md)
#
# Claude Code Hook: PreToolUse/Edit
# Runs BEFORE any Edit tool call executes
# Exit 0 = allow, Exit 1 = block

FILE="$1"
NEW_CONTENT="$2"

# Skip non-code files
EXTENSION="${FILE##*.}"
case "$EXTENSION" in
    md|txt|json|yaml|yml|xml|html|css|lock)
        exit 0
        ;;
esac

# Check for common secret patterns
# Pattern: key/secret/password/token followed by = and a quoted string value
if echo "$NEW_CONTENT" | grep -qiE "(api[_-]?key|password|secret|private[_-]?key|auth[_-]?token|access[_-]?token|credential)[[:space:]]*[=:][[:space:]]*['\"][^'\"]{8,}['\"]"; then
    echo ""
    echo "⚠️  BLOCKED: Potential hardcoded secret detected"
    echo ""
    echo "Found pattern that looks like a hardcoded credential."
    echo "Use environment variables or keychain instead."
    echo ""
    echo "See: .claude/rules/security.md"
    echo ""
    exit 1
fi

# Check for hardcoded API keys (common formats)
if echo "$NEW_CONTENT" | grep -qE "(sk-[a-zA-Z0-9]{20,}|pk_live_[a-zA-Z0-9]+|ghp_[a-zA-Z0-9]+|xox[baprs]-[a-zA-Z0-9]+)"; then
    echo ""
    echo "⚠️  BLOCKED: API key pattern detected"
    echo ""
    echo "Found what appears to be a production API key."
    echo "Never commit API keys to source code."
    echo ""
    echo "See: .claude/rules/security.md"
    echo ""
    exit 1
fi

# All checks passed
exit 0
