# Claude Starter Pack

A modular Claude Code configuration with skills, hooks, and rules for new projects.

## Quick Start

```bash
# Clone this repo
git clone git@github.com:seanstonsf/claude-starter-pack.git

# Copy to your project
cp -r claude-starter-pack/.claude ./your-project/
cp claude-starter-pack/templates/CLAUDE.md.template ./your-project/CLAUDE.md

# Edit CLAUDE.md with your project details
```

## Structure

```
.claude/
├── hooks/          # Automation (runs on tool use)
├── rules/          # Always-active guidelines
├── packs/          # Pack manifests & agent orchestration
└── skills/
    ├── core/       # Essential engineering & workflow (always include)
    ├── platform/
    │   ├── ios/    # iOS/macOS development
    │   └── web/    # React, Next.js, Playwright
    ├── design/     # Cross-platform design & accessibility
    ├── security/   # Security & compliance
    └── extended/   # Optional specialized skills
```

## Skill Layers

### Core (Always Include)
Essential engineering and workflow skills:

| Skill | Description |
|-------|-------------|
| senior-architect | System design, architecture patterns |
| senior-backend | APIs, databases, backend patterns |
| senior-devops | CI/CD, infrastructure, deployment |
| test-driven-development | TDD methodology & workflow |
| tdd-guide | Test generation & coverage |
| systematic-debugging | Root cause investigation |
| code-reviewer | Code review best practices |
| requesting-code-review | PR creation patterns |
| receiving-code-review | Feedback integration |
| brainstorming | Requirements exploration |
| writing-plans | Implementation planning |
| executing-plans | Plan execution with checkpoints |
| finishing-a-development-branch | Branch completion workflow |
| dispatching-parallel-agents | Parallel task execution |
| subagent-driven-development | Sequential with review gates |

### Platform

**iOS** (`platform/ios/`):
| Skill | Description |
|-------|-------------|
| ios-swift-development | SwiftUI, MVVM, Combine, Core Data |
| app-store-optimization | ASO for App Store |

**Web** (`platform/web/`):
| Skill | Description |
|-------|-------------|
| senior-frontend | React, Next.js, TypeScript, Tailwind |
| senior-fullstack | End-to-end web development |
| frontend-design | Bold UI aesthetics |
| playwright-e2e | E2E testing with Playwright |

### Design (Cross-Platform)
| Skill | Description |
|-------|-------------|
| interface-design | Dieter Rams' 10 principles for UI |
| accessibility-a11y | WCAG 2.1 AA, VoiceOver, ARIA |
| ui-design-system | Design tokens, components |
| ux-researcher-designer | User research, personas, journey maps |

### Security (Recommended)
| Skill | Description |
|-------|-------------|
| senior-security | AppSec, penetration testing, threat modeling |
| senior-secops | Vulnerability management, compliance |
| gdpr-dsgvo-expert | GDPR/privacy compliance |
| information-security-manager-iso27001 | ISO 27001 ISMS |

### Extended (Optional)
Additional specialized skills in `extended/`:
- AI/ML, Data Science
- Product Management
- Marketing & Content
- C-Level Advisory
- HealthTech/Regulatory

## Installation Methods

### Full Installation
```bash
# Copy everything
cp -r claude-starter-pack/.claude ./your-project/
```

### Selective Installation
```bash
# iOS project (no web skills)
mkdir -p ./your-project/.claude/skills
cp -r claude-starter-pack/.claude/hooks ./your-project/.claude/
cp -r claude-starter-pack/.claude/rules ./your-project/.claude/
cp -r claude-starter-pack/.claude/packs ./your-project/.claude/
cp -r claude-starter-pack/.claude/skills/core ./your-project/.claude/skills/
cp -r claude-starter-pack/.claude/skills/platform/ios ./your-project/.claude/skills/
cp -r claude-starter-pack/.claude/skills/design ./your-project/.claude/skills/
cp -r claude-starter-pack/.claude/skills/security ./your-project/.claude/skills/
```

### Adding Skills Later
```bash
# Pull latest
cd claude-starter-pack && git pull

# Copy specific skill
cp -r claude-starter-pack/.claude/skills/extended/senior-ml-engineer ./your-project/.claude/skills/
```

## Hooks

Hooks automate quality checks:

| Hook | Trigger | Action |
|------|---------|--------|
| `security-check.sh` | Before file edit | Blocks hardcoded secrets |
| `auto-lint.sh` | After file edit | Runs linter on changed files |
| `test-watcher.sh` | After bash command | Reports test failures |

**Note:** Hooks run in CLI only. For cloud/mobile, rules are embedded in CLAUDE.md.

## Rules

Always-active guidelines in `rules/`:

| Rule | Purpose |
|------|---------|
| `security.md` | Privacy by Design, secrets, PII |
| `code-quality.md` | Naming, structure, patterns |
| `testing.md` | TDD requirements |

## Works With

- ✅ Claude Code CLI (full features)
- ✅ Claude Code Web (skills + rules)
- ✅ Claude Code iOS (skills + rules via GitHub connection)

## License

MIT
