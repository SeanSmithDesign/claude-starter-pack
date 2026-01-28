---
name: design-knowledge-search
description: Search curated design systems knowledge using the Design Systems MCP. Access best practices from W3C, WCAG 2.2, Material Design, Carbon, Polaris, Fluent, and 180+ more sources. Use when researching design patterns, checking standards compliance, or exploring design system approaches.
license: MIT
metadata:
  version: 1.0.0
  category: design
  domain: design-research
  platforms: All
  requires_mcp: design-systems
keywords:
  - design systems
  - best practices
  - WCAG
  - Material Design
  - Carbon
  - design patterns
  - standards
  - accessibility standards
---

# Design Knowledge Search

Access 188+ curated design systems knowledge entries via the Design Systems MCP server.

## Prerequisites

This skill requires the Design Systems MCP server:

```bash
claude mcp add --transport http design-systems https://design-systems-mcp.southleft.com/mcp
```

If the MCP tools are not available, fall back to the embedded knowledge in interface-design and accessibility-a11y skills.

## When to Use Design Systems MCP Tools

### Researching Best Practices

Use `search_design_knowledge` when:

- Designing a new component and want industry patterns
- Checking if an approach follows established guidelines
- Comparing how different design systems handle a pattern
- Needing WCAG 2.2 specific guidance

### Exploring Available Knowledge

Use `browse_by_category` when:

- Starting a new design system from scratch
- Looking for inspiration across multiple systems
- Building a comprehensive component library
- Evaluating different approaches to a design problem

### Deep-Diving into Topics

Use `search_chunks` when:

- Needing detailed implementation guidance for a specific pattern
- Wanting granular information from a particular source
- Researching edge cases in standards compliance
- Understanding rationale behind a design decision

### Finding Content by Topic

Use `get_all_tags` when:

- Wanting to see what topics are covered
- Looking for related content areas
- Building a reading list for a design domain

## Query Strategies

### Effective Searches

| Query | What It Finds |
|-------|--------------|
| `"button states disabled loading"` | Component state patterns |
| `"color contrast WCAG 2.2 requirements"` | Accessibility standards |
| `"responsive grid 12 column"` | Layout specifications |
| `"form validation error messaging"` | Interaction patterns |
| `"design token naming convention"` | Token architecture |
| `"dark mode color palette strategy"` | Theme implementation |
| `"navigation sidebar responsive collapse"` | Navigation patterns |
| `"spacing scale 4px 8px base unit"` | Spacing systems |

### Combining with Other Skills

1. **Research:** `search_design_knowledge` for industry patterns and standards
2. **Design:** Apply interface-design principles for visual hierarchy and layout
3. **Compliance:** Verify with accessibility-a11y for WCAG adherence
4. **Implementation:** Generate tokens with ui-design-system for code export
5. **Validation:** Use ux-researcher-designer for user-centered evaluation

## Fallback Behavior

If Design Systems MCP tools are not available:

- Use embedded accessibility-a11y skill for WCAG guidance
- Use interface-design skill for design principles (Dieter Rams)
- Use ui-design-system skill for token generation patterns
- Inform user that broader design system search requires MCP setup
