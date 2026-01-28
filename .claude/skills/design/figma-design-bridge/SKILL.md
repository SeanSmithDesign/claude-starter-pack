---
name: figma-design-bridge
description: Design-to-code bridge using Figma MCP tools. Guides when and how to extract design tokens, inspect components, take screenshots, and sync designs. Use when working with Figma files, implementing designs, extracting tokens, or when user mentions Figma, design specs, or visual implementation.
license: MIT
metadata:
  version: 1.0.0
  category: design
  domain: figma-integration
  platforms: All
  requires_mcp: figma-console
keywords:
  - figma
  - design tokens
  - component inspection
  - design-to-code
  - visual implementation
  - design handoff
---

# Figma Design Bridge

Bridge between Figma designs and code implementation using the Figma Console MCP server.

## Prerequisites

This skill requires the Figma Console MCP server:

```bash
claude mcp add --transport sse figma-console https://figma-console-mcp.southleft.com/sse
```

If the MCP tools are not available, fall back to manual design token creation using the ui-design-system skill.

## When to Use Figma MCP Tools

### Starting a New UI Implementation

1. `figma_take_screenshot` — see the current design state
2. `figma_get_component` — inspect component structure
3. `figma_get_variables` — extract design tokens (colors, spacing, typography)
4. `figma_get_styles` — get typography, colors, effects

### Extracting Design Tokens

1. `figma_get_variables` — pull all design variables
2. Map to platform-appropriate format:
   - **Web:** CSS custom properties (`--color-primary: #...`)
   - **iOS/macOS:** Swift constants (`static let primaryColor = Color(...)`)
   - **Cross-platform:** JSON tokens
3. Cross-reference with ui-design-system skill for token naming conventions

### Component Inspection for Development

1. `figma_get_component_for_development` — get dev-ready specs (spacing, sizing, states)
2. `figma_get_component_image` — export visual reference
3. Apply interface-design principles when translating to code

### Verifying Implementation Matches Design

1. `figma_take_screenshot` — capture the design
2. Compare spacing, typography, color accuracy against implementation
3. Check component states (default, hover, active, disabled, error)

## Workflow Integration

### With interface-design Skill

Use Figma MCP to extract concrete values. Apply interface-design principles (Dieter Rams) for any gaps or decisions not specified in the design:

- Visual hierarchy and element ordering
- Typography scale relationships
- Spacing rhythm and consistency
- Motion and interaction patterns

### With accessibility-a11y Skill

After extracting design tokens, verify:

- Color contrast ratios meet WCAG 4.5:1 (text) and 3:1 (large text, UI)
- Touch target sizes are adequate (44pt minimum)
- Typography scales support Dynamic Type / responsive sizing
- Focus indicators are defined for interactive elements

### With ui-design-system Skill

Use Figma MCP variables as input to the design token generator for cross-platform token export:

1. Extract tokens from Figma (`figma_get_variables`)
2. Feed into `design_token_generator.py` for normalized output
3. Export to target format (JSON, CSS, SCSS)

## Fallback Behavior

If Figma MCP tools are not available:

- Inform the user that Figma integration requires MCP setup
- Offer to work from manual specifications instead
- Use ui-design-system skill for token generation without Figma
- Use interface-design principles to fill gaps in specifications
