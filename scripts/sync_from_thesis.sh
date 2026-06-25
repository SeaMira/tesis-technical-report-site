#!/usr/bin/env bash
# Copy technical_report.md and img/ from the LaTeX thesis repo (sibling directory).
set -euo pipefail

SITE_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
THESIS_ROOT="$(cd "$SITE_ROOT/../tesis-magister-latex" && pwd)"

cp "$THESIS_ROOT/technical_report.md" "$SITE_ROOT/technical_report.md"
rm -rf "$SITE_ROOT/img"
cp -r "$THESIS_ROOT/img" "$SITE_ROOT/img"

echo "Synced from $THESIS_ROOT"
echo "  technical_report.md"
echo "  img/ ($(find "$SITE_ROOT/img" -type f | wc -l) files)"
