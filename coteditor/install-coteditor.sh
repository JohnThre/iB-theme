#!/bin/bash

# iB-theme CotEditor Installation Script
# Copies theme files to CotEditor's application support directory (macOS)
# License: GPL v3+

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SUPPORT_DIR="$HOME/Library/Application Support/CotEditor"
THEMES_DIR="$SUPPORT_DIR/Themes"

case "$(uname -s)" in
    Darwin*)
        ;;
    *)
        echo "This script is for macOS. CotEditor is a macOS application."
        echo "On macOS, run: $0"
        exit 1
        ;;
esac

echo "Installing iB-theme for CotEditor..."
mkdir -p "$THEMES_DIR"

for f in ib-theme-dark.cottheme ib-theme-light.cottheme; do
    if [[ -f "$SCRIPT_DIR/$f" ]]; then
        cp "$SCRIPT_DIR/$f" "$THEMES_DIR/"
        echo "  Installed: $f"
    else
        echo "  Warning: $f not found, skipping"
    fi
done

echo ""
echo "Done. Themes were copied to: $THEMES_DIR"
echo "Open CotEditor > Settings > Appearance and select iB-theme Dark or iB-theme Light."
echo ""
