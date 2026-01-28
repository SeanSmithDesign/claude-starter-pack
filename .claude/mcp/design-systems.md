# Design Systems MCP

AI-powered semantic search across 188+ curated design systems knowledge entries.

**GitHub:** https://github.com/southleft/design-systems-mcp

## Setup

```bash
claude mcp add --transport http design-systems https://design-systems-mcp.southleft.com/mcp
```

No local installation required. Connects to a hosted Supabase pgvector database with sub-100ms query performance.

## Available Tools

| Tool | Description | Use When |
|------|-------------|----------|
| `search_design_knowledge` | Semantic search with optional category/tag filtering | Looking for best practices, patterns, or guidelines |
| `search_chunks` | Detailed content-level search within knowledge entries | Deep-diving into a specific topic |
| `browse_by_category` | Browse entries by category (components, tokens, patterns, guidelines, tools) | Exploring available knowledge for a domain |
| `get_all_tags` | List all available tags for filtering | Finding content by topic area |

## Knowledge Sources

The curated knowledge base covers:

- **Standards:** W3C specifications, DTCG (Design Token Community Group)
- **Accessibility:** WCAG 2.2 guidelines
- **Design Systems:**
  - Material Design (Google)
  - Fluent (Microsoft)
  - Carbon (IBM)
  - Polaris (Shopify)
  - Lightning (Salesforce)
  - Spectrum (Adobe)
  - Atlassian Design System
  - And more (188+ total entries)
- **Tools:** Figma guides, Style Dictionary documentation

## Query Strategies

### Effective Searches

```
"button states disabled loading"         -> Component + states
"color contrast WCAG 2.2 requirements"   -> Standard + topic
"responsive grid 12 column"              -> Pattern + specification
"form validation error messaging"        -> Interaction + pattern
"design token naming convention"         -> Token + practice
"dark mode color palette strategy"       -> Theme + approach
```

### Category Browsing

Categories available via `browse_by_category`:
- **components** — UI component patterns and specifications
- **tokens** — Design token standards and naming
- **patterns** — Interaction and layout patterns
- **guidelines** — Design principles and best practices
- **tools** — Design tooling documentation

### Combining with Other Skills

1. **Research phase:** `search_design_knowledge` for industry patterns
2. **Design phase:** Apply interface-design principles for visual hierarchy
3. **Compliance phase:** Verify with accessibility-a11y for WCAG adherence
4. **Implementation phase:** Generate tokens with ui-design-system for code export
