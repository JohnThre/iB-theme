#!/bin/bash

# iB-theme Terminal.app Installation Script
# Imports theme profiles into macOS Terminal.app
# License: GPL v3+

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "$(uname -s)" in
    Darwin*)
        ;;
    *)
        echo "This script is for macOS. Terminal.app is a macOS application."
        echo "On macOS, run: $0"
        exit 1
        ;;
esac

echo "Installing iB-theme for Terminal.app..."

for f in ib-theme-dark.terminal ib-theme-light.terminal; do
    if [[ -f "$SCRIPT_DIR/$f" ]]; then
        open "$SCRIPT_DIR/$f"
        echo "  Imported: $f"
    else
        echo "  Warning: $f not found, skipping"
    fi
done

echo ""
echo "Done. Profiles were imported into Terminal.app."
echo "Open Terminal > Settings > Profiles and select iB-theme Dark or iB-theme Light."
echo ""
