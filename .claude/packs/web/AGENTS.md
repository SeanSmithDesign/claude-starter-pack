# Web Pack - Agent Orchestration

Extends Core Pack with Web-specific capabilities.

**Inherits from:** `core/AGENTS.md`

## Web Agent Personas

### Web Developer Agent
**Inherits:** Developer Agent (from Core)
**Additional Skills:** senior-frontend, senior-fullstack
**Patterns:** React, Next.js, TypeScript, Tailwind
**Triggers:** "React", "Next.js", "web", "frontend", "TypeScript"

**Enhanced Workflow:**
1. Write failing Jest/Vitest test (RED)
2. Implement with React/TypeScript (GREEN)
3. Check accessibility (ARIA, keyboard nav)
4. Verify responsive design
5. Refactor following patterns (REFACTOR)

**Web-Specific Checks:**
- TypeScript strict mode
- ESLint/Prettier compliance
- Bundle size impact
- Core Web Vitals

---

### Fullstack Agent
**Inherits:** Developer Agent
**Additional Skills:** senior-fullstack, senior-backend

**Workflow:**
1. Design API contract
2. Implement backend (TDD)
3. Implement frontend (TDD)
4. Integration testing
5. Performance verification

---

### Web UI Agent
**Inherits:** Developer Agent
**Additional Skills:** senior-frontend, frontend-design, interface-design, accessibility-a11y

**Workflow:**
1. Apply Rams design principles
2. Design component API
3. Implement with React/Tailwind
4. Verify WCAG 2.1 AA compliance
5. Test responsive breakpoints

**Checklist:**
- [ ] Semantic HTML structure
- [ ] ARIA labels where needed
- [ ] Keyboard navigation works
- [ ] Focus states visible
- [ ] Color contrast ≥ 4.5:1
- [ ] Responsive at 320px-1440px

---

### E2E Testing Agent
**Skills:** playwright-e2e (when created)
**Triggers:** "e2e", "end-to-end", "user flow", "Playwright"

**Workflow:**
1. Identify critical user journeys
2. Write Playwright tests
3. Run visual regression
4. Integrate with CI

---

## Web Skill Chains

### Web Feature Development
```
brainstorming → writing-plans → senior-frontend + test-driven-development → interface-design audit → accessibility-a11y check → code-reviewer → finishing-a-development-branch
```

### Component Development
```
interface-design (design) → senior-frontend (implement) → accessibility-a11y (verify) → code-reviewer
```

### API Development
```
senior-architect (design) → senior-backend (implement TDD) → senior-frontend (consume) → code-reviewer
```

---

## Platform-Specific Patterns

### React Component Pattern
```typescript
interface Props {
  title: string;
  onAction: () => void;
}

export function Component({ title, onAction }: Props) {
  return (
    <button
      onClick={onAction}
      aria-label={title}
      className="..."
    >
      {title}
    </button>
  );
}
```

### Next.js Page Pattern
```typescript
export default async function Page({ params }: { params: { id: string } }) {
  const data = await fetchData(params.id);

  return (
    <main>
      <h1>{data.title}</h1>
      {/* ... */}
    </main>
  );
}
```

### Testing Pattern
```typescript
import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';

describe('Component', () => {
  it('handles click', async () => {
    const onClick = vi.fn();
    render(<Component title="Test" onAction={onClick} />);

    await userEvent.click(screen.getByRole('button'));

    expect(onClick).toHaveBeenCalled();
  });
});
```

---

## Sub-Agent Web Extensions

When using `dispatching-parallel-agents` or `subagent-driven-development`:

**Web sub-agents additionally use:**
- senior-frontend
- senior-fullstack (for fullstack tasks)
- accessibility-a11y (for UI tasks)

**Web-specific sub-agent prompts should include:**
- Framework version (React 18, Next.js 14)
- Styling approach (Tailwind, CSS modules)
- State management (if any)
- API patterns (REST, GraphQL)

---

## Web Quick Reference

### Common Commands
```bash
# Development
npm run dev

# Build
npm run build

# Test
npm test

# Lint
npm run lint

# Type check
npm run typecheck
```

### Common Imports
```typescript
import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
```

### Responsive Breakpoints
```css
@media (min-width: 320px)  { /* Mobile */ }
@media (min-width: 768px)  { /* Tablet */ }
@media (min-width: 1024px) { /* Desktop */ }
@media (min-width: 1440px) { /* Large */ }
```
