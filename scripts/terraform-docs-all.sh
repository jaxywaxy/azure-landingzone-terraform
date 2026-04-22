#!/usr/bin/env bash
set -euo pipefail

# Always run from repo root
cd "$(git rev-parse --show-toplevel)"

for module in modules/*; do
  if [ -d "$module" ]; then
    if [ -f "$module/README.md" ]; then
      echo "Updating terraform-docs for module: $(basename "$module")"
      terraform-docs "$module"
    else
      echo "Skipping $(basename "$module") — no README.md found"
    fi
  fi
done
