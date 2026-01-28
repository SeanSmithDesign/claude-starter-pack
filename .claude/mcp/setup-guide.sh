#!/bin/bash
# MCP Server Setup Guide
# This script PRINTS setup commands — it does not execute them.
# Copy and run the commands for the MCP servers you want.

echo ""
echo "=== MCP Server Setup Guide ==="
echo ""
echo "Choose which MCP servers to enable:"
echo ""
echo "  1) Figma Console MCP (design token extraction, component inspection)"
echo "  2) Design Systems MCP (search 188+ design system knowledge entries)"
echo "  3) Both"
echo "  4) Skip"
echo ""
read -p "Choice [1-4]: " choice

echo ""
case $choice in
    1)
        echo "Run this command to enable Figma Console MCP:"
        echo ""
        echo "  claude mcp add --transport sse figma-console https://figma-console-mcp.southleft.com/sse"
        echo ""
        ;;
    2)
        echo "Run this command to enable Design Systems MCP:"
        echo ""
        echo "  claude mcp add --transport http design-systems https://design-systems-mcp.southleft.com/mcp"
        echo ""
        ;;
    3)
        echo "Run these commands to enable both MCP servers:"
        echo ""
        echo "  claude mcp add --transport sse figma-console https://figma-console-mcp.southleft.com/sse"
        echo "  claude mcp add --transport http design-systems https://design-systems-mcp.southleft.com/mcp"
        echo ""
        ;;
    *)
        echo "Skipping MCP setup."
        echo ""
        ;;
esac

echo "To verify active MCP servers:"
echo "  claude mcp list"
echo ""
echo "To remove an MCP server:"
echo "  claude mcp remove <server-name>"
echo ""
echo "For full details, see .claude/mcp/README.md"
echo ""
