# Core Pack - Agent Orchestration

This file defines how skills combine into agent personas and workflow chains.

## Agent Personas

### Architect Agent
**Skills:** senior-architect, writing-plans
**Triggers:** "design", "architecture", "system design", "structure", "how should I build"
**Workflow:**
1. Explore codebase to understand context
2. Design system architecture
3. Document decisions (ADRs if needed)
4. Create implementation plan

**Use when:** Starting new features, major refactoring, system design questions

---

### Developer Agent
**Skills:** test-driven-development, systematic-debugging, code-reviewer
**Triggers:** "implement", "build", "fix", "code", "create"
**Workflow:**
1. Write failing test (RED)
2. Implement minimal code (GREEN)
3. Refactor if needed (REFACTOR)
4. Self-review before commit

**Use when:** Implementing features, fixing bugs, writing code

---

### Reviewer Agent
**Skills:** code-reviewer, receiving-code-review, requesting-code-review
**Triggers:** "review", "PR", "feedback", "check my code"
**Workflow:**
1. Understand the change context
2. Review for correctness, security, maintainability
3. Provide constructive feedback
4. Approve or request changes

**Use when:** Code reviews, PR preparation, feedback integration

---

### Debug Agent
**Skills:** systematic-debugging, test-driven-development
**Triggers:** "bug", "broken", "not working", "error", "crash"
**Workflow:**
1. Reproduce the issue
2. Identify root cause
3. Write failing test proving the bug
4. Fix and verify test passes

**Use when:** Debugging issues, investigating errors

---

### Design Bridge Agent
**Skills:** figma-design-bridge, design-knowledge-search, interface-design, accessibility-a11y
**MCP Required:** figma-console, design-systems (optional, graceful fallback)
**Triggers:** "Figma", "design tokens", "design specs", "extract from design", "design system research", "implement this design"

**Workflow:**
1. Take Figma screenshot to understand current design (`figma_take_screenshot`)
2. Extract design tokens and variables (`figma_get_variables`, `figma_get_styles`)
3. Research relevant design system patterns (`search_design_knowledge`)
4. Inspect specific components for dev specs (`figma_get_component_for_development`)
5. Generate platform-appropriate code with tokens applied

**Use when:** Implementing designs from Figma, extracting design tokens, researching design system best practices, creating components that match design specifications.

**Fallback:** If MCP servers are not configured, use interface-design and ui-design-system skills with manual specifications.

---

## Skill Chains

### Feature Development Chain
```
brainstorming → writing-plans → test-driven-development → code-reviewer → finishing-a-development-branch
```

1. **brainstorming** - Explore requirements, understand constraints
2. **writing-plans** - Create implementation plan with tasks
3. **test-driven-development** - Implement with TDD (RED→GREEN→REFACTOR)
4. **code-reviewer** - Self-review the implementation
5. **finishing-a-development-branch** - Prepare for merge

---

### Bug Fix Chain
```
systematic-debugging → test-driven-development → requesting-code-review
```

1. **systematic-debugging** - Identify root cause
2. **test-driven-development** - Write failing test, implement fix
3. **requesting-code-review** - Submit for review

---

### Refactoring Chain
```
code-reviewer → writing-plans → test-driven-development → code-reviewer
```

1. **code-reviewer** - Assess current state, identify improvements
2. **writing-plans** - Plan refactoring steps
3. **test-driven-development** - Refactor with test coverage
4. **code-reviewer** - Verify improvements

---

### Design-to-Code Chain
```
figma-design-bridge → design-knowledge-search → interface-design → test-driven-development → accessibility-a11y → code-reviewer
```

1. **figma-design-bridge** - Extract design tokens and component specs from Figma
2. **design-knowledge-search** - Research relevant design system patterns and standards
3. **interface-design** - Apply Rams principles, fill gaps not specified in design
4. **test-driven-development** - Implement component with TDD
5. **accessibility-a11y** - Verify WCAG compliance
6. **code-reviewer** - Review implementation accuracy vs. design

---

## Sub-Agent Execution Patterns

### Parallel Execution (dispatching-parallel-agents)
**Use when:** Multiple independent problems to solve

**Pattern:**
```
Main Agent:
├── Identify independent problems
├── Dispatch Agent 1 → Problem A
├── Dispatch Agent 2 → Problem B
├── Dispatch Agent 3 → Problem C
└── Integrate results
```

**Sub-agents use:** test-driven-development, systematic-debugging
**Constraints:** Each sub-agent gets focused scope, clear goal

---

### Sequential with Review Gates (subagent-driven-development)
**Use when:** Implementing plan tasks in order with quality checks

**Pattern:**
```
For each task:
├── Dispatch Implementer → test-driven-development
├── Dispatch Spec Reviewer → Check spec compliance
├── Dispatch Quality Reviewer → Check code quality
└── Mark complete, next task
```

**Review cycle:**
- Spec Reviewer finds issues → Implementer fixes → Re-review
- Quality Reviewer finds issues → Implementer fixes → Re-review

---

## Cross-Cutting Skills

These skills enhance all workflows:

| Skill | When Applied |
|-------|--------------|
| interface-design | Any UI work |
| accessibility-a11y | Any UI work |
| figma-design-bridge | Any UI work with Figma MCP active |
| design-knowledge-search | Any design decisions with Design Systems MCP active |
| senior-security | Any code touching auth, data, APIs |

---

## Workflow Decision Tree

```
Start
├── Is this a new feature?
│   └── YES → Feature Development Chain
│       └── Start with brainstorming
├── Is this a bug fix?
│   └── YES → Bug Fix Chain
│       └── Start with systematic-debugging
├── Is this a refactor?
│   └── YES → Refactoring Chain
│       └── Start with code-reviewer (assess)
├── Is this a design implementation?
│   └── YES → Design-to-Code Chain
│       ├── MCP active → Start with figma-design-bridge
│       └── No MCP → Start with interface-design
├── Is this a code review?
│   └── YES → Use Reviewer Agent
└── Is this research/exploration?
    └── YES → Use Architect Agent
```
