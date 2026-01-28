#!/bin/bash
# Update an existing project with latest starter pack skills
# Usage: ./update-project.sh /path/to/project

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-.}"

if [ ! -d "$TARGET_DIR/.claude" ]; then
    echo "❌ No .claude directory found in $TARGET_DIR"
    echo "   Use install.sh for new projects instead."
    exit 1
fi

TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"
echo "🔄 Updating Claude configuration in: $TARGET_DIR"
echo ""

# What to update
echo "What would you like to update?"
echo "  1) Skills only (safe - won't touch hooks/rules)"
echo "  2) Hooks and rules only"
echo "  3) Everything (skills, hooks, rules, packs, MCP docs)"
echo "  4) Specific skill layer (core/platform/design/security)"
echo "  5) MCP documentation only"
read -p "Choice [1-5]: " update_choice

case $update_choice in
    1)
        echo "📋 Updating all skills..."
        rsync -av --delete "$SCRIPT_DIR/.claude/skills/" "$TARGET_DIR/.claude/skills/"
        ;;
    2)
        echo "⚡ Updating hooks..."
        rsync -av "$SCRIPT_DIR/.claude/hooks/" "$TARGET_DIR/.claude/hooks/"
        echo "📜 Updating rules..."
        rsync -av "$SCRIPT_DIR/.claude/rules/" "$TARGET_DIR/.claude/rules/"
        ;;
    3)
        echo "📦 Updating everything..."
        rsync -av "$SCRIPT_DIR/.claude/skills/" "$TARGET_DIR/.claude/skills/"
        rsync -av "$SCRIPT_DIR/.claude/hooks/" "$TARGET_DIR/.claude/hooks/"
        rsync -av "$SCRIPT_DIR/.claude/rules/" "$TARGET_DIR/.claude/rules/"
        rsync -av "$SCRIPT_DIR/.claude/packs/" "$TARGET_DIR/.claude/packs/"
        mkdir -p "$TARGET_DIR/.claude/mcp"
        rsync -av "$SCRIPT_DIR/.claude/mcp/" "$TARGET_DIR/.claude/mcp/"
        ;;
    4)
        echo "Which layer?"
        echo "  a) core"
        echo "  b) platform/ios"
        echo "  c) platform/web"
        echo "  d) design"
        echo "  e) security"
        echo "  f) extended"
        read -p "Choice [a-f]: " layer_choice

        case $layer_choice in
            a) LAYER="core" ;;
            b) LAYER="platform/ios" ;;
            c) LAYER="platform/web" ;;
            d) LAYER="design" ;;
            e) LAYER="security" ;;
            f) LAYER="extended" ;;
            *) echo "Invalid choice"; exit 1 ;;
        esac

        echo "📋 Updating $LAYER skills..."
        rsync -av "$SCRIPT_DIR/.claude/skills/$LAYER/" "$TARGET_DIR/.claude/skills/"
        ;;
    5)
        echo "📡 Updating MCP documentation..."
        mkdir -p "$TARGET_DIR/.claude/mcp"
        rsync -av "$SCRIPT_DIR/.claude/mcp/" "$TARGET_DIR/.claude/mcp/"
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

echo ""
echo "✅ Update complete!"
echo ""
echo "Note: CLAUDE.md was NOT modified (it contains project-specific content)"
