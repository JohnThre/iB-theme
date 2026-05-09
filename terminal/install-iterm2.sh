#!/bin/bash

# iB-theme iTerm2 Installation Script
# Imports color presets into iTerm2 on macOS
# License: GPL v3+

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "$(uname -s)" in
    Darwin*)
        ;;
    *)
        echo "This script is for macOS. iTerm2 is a macOS application."
        echo "On macOS, run: $0"
        exit 1
        ;;
esac

echo "Installing iB-theme for iTerm2..."

for f in ib-theme-dark.itermcolors ib-theme-light.itermcolors; do
    if [[ -f "$SCRIPT_DIR/$f" ]]; then
        open "$SCRIPT_DIR/$f"
        echo "  Imported: $f"
    else
        echo "  Warning: $f not found, skipping"
    fi
done

echo ""
echo "Done. Color presets were imported into iTerm2."
echo "Open iTerm2 > Settings > Profiles > Colors > Color Presets and select iB-theme Dark or iB-theme Light."
echo ""
