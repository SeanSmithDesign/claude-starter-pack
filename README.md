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
├── mcp/            # MCP server documentation & setup
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

### MCP Servers (Optional)

MCP (Model Context Protocol) servers extend Claude Code with live external tool access. These are opt-in and require one-time setup.

| Server | Description | Setup |
|--------|-------------|-------|
| Figma Console | Design token extraction, component inspection, screenshots | `claude mcp add --transport sse figma-console https://figma-console-mcp.southleft.com/sse` |
| Design Systems | Semantic search across 188+ design systems (W3C, WCAG, Material, etc.) | `claude mcp add --transport http design-systems https://design-systems-mcp.southleft.com/mcp` |

**Companion Skills** (installed automatically with design skills):

| Skill | Description | Requires MCP |
|-------|-------------|-------------|
| figma-design-bridge | Design-to-code workflow using Figma | figma-console |
| design-knowledge-search | Search curated design systems knowledge | design-systems |

See `.claude/mcp/README.md` for full details, additional setup modes, and future MCP options.

### Security (Recommended)
| Skill | Description |
|-------|-------------|
| senior-security | AppSec, penetration testing, threat modeling |
| senior-secops | Vulnerability management, compliance |
| gdpr-dsgvo-expert | GDPR/privacy compliance |
| information-security-manager-iso27001 | ISO 27001 ISMS |

### Extended (Optional)
Additional specialized skills in `extended/`. Copy only what you need:

**AI/ML & Data:**
| Skill | Description |
|-------|-------------|
| senior-ml-engineer | ML pipelines, model training |
| senior-data-scientist | Data analysis, modeling |
| senior-data-engineer | Data pipelines, ETL |
| senior-computer-vision | CV models, image processing |
| senior-prompt-engineer | Prompt design, LLM optimization |

**Product & Strategy:**
| Skill | Description |
|-------|-------------|
| product-manager-toolkit | PRDs, roadmaps, prioritization |
| agile-product-owner | Agile/Scrum methodology |
| product-strategist | Product strategy |

**Marketing & Content:**
| Skill | Description |
|-------|-------------|
| content-creator | Blog, social content |
| marketing-strategy-pmm | Product marketing |
| marketing-demand-acquisition | Growth, lead gen |
| social-media-analyzer | Social metrics analysis |

**C-Level Advisory:**
| Skill | Description |
|-------|-------------|
| ceo-advisor | Executive strategy |
| cto-advisor | Technical leadership |
| c-level | General executive advisory |

**HealthTech & Regulatory:**
| Skill | Description |
|-------|-------------|
| mdr-745-specialist | EU MDR compliance |
| fda-consultant-specialist | FDA 510(k), QSR |
| quality-manager-qms-iso13485 | ISO 13485 QMS |
| quality-manager-qmr | Quality management |
| regulatory-affairs-head | Regulatory strategy |
| risk-management-specialist | ISO 14971 risk management |
| capa-officer | CAPA processes |
| qms-audit-expert | QMS auditing |
| isms-audit-expert | ISMS auditing |
| quality-documentation-manager | QMS documentation |

**Infrastructure & QA:**
| Skill | Description |
|-------|-------------|
| aws-solution-architect | AWS architecture |
| ms365-tenant-manager | Microsoft 365 admin |
| senior-qa | Quality assurance |
| tech-stack-evaluator | Technology selection |

**Workflow & Writing:**
| Skill | Description |
|-------|-------------|
| writing-skills | Technical writing |
| using-git-worktrees | Git worktree workflows |
| using-superpowers | Claude Code power features |
| verification-before-completion | Pre-commit verification |

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
