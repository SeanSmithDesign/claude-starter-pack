# Figma Console MCP

Bridge between Claude Code and Figma for design token extraction, component inspection, screenshots, and design creation.

**GitHub:** https://github.com/southleft/figma-console-mcp

## Setup Modes

### Remote SSE (Recommended for Getting Started)

Zero setup, OAuth authentication. No local installation required.

```bash
claude mcp add --transport sse figma-console https://figma-console-mcp.southleft.com/sse
```

Limitations: No creation/modification tools (`figma_execute`, variable management, etc.)

### NPX (Local with Desktop Bridge Plugin)

Local execution with Figma Desktop Bridge plugin for advanced features.

```bash
# Install and run via npx
npx figma-console-mcp

# Requires Figma Desktop Bridge plugin installed
```

### Local Git (Full Features)

All tools available including `figma_execute` for arbitrary plugin code execution.

```bash
# Clone and set up
git clone https://github.com/southleft/figma-console-mcp.git
cd figma-console-mcp
npm install

# Requires Figma Personal Access Token
# Requires Figma Desktop with remote debugging:
#   open -a "Figma" --args --remote-debugging-port=9222
```

## Available Tools

### Navigation & Status

| Tool | Description | Availability |
|------|-------------|-------------|
| `figma_navigate` | Navigate to a specific page or frame | All modes |
| `figma_get_status` | Get current Figma plugin status | All modes |

### Visual

| Tool | Description | Availability |
|------|-------------|-------------|
| `figma_take_screenshot` | Capture current Figma canvas | All modes |

### Design Tokens & Variables

| Tool | Description | Availability |
|------|-------------|-------------|
| `figma_get_variables` | Extract design variables/tokens | All modes |
| `figma_create_variable_collection` | Create a variable collection | Local only |
| `figma_create_variable` | Create a design variable | Local only |
| `figma_update_variable` | Update an existing variable | Local only |
| `figma_rename_variable` | Rename a variable | Local only |
| `figma_delete_variable` | Delete a variable | Local only |
| `figma_delete_variable_collection` | Delete a variable collection | Local only |
| `figma_add_mode` | Add a variable mode | Local only |
| `figma_rename_mode` | Rename a variable mode | Local only |

### Components & Styles

| Tool | Description | Availability |
|------|-------------|-------------|
| `figma_get_component` | Get component details | All modes |
| `figma_get_component_for_development` | Get dev-ready component spec | All modes |
| `figma_get_component_image` | Export component as image | All modes |
| `figma_get_styles` | Get all styles in file | All modes |

### File & Console

| Tool | Description | Availability |
|------|-------------|-------------|
| `figma_get_file_data` | Get file structure data | All modes |
| `figma_get_file_for_plugin` | Get file data for plugin use | All modes |
| `figma_get_console_logs` | Read console output | All modes |
| `figma_watch_console` | Watch console for changes | All modes |
| `figma_clear_console` | Clear console logs | All modes |
| `figma_reload_plugin` | Reload the Figma plugin | All modes |

### Creation & Modification

| Tool | Description | Availability |
|------|-------------|-------------|
| `figma_execute` | Execute arbitrary Figma plugin code | Local only |
| `figma_arrange_component_set` | Arrange component variants in grid | Local only |
| `figma_set_description` | Set element description | Local only |

## Common Workflows

### Extract Design Tokens

1. `figma_get_variables` to pull all design variables
2. `figma_get_styles` to get typography, colors, effects
3. Map to platform-appropriate format (CSS custom properties, Swift constants, JSON)

### Inspect Component for Development

1. `figma_get_component_for_development` for dev-ready specs
2. `figma_get_component_image` for visual reference
3. Translate specs to code using interface-design principles

### Visual Debugging

1. `figma_take_screenshot` to capture the current design state
2. Compare with implementation
3. Use `figma_get_console_logs` for plugin debugging

### Create Design System (Local Mode)

1. `figma_create_variable_collection` to set up token groups
2. `figma_create_variable` for each token (colors, spacing, typography)
3. `figma_add_mode` for light/dark themes
4. `figma_arrange_component_set` to organize component variants
