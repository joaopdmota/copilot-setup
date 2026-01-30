#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${AGENTS_REPO_URL:-https://github.com/joaopdmota/copilot-setup.git}"
BRANCH="${AGENTS_BRANCH:-main}"
DEST_DIR="${AGENTS_DEST_DIR:-.github}"
SRC_DIR=".github"

# Create a temporary directory that will be cleaned up
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

echo ">> Syncing ${SRC_DIR} from ${REPO_URL} (${BRANCH})"
echo ">> Cloning to temporary directory..."

git clone --depth=1 --branch="$BRANCH" --filter=blob:none --no-checkout "$REPO_URL" "$TEMP_DIR"
git -C "$TEMP_DIR" sparse-checkout init --cone
git -C "$TEMP_DIR" sparse-checkout set "$SRC_DIR"
git -C "$TEMP_DIR" checkout

if [ ! -d "${TEMP_DIR}/${SRC_DIR}" ]; then
  echo "!! ERROR: ${SRC_DIR} not found in repo."
  exit 2
fi

echo ">> Copying ${SRC_DIR} to ${DEST_DIR}"
mkdir -p "$DEST_DIR"
rsync -a --delete "${TEMP_DIR}/${SRC_DIR}/" "${DEST_DIR}/"

echo ">> Done ✅ (temporary files cleaned up)"