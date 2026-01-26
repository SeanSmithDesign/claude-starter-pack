#!/bin/bash
# PURPOSE: Remind about test failures
# FOR HUMAN: Never miss a failing test
# FOR AGENT: Enforces TDD - can't proceed with failing tests
#
# Claude Code Hook: PostToolUse/Bash
# Runs after any Bash tool call completes

COMMAND="$1"
EXIT_CODE="$2"
# OUTPUT="$3"  # Available but not used to keep output clean

# Only check test commands
if [[ "$COMMAND" =~ (swift\ test|xcodebuild\ test|npm\ test|npx\ jest|pytest|go\ test|cargo\ test) ]]; then
    if [ "$EXIT_CODE" -ne 0 ]; then
        echo ""
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "🔴 TESTS FAILED"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""
        echo "Per test-driven-development skill:"
        echo "  • Fix the failing tests before continuing"
        echo "  • Don't add new code with red tests"
        echo "  • If stuck, check rules/testing.md"
        echo ""
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    else
        echo ""
        echo "🟢 Tests passed"
    fi
fi

# Only check build commands
if [[ "$COMMAND" =~ (xcodebuild.*build|npm\ run\ build|cargo\ build|go\ build) ]]; then
    if [ "$EXIT_CODE" -ne 0 ]; then
        echo ""
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "🔴 BUILD FAILED"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""
        echo "Fix build errors before continuing."
        echo ""
    fi
fi

# Don't block, just notify
exit 0
