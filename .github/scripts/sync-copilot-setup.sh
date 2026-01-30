#!/usr/bin/env bash
set -euo pipefail

# Sync Copilot/Nexus setup (rules, skills, workflows, tools) from antigravity-setup
# This is a thin wrapper around the central sync script.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT_DIR"

bash -c "$(curl -fsSL https://raw.githubusercontent.com/joaopdmota/antigravity-setup/main/scripts/sync-agents.sh)"