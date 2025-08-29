#!/bin/bash

# iB-theme Installation Script for VS Code and Cursor IDE
# Usage: ./install.sh [vscode|cursor]

set -e  # Exit on any error

# Function to print error messages
print_error() {
    echo "Error: $1" >&2
}

# Function to print success messages
print_success() {
    echo "✓ $1"
}

# Determine target editor
TARGET_EDITOR="${1:-auto}"

echo "Installing iB-theme..."

# Determine the OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          print_error "Unsupported operating system: ${OS}"; exit 1;;
esac

# Function to get extensions directory
get_extensions_dir() {
    local editor="$1"
    local base_dir
    
    if [ "$MACHINE" = "Mac" ]; then
        base_dir="$HOME"
    elif [ "$MACHINE" = "Linux" ]; then
        base_dir="$HOME"
    elif [ "$MACHINE" = "Cygwin" ] || [ "$MACHINE" = "MinGw" ]; then
        base_dir="$USERPROFILE"
    else
        return 1
    fi
    
    case "$editor" in
        "vscode")  echo "$base_dir/.vscode/extensions" ;;
        "cursor")  echo "$base_dir/.cursor/extensions" ;;
        *)         return 1 ;;
    esac
}

# Auto-detect or use specified editor
if [ "$TARGET_EDITOR" = "auto" ]; then
    # Try to detect available editors
    VSCODE_DIR=$(get_extensions_dir "vscode")
    CURSOR_DIR=$(get_extensions_dir "cursor")
    
    if [ -d "$CURSOR_DIR" ]; then
        TARGET_EDITOR="cursor"
        EXTENSIONS_DIR="$CURSOR_DIR"
    elif [ -d "$VSCODE_DIR" ]; then
        TARGET_EDITOR="vscode"
        EXTENSIONS_DIR="$VSCODE_DIR"
    else
        # Default to VS Code if neither exists
        TARGET_EDITOR="vscode"
        EXTENSIONS_DIR="$VSCODE_DIR"
    fi
else
    EXTENSIONS_DIR=$(get_extensions_dir "$TARGET_EDITOR")
    if [ $? -ne 0 ]; then
        print_error "Invalid editor specified: $TARGET_EDITOR (use 'vscode' or 'cursor')"
        exit 1
    fi
fi

echo "Target editor: $TARGET_EDITOR"
echo "Extensions directory: $EXTENSIONS_DIR"

# Create extensions directory if it doesn't exist
if ! mkdir -p "$EXTENSIONS_DIR"; then
    print_error "Failed to create extensions directory: $EXTENSIONS_DIR"
    exit 1
fi

# Copy theme files
THEME_DIR="$EXTENSIONS_DIR/ib-theme"
if ! mkdir -p "$THEME_DIR"; then
    print_error "Failed to create theme directory: $THEME_DIR"
    exit 1
fi

# Check if source files exist before copying
for file in package.json README.md LICENSE; do
    if [ ! -f "$file" ]; then
        print_error "Source file not found: $file"
        exit 1
    fi
done

if [ ! -d "themes" ]; then
    print_error "Themes directory not found"
    exit 1
fi

# Copy files with error checking
if ! cp package.json "$THEME_DIR/"; then
    print_error "Failed to copy package.json"
    exit 1
fi

if ! cp -r themes "$THEME_DIR/"; then
    print_error "Failed to copy themes directory"
    exit 1
fi

if ! cp README.md "$THEME_DIR/"; then
    print_error "Failed to copy README.md"
    exit 1
fi

if ! cp LICENSE "$THEME_DIR/"; then
    print_error "Failed to copy LICENSE"
    exit 1
fi

print_success "iB-theme has been installed successfully for $TARGET_EDITOR!"
echo ""
echo "To activate the theme:"
echo "1. Restart your editor ($TARGET_EDITOR)"
echo "2. Go to File > Preferences > Color Theme (or Cmd/Ctrl + K, Cmd/Ctrl + T)"
echo "3. Select 'iB-theme Dark' or 'iB-theme Light'"
echo ""
echo "Installation completed in: $THEME_DIR"