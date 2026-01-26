# Claude Code Hooks

This directory contains automation hooks that run at specific points during Claude Code operations.

## How Hooks Work

Hooks are shell scripts that execute automatically:
- **PreToolUse/** - Runs BEFORE a tool executes (can block with exit 1)
- **PostToolUse/** - Runs AFTER a tool completes (advisory only)

## Directory Structure

```
hooks/
├── PreToolUse/
│   └── Edit/
│       └── security-check.sh   # Blocks hardcoded secrets
├── PostToolUse/
│   ├── Edit/
│   │   └── auto-lint.sh        # Runs linter after edits
│   └── Bash/
│       └── test-watcher.sh     # Reports test failures
└── README.md
```

## Available Hooks

### security-check.sh (PreToolUse/Edit)
**Purpose:** Prevent hardcoded secrets from being written to code

**Behavior:**
- Scans new content for API key patterns
- Blocks writes containing hardcoded credentials
- Exit 1 = block, Exit 0 = allow

**Detected Patterns:**
- `api_key = "..."`
- `password = "..."`
- `sk-...` (OpenAI format)
- `ghp_...` (GitHub token format)

### auto-lint.sh (PostToolUse/Edit)
**Purpose:** Run linter automatically after code edits

**Behavior:**
- Detects file type by extension
- Runs appropriate linter (SwiftLint, ESLint, Ruff, gofmt)
- Auto-fixes where possible
- Advisory only (never blocks)

**Supported:**
- Swift (.swift) → SwiftLint
- TypeScript/JavaScript (.ts, .tsx, .js, .jsx) → ESLint
- Python (.py) → Ruff
- Go (.go) → gofmt

### test-watcher.sh (PostToolUse/Bash)
**Purpose:** Highlight test failures prominently

**Behavior:**
- Detects test commands (swift test, npm test, pytest, etc.)
- Shows prominent warning on test failures
- Reminds about TDD rules
- Advisory only (never blocks)

## Creating New Hooks

1. Create script in appropriate directory
2. Make executable: `chmod +x script.sh`
3. Script receives tool-specific arguments
4. Exit 0 = success, Exit 1 = block (PreToolUse only)

## Testing Hooks

```bash
# Test security check
echo 'api_key = "secret123"' | ./PreToolUse/Edit/security-check.sh /dev/stdin

# Should output: BLOCKED: Potential hardcoded secret detected
```
