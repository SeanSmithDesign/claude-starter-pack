---
name: session-notes
description: Use before compacting a thread or ending a session. Generates session notes documenting what was accomplished, commits created, files changed, and key commands. Always run after commits/pushes are complete.
license: MIT
metadata:
  version: 1.0.0
  category: workflow
  domain: documentation
  platforms: All
keywords:
  - session
  - notes
  - compact
  - documentation
  - summary
  - handoff
---

# Session Notes

## Overview

Generate session documentation before compacting a thread or ending work. Captures context that survives summarization and helps future sessions understand what was built.

## When to Use

**Always before:**
- Compacting a thread
- Ending a session
- Handing off to another person
- Taking a break

**Prerequisites:**
- All changes committed and pushed
- Working tree clean
- No pending work

## Workflow

### 1. Verify Clean State

```bash
git status
```

Confirm: `nothing to commit, working tree clean`

If not clean, commit and push first.

### 2. Gather Session Information

Collect:
- **Commits this session**: `git log --oneline -10`
- **Files changed**: Review commits for new/modified files
- **Features implemented**: Summarize what was built
- **Key commands**: Document useful commands for this project
- **Architecture decisions**: Note any important choices made

### 3. Generate Notes

Create or append to `docs/SESSION_NOTES.md`:

```markdown
# Session Notes — [project-name]

## [Date]

### Setup Completed
- [Environment, tools, integrations configured]

### Features Implemented
1. [Feature]: [Brief description]
2. [Feature]: [Brief description]

### New Files Created
- `path/to/file.ts` — [purpose]

### Key Commands
```bash
[Useful commands specific to this project]
```

### Commits
- `[hash]` [message]
- `[hash]` [message]

### Notes for Next Session
- [Any pending items or considerations]
```

### 4. Commit Notes

```bash
git add docs/SESSION_NOTES.md
git commit -m "Add session notes documentation"
git push origin [branch]
```

### 5. Confirm Ready to Compact

Verify:
- [ ] Session notes saved
- [ ] Notes committed and pushed
- [ ] Working tree clean

## Template

```markdown
# Session Notes — {{PROJECT_NAME}}

## {{DATE}}

### Setup Completed
-

### Features Implemented
1.

### New Files Created
-

### Key Commands
```bash

```

### Commits
-

### Notes for Next Session
-
```

## Examples

### Good Session Notes

```markdown
# Session Notes — annotie-web

## Feb 5, 2026

### Setup Completed
- Vercel CLI v50.9.6 — linked to project
- Supabase CLI v2.75.0 — linked to Annotie project
- TypeScript types generated from database schema

### Features Implemented
1. **Bug fix**: Waitlist form z-index issue (input now clickable)
2. **Dark mode**: ThemeProvider + toggle + system preference detection
3. **Interactive arrows**: Framer Motion with mouse repel effect

### New Files Created
- `src/components/ThemeProvider.tsx` — React context for theme
- `src/components/ThemeToggle.tsx` — Sun/moon toggle button
- `src/components/InteractiveArrow.tsx` — Mouse-reactive SVG

### Key Commands
```bash
pnpm dev                    # Run dev server
supabase gen types typescript --linked > src/lib/database.types.ts
vercel env pull             # Sync env variables
```

### Commits
- `62eadbd` Add dark mode, interactive arrows, and fix waitlist form
- `dd89f31` Add package-lock.json for reproducible builds

### Notes for Next Session
- Consider upgrading Next.js (security vulnerability in 14.2.3)
```

### Bad Session Notes

```markdown
## Notes
- Fixed stuff
- Added dark mode
- It works now
```

Missing: dates, specifics, commands, file paths, commit hashes.

## Integration with Compacting

Session notes ensure critical context survives thread compaction:

| Lost in Compaction | Preserved in Notes |
|--------------------|-------------------|
| Detailed conversation | Summary of decisions |
| Step-by-step debugging | Final solution |
| Exploration paths | What was chosen |
| Command iterations | Working commands |

## Checklist

Before compacting:

- [ ] All changes committed
- [ ] All commits pushed
- [ ] Session notes written
- [ ] Session notes committed
- [ ] Working tree clean
- [ ] Ready to compact
