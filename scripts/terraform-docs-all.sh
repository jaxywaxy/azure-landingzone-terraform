#!/usr/bin/env bash
set -euo pipefail

# Assume this script is run from the repo root (which pre-commit does)
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
