#!/bin/bash

# iB-theme Installation Script for Cursor IDE
# Usage: ./install.sh

echo "Installing iB-theme for Cursor IDE..."

# Determine the OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${OS}"
esac

# Set the extensions directory based on OS
if [ "$MACHINE" = "Mac" ]; then
    EXTENSIONS_DIR="$HOME/.vscode/extensions"
elif [ "$MACHINE" = "Linux" ]; then
    EXTENSIONS_DIR="$HOME/.vscode/extensions"
elif [ "$MACHINE" = "Cygwin" ] || [ "$MACHINE" = "MinGw" ]; then
    EXTENSIONS_DIR="$USERPROFILE/.vscode/extensions"
else
    echo "Unsupported operating system: $MACHINE"
    exit 1
fi

# Create extensions directory if it doesn't exist
mkdir -p "$EXTENSIONS_DIR"

# Copy theme files
THEME_DIR="$EXTENSIONS_DIR/ib-theme"
mkdir -p "$THEME_DIR"

cp package.json "$THEME_DIR/"
cp -r themes "$THEME_DIR/"
cp README.md "$THEME_DIR/"
cp LICENSE "$THEME_DIR/"

echo "iB-theme has been installed successfully!"
echo "Please restart Cursor IDE and select the theme from:"
echo "File > Preferences > Color Theme > iB-theme Dark/Light" 