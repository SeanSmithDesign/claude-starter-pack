# Starter Packs

Modular, composable skill packs for different project types.

## Architecture

```
┌─────────────────────────────────────────────────────┐
│              AUTOMATION LAYER                        │
│      hooks/ + rules/ + AGENTS.md orchestration      │
├─────────────────────────────────────────────────────┤
│  ┌──────────┐  ┌──────────┐  ┌──────────────────┐  │
│  │ iOS Pack │  │ Web Pack │  │ Cross-Platform   │  │
│  └──────────┘  └──────────┘  └──────────────────┘  │
├─────────────────────────────────────────────────────┤
│             DESIGN & ACCESSIBILITY                   │
│   interface-design + accessibility + ui-design       │
├─────────────────────────────────────────────────────┤
│                 SECURITY LAYER                       │
│     gdpr + iso-27001 + senior-security              │
├─────────────────────────────────────────────────────┤
│                   CORE LAYER                         │
│  architecture, TDD, workflow, code-review, devops   │
└─────────────────────────────────────────────────────┘
```

## Available Packs

### Core Pack (Always Included)
**Location:** `packs/core/`

**Contains:**
- Engineering fundamentals (architecture, backend, devops)
- Quality skills (TDD, code review, debugging)
- Workflow skills (brainstorming, planning, execution)
- Sub-agent patterns (parallel dispatch, sequential with review)

**Also includes:**
- Cross-cutting: interface-design, accessibility-a11y
- Security: senior-security, gdpr-dsgvo-expert

### iOS Pack
**Location:** `packs/ios/`
**Depends on:** Core Pack

**Contains:**
- ios-swift-development
- app-store-optimization

**Patterns:** SwiftUI, MVVM, Combine, VoiceOver

### Web Pack
**Location:** `packs/web/`
**Depends on:** Core Pack

**Contains:**
- senior-frontend
- senior-fullstack
- frontend-design
- playwright-e2e (planned)

**Patterns:** React, Next.js, TypeScript, WCAG 2.1 AA

## Pack Structure

Each pack contains:

```
pack-name/
├── manifest.json    # Pack definition (skills, dependencies, settings)
└── AGENTS.md        # Agent personas and workflow chains
```

### manifest.json

```json
{
  "name": "pack-name",
  "version": "1.0.0",
  "skills": ["skill-1", "skill-2"],
  "dependencies": ["core"],
  "agents": "AGENTS.md"
}
```

### AGENTS.md

Defines:
- Agent personas (which skills they use)
- Skill chains (ordered workflows)
- Sub-agent patterns (parallel vs sequential)

## Using Packs

### For a New iOS Project

1. Copy core + iOS pack skills
2. Copy hooks and rules
3. Customize CLAUDE.md for your project

```bash
# Core always included
cp -r packs/core/AGENTS.md .claude/

# Add iOS pack
cp -r packs/ios/AGENTS.md .claude/packs/ios/
```

### For a New Web Project

1. Copy core + Web pack skills
2. Copy hooks and rules
3. Customize CLAUDE.md for your project

```bash
# Core always included
cp -r packs/core/AGENTS.md .claude/

# Add Web pack
cp -r packs/web/AGENTS.md .claude/packs/web/
```

## Creating Custom Packs

1. Create pack directory: `packs/my-pack/`
2. Create `manifest.json` with skills list
3. Create `AGENTS.md` with workflows
4. Test with a sample project

## Context Optimization

Packs are designed for minimal context usage:

| Component | When Loaded | Cost |
|-----------|-------------|------|
| manifest.json | Never | 0 |
| AGENTS.md | On-demand | ~300 tokens |
| Skills | On-demand | ~500-800 each |
| Hooks | External | 0 |
| Rules | Always | ~200-500 total |

Typical usage: ~1,500 tokens base + skills as needed.
