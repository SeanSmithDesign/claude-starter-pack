#!/bin/bash
# Claude Starter Pack Installer
# Usage: ./install.sh /path/to/your/project

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-.}"

echo "🚀 Claude Starter Pack Installer"
echo "================================"
echo ""

# Validate target
if [ ! -d "$TARGET_DIR" ]; then
    echo "❌ Target directory does not exist: $TARGET_DIR"
    exit 1
fi

TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"
echo "📁 Installing to: $TARGET_DIR"
echo ""

# Check for existing .claude directory
if [ -d "$TARGET_DIR/.claude" ]; then
    echo "⚠️  .claude directory already exists in target."
    read -p "   Overwrite? (y/N): " confirm
    if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
        echo "❌ Installation cancelled."
        exit 1
    fi
fi

# Select platform
echo ""
echo "Select your platform(s):"
echo "  1) iOS/macOS"
echo "  2) Web (React, Next.js)"
echo "  3) Both"
echo "  4) Neither (core only)"
read -p "Choice [1-4]: " platform_choice

# Create base structure
echo ""
echo "📦 Creating directory structure..."
mkdir -p "$TARGET_DIR/.claude/skills"
mkdir -p "$TARGET_DIR/.claude/hooks"
mkdir -p "$TARGET_DIR/.claude/rules"
mkdir -p "$TARGET_DIR/.claude/packs"

# Copy core (always)
echo "📋 Copying core skills..."
cp -r "$SCRIPT_DIR/.claude/skills/core/"* "$TARGET_DIR/.claude/skills/" 2>/dev/null || true

# Copy design (always)
echo "🎨 Copying design skills..."
cp -r "$SCRIPT_DIR/.claude/skills/design/"* "$TARGET_DIR/.claude/skills/" 2>/dev/null || true

# Copy security (always)
echo "🔒 Copying security skills..."
cp -r "$SCRIPT_DIR/.claude/skills/security/"* "$TARGET_DIR/.claude/skills/" 2>/dev/null || true

# Copy platform-specific
case $platform_choice in
    1)
        echo "📱 Copying iOS skills..."
        cp -r "$SCRIPT_DIR/.claude/skills/platform/ios/"* "$TARGET_DIR/.claude/skills/" 2>/dev/null || true
        ;;
    2)
        echo "🌐 Copying web skills..."
        cp -r "$SCRIPT_DIR/.claude/skills/platform/web/"* "$TARGET_DIR/.claude/skills/" 2>/dev/null || true
        ;;
    3)
        echo "📱 Copying iOS skills..."
        cp -r "$SCRIPT_DIR/.claude/skills/platform/ios/"* "$TARGET_DIR/.claude/skills/" 2>/dev/null || true
        echo "🌐 Copying web skills..."
        cp -r "$SCRIPT_DIR/.claude/skills/platform/web/"* "$TARGET_DIR/.claude/skills/" 2>/dev/null || true
        ;;
    *)
        echo "⏭️  Skipping platform skills..."
        ;;
esac

# Copy hooks, rules, packs
echo "⚡ Copying hooks..."
cp -r "$SCRIPT_DIR/.claude/hooks/"* "$TARGET_DIR/.claude/hooks/" 2>/dev/null || true

echo "📜 Copying rules..."
cp -r "$SCRIPT_DIR/.claude/rules/"* "$TARGET_DIR/.claude/rules/" 2>/dev/null || true

echo "📦 Copying packs..."
cp -r "$SCRIPT_DIR/.claude/packs/"* "$TARGET_DIR/.claude/packs/" 2>/dev/null || true

# Copy MCP documentation
echo "📡 Copying MCP documentation..."
mkdir -p "$TARGET_DIR/.claude/mcp"
cp -r "$SCRIPT_DIR/.claude/mcp/"* "$TARGET_DIR/.claude/mcp/" 2>/dev/null || true

# Copy CLAUDE.md template if not exists
if [ ! -f "$TARGET_DIR/CLAUDE.md" ]; then
    echo "📝 Creating CLAUDE.md template..."
    cp "$SCRIPT_DIR/templates/CLAUDE.md.template" "$TARGET_DIR/CLAUDE.md"
    echo "   ⚠️  Edit CLAUDE.md with your project details!"
fi

# MCP Server Setup (optional)
echo ""
echo "🔌 MCP Servers (optional — extend Claude with external tools):"
echo "  1) None (skip)"
echo "  2) Figma Console (design token extraction, component inspection)"
echo "  3) Design Systems (search 188+ design system knowledge entries)"
echo "  4) Both"
read -p "Choice [1-4]: " mcp_choice

echo ""
case $mcp_choice in
    2)
        echo "📋 To enable Figma Console MCP, run:"
        echo "   claude mcp add --transport sse figma-console https://figma-console-mcp.southleft.com/sse"
        ;;
    3)
        echo "📋 To enable Design Systems MCP, run:"
        echo "   claude mcp add --transport http design-systems https://design-systems-mcp.southleft.com/mcp"
        ;;
    4)
        echo "📋 To enable MCP servers, run these commands:"
        echo "   claude mcp add --transport sse figma-console https://figma-console-mcp.southleft.com/sse"
        echo "   claude mcp add --transport http design-systems https://design-systems-mcp.southleft.com/mcp"
        ;;
    *)
        echo "⏭️  Skipping MCP setup..."
        ;;
esac

echo ""
echo "✅ Installation complete!"
echo ""
echo "Next steps:"
echo "  1. Edit $TARGET_DIR/CLAUDE.md with your project info"
echo "  2. Run 'claude' to start using Claude Code"
echo "  3. (Optional) Set up MCP servers — see .claude/mcp/README.md"
echo ""
echo "To add extended skills later:"
echo "  cp -r $SCRIPT_DIR/.claude/skills/extended/<skill-name> $TARGET_DIR/.claude/skills/"
