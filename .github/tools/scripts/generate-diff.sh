#!/usr/bin/env bash
set -euo pipefail

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Detect conversation ID from artifacts directory (Nexus brain)
BRAIN_DIR="${ANTIGRAVITY_BRAIN_DIR:-.github/brain}"
CONVERSATION_ID=$(ls -t "$BRAIN_DIR" 2>/dev/null | head -1)

if [ -z "$CONVERSATION_ID" ]; then
  echo -e "${YELLOW}⚠️  No conversation directory found in $BRAIN_DIR${NC}"
  echo "Creating a temporary directory for this review..."
  CONVERSATION_ID="temp-$(date +%s)"
fi

OUTPUT_DIR="$BRAIN_DIR/$CONVERSATION_ID"
mkdir -p "$OUTPUT_DIR"
OUTPUT_FILE="$OUTPUT_DIR/changes.diff"

echo -e "${BLUE}>> Generating diff for code review...${NC}"

# Detect default branch (main or master)
DEFAULT_BRANCH=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@' || echo "main")

# Check if we're on the default branch
CURRENT_BRANCH=$(git branch --show-current)

if [ "$CURRENT_BRANCH" = "$DEFAULT_BRANCH" ]; then
  echo -e "${YELLOW}⚠️  You're on the default branch ($DEFAULT_BRANCH)${NC}"
  echo "Generating diff of uncommitted changes only..."
  git diff HEAD -- . ':!.github' > "$OUTPUT_FILE"
else
  echo -e "${GREEN}✓ Comparing $CURRENT_BRANCH with $DEFAULT_BRANCH${NC}"
  # Get diff between current branch and default branch, excluding .github/
  git diff "$DEFAULT_BRANCH"...HEAD -- . ':!.github' > "$OUTPUT_FILE"
fi

# Check if diff is empty
if [ ! -s "$OUTPUT_FILE" ]; then
  echo -e "${YELLOW}⚠️  No changes detected (excluding .github/)${NC}"
  echo "Nothing to review!"
  exit 0
fi

# Show summary
echo -e "${GREEN}✓ Diff generated successfully!${NC}"
echo -e "${BLUE}Output: $OUTPUT_FILE${NC}"
echo ""
echo -e "${BLUE}Changed files:${NC}"
git diff --name-only "$DEFAULT_BRANCH"...HEAD -- . ':!.github' 2>/dev/null || git diff --name-only HEAD -- . ':!.github'
echo ""
echo -e "${GREEN}>> Ready for review! 🔍${NC}"
