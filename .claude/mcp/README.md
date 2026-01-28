# MCP Servers

Model Context Protocol (MCP) servers extend Claude Code with external tool capabilities. Unlike skills (which provide embedded knowledge), MCP servers give Claude access to live external systems.

## Available MCP Servers

### Figma Console MCP

Bridge between Claude Code and Figma for design token extraction, component inspection, screenshots, and design creation.

**Setup:**
```bash
claude mcp add --transport sse figma-console https://figma-console-mcp.southleft.com/sse
```

- **Modes:** Remote SSE (zero-setup), NPX (local), Local Git (full features)
- **Enhances:** figma-design-bridge, interface-design, ui-design-system
- **Details:** See [figma-console.md](figma-console.md)
- **GitHub:** https://github.com/southleft/figma-console-mcp

### Design Systems MCP

AI-powered semantic search across 188+ curated design systems knowledge entries from W3C, WCAG 2.2, Material Design, Carbon, Polaris, Fluent, and more.

**Setup:**
```bash
claude mcp add --transport http design-systems https://design-systems-mcp.southleft.com/mcp
```

- **Enhances:** design-knowledge-search, accessibility-a11y, interface-design
- **Details:** See [design-systems.md](design-systems.md)
- **GitHub:** https://github.com/southleft/design-systems-mcp

## Quick Setup

```bash
# Both servers
claude mcp add --transport sse figma-console https://figma-console-mcp.southleft.com/sse
claude mcp add --transport http design-systems https://design-systems-mcp.southleft.com/mcp

# Verify
claude mcp list

# Remove if needed
claude mcp remove figma-console
claude mcp remove design-systems
```

Or run `bash .claude/mcp/setup-guide.sh` for an interactive guide.

## How MCP Servers Interact with Skills

Skills and MCP servers serve different roles:

| Layer | Role | Example |
|-------|------|---------|
| **Skill** | Teaches Claude *when and how* to act | "When implementing a design, first extract tokens from Figma" |
| **MCP Server** | Provides the *tools* to act | `figma_get_variables` returns actual design tokens |

The companion skills (`figma-design-bridge`, `design-knowledge-search`) guide Claude's behavior when MCP tools are available. If MCP servers are not configured, these skills gracefully fall back to embedded knowledge from `interface-design` and `ui-design-system`.

## Future / Community MCP Servers

### Company Docs MCP

Org-specific documentation knowledge base with semantic search. Transforms internal policies, values, and governance docs into an AI-queryable system.

- **GitHub:** https://github.com/southleft/company-docs-mcp
- **Requirements:** Per-company Supabase + OpenAI setup
- **Status:** Available but requires team-specific configuration and document ingestion
- **Best for:** Teams wanting Claude to reference internal documentation

### A2UI Bridge

React framework implementing Google's A2UI Protocol for AI-generated user interfaces. AI produces declarative JSON that renders with your existing component library (Mantine or ShadCN).

- **GitHub:** https://github.com/southleft/a2ui-bridge
- **Note:** Not an MCP server. A React library for projects that want AI-generated UIs.
- **Best for:** Web projects exploring AI-driven interface generation
