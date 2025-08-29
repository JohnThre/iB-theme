#!/bin/bash

# iB-theme Emacs Installation Script
# Copyright (C) 2024 iB-theme
# Licensed under GNU GPL v3

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to detect Emacs configuration directory
detect_emacs_dir() {
    if [ -d "$HOME/.emacs.d" ]; then
        echo "$HOME/.emacs.d"
    elif [ -d "$HOME/.config/emacs" ]; then
        echo "$HOME/.config/emacs"
    else
        echo "$HOME/.emacs.d"
    fi
}

# Main installation function
install_themes() {
    print_status "Installing iB-theme for GNU Emacs..."
    
    # Detect Emacs directory
    EMACS_DIR=$(detect_emacs_dir)
    THEMES_DIR="$EMACS_DIR/themes"
    
    print_status "Emacs configuration directory: $EMACS_DIR"
    
    # Create themes directory if it doesn't exist
    if [ ! -d "$THEMES_DIR" ]; then
        print_status "Creating themes directory: $THEMES_DIR"
        mkdir -p "$THEMES_DIR"
    fi
    
    # Copy theme files
    print_status "Copying theme files..."
    
    # Check if source files exist
    if [ ! -f "ib-theme-dark-theme.el" ]; then
        print_error "Source file not found: ib-theme-dark-theme.el"
        exit 1
    fi
    
    if [ ! -f "ib-theme-light-theme.el" ]; then
        print_error "Source file not found: ib-theme-light-theme.el"
        exit 1
    fi
    
    # Copy with error checking
    if ! cp "ib-theme-dark-theme.el" "$THEMES_DIR/"; then
        print_error "Failed to copy ib-theme-dark-theme.el"
        exit 1
    fi
    
    if ! cp "ib-theme-light-theme.el" "$THEMES_DIR/"; then
        print_error "Failed to copy ib-theme-light-theme.el"
        exit 1
    fi
    
    print_success "Theme files copied successfully!"
    
    # Check if themes directory is in custom-theme-load-path
    INIT_FILE="$EMACS_DIR/init.el"
    
    if [ -f "$INIT_FILE" ]; then
        if ! grep -q "custom-theme-load-path" "$INIT_FILE"; then
            print_status "Adding themes directory to custom-theme-load-path..."
            echo "" >> "$INIT_FILE"
            echo ";; iB-theme configuration" >> "$INIT_FILE"
            echo "(add-to-list 'custom-theme-load-path \"$THEMES_DIR\")" >> "$INIT_FILE"
            print_success "Configuration added to init.el"
        else
            print_warning "custom-theme-load-path already configured in init.el"
        fi
    else
        print_status "Creating init.el with theme configuration..."
        echo ";; GNU Emacs configuration" > "$INIT_FILE"
        echo "" >> "$INIT_FILE"
        echo ";; iB-theme configuration" >> "$INIT_FILE"
        echo "(add-to-list 'custom-theme-load-path \"$THEMES_DIR\")" >> "$INIT_FILE"
        echo "" >> "$INIT_FILE"
        echo ";; Load iB-theme (uncomment one of the following lines)" >> "$INIT_FILE"
        echo ";; (load-theme 'ib-theme-dark t)" >> "$INIT_FILE"
        echo ";; (load-theme 'ib-theme-light t)" >> "$INIT_FILE"
        print_success "Created init.el with theme configuration"
    fi
    
    print_success "iB-theme installation completed!"
    echo ""
    print_status "To activate the theme, add one of these lines to your Emacs configuration:"
    echo "  (load-theme 'ib-theme-dark t)   ; For dark theme"
    echo "  (load-theme 'ib-theme-light t)  ; For light theme"
    echo ""
    print_status "Or use M-x load-theme and select ib-theme-dark or ib-theme-light"
}

# Function to uninstall themes
uninstall_themes() {
    print_status "Uninstalling iB-theme for GNU Emacs..."
    
    EMACS_DIR=$(detect_emacs_dir)
    THEMES_DIR="$EMACS_DIR/themes"
    
    # Remove theme files
    if [ -f "$THEMES_DIR/ib-theme-dark-theme.el" ]; then
        rm "$THEMES_DIR/ib-theme-dark-theme.el"
        print_success "Removed ib-theme-dark-theme.el"
    fi
    
    if [ -f "$THEMES_DIR/ib-theme-light-theme.el" ]; then
        rm "$THEMES_DIR/ib-theme-light-theme.el"
        print_success "Removed ib-theme-light-theme.el"
    fi
    
    print_success "iB-theme uninstalled successfully!"
}

# Function to show usage
show_usage() {
    echo "iB-theme Emacs Installation Script"
    echo ""
    echo "Usage: $0 [OPTION]"
    echo ""
    echo "Options:"
    echo "  install     Install iB-theme for Emacs (default)"
    echo "  uninstall   Remove iB-theme from Emacs"
    echo "  help        Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0              # Install themes"
    echo "  $0 install      # Install themes"
    echo "  $0 uninstall    # Remove themes"
}

# Main script logic
case "${1:-install}" in
    "install")
        install_themes
        ;;
    "uninstall")
        uninstall_themes
        ;;
    "help"|"-h"|"--help")
        show_usage
        ;;
    *)
        print_error "Unknown option: $1"
        show_usage
        exit 1
        ;;
esac 