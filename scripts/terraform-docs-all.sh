#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel)"

for module in "$ROOT_DIR"/modules/*; do
  if [ -d "$module" ]; then
    if [ -f "$module/README.md" ]; then
      echo "Updating terraform-docs for module: $(basename "$module")"
      terraform-docs "$ROOT_DIR" "$module"
    else
      echo "Skipping $(basename "$module") — no README.md found"
    fi
  fi
done
