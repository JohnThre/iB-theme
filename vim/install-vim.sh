#!/bin/bash

# iB-theme VIM Installation Script
# Maintainer: iB-theme <themanpfc@outlook.com>
# Version: 1.0.0
# License: GPL v3+

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}🎨 iB-theme VIM Installation Script${NC}"
echo -e "${BLUE}====================================${NC}"
echo ""

# Check if VIM is installed
if ! command -v vim &> /dev/null; then
    echo -e "${RED}❌ VIM is not installed. Please install VIM first.${NC}"
    exit 1
fi

echo -e "${GREEN}✅ VIM found: $(vim --version | head -n1)${NC}"

# Determine VIM directory
VIM_DIR="$HOME/.vim"
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    VIM_DIR="$HOME/vimfiles"
fi

# Create colors directory
COLORS_DIR="$VIM_DIR/colors"
echo -e "${YELLOW}📁 Creating colors directory: $COLORS_DIR${NC}"
mkdir -p "$COLORS_DIR"

# Copy theme files
echo -e "${YELLOW}📋 Installing theme files...${NC}"

if [[ -f "$SCRIPT_DIR/colors/ib-theme-dark.vim" ]]; then
    cp "$SCRIPT_DIR/colors/ib-theme-dark.vim" "$COLORS_DIR/"
    echo -e "${GREEN}✅ Installed ib-theme-dark.vim${NC}"
else
    echo -e "${RED}❌ ib-theme-dark.vim not found${NC}"
    exit 1
fi

if [[ -f "$SCRIPT_DIR/colors/ib-theme-light.vim" ]]; then
    cp "$SCRIPT_DIR/colors/ib-theme-light.vim" "$COLORS_DIR/"
    echo -e "${GREEN}✅ Installed ib-theme-light.vim${NC}"
else
    echo -e "${RED}❌ ib-theme-light.vim not found${NC}"
    exit 1
fi

# Check for existing .vimrc
VIMRC="$HOME/.vimrc"
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    VIMRC="$HOME/_vimrc"
fi

echo ""
echo -e "${BLUE}🔧 Configuration Options${NC}"
echo -e "${BLUE}========================${NC}"

# Ask user for theme preference
echo ""
echo "Which theme would you like to set as default?"
echo "1) Dark theme (ib-theme-dark)"
echo "2) Light theme (ib-theme-light)"
echo "3) Skip automatic configuration"
echo ""
read -p "Enter your choice (1-3): " theme_choice

case $theme_choice in
    1)
        THEME="ib-theme-dark"
        ;;
    2)
        THEME="ib-theme-light"
        ;;
    3)
        echo -e "${YELLOW}⏭️  Skipping automatic configuration${NC}"
        THEME=""
        ;;
    *)
        echo -e "${YELLOW}⚠️  Invalid choice. Skipping automatic configuration${NC}"
        THEME=""
        ;;
esac

# Configure .vimrc if theme was selected
if [[ -n "$THEME" ]]; then
    echo ""
    echo -e "${YELLOW}📝 Configuring .vimrc...${NC}"
    
    # Create backup if .vimrc exists
    if [[ -f "$VIMRC" ]]; then
        cp "$VIMRC" "$VIMRC.backup.$(date +%Y%m%d_%H%M%S)"
        echo -e "${GREEN}✅ Created backup: $VIMRC.backup.$(date +%Y%m%d_%H%M%S)${NC}"
    fi
    
    # Add configuration to .vimrc
    cat >> "$VIMRC" << EOF

" iB-theme Configuration
" Added by iB-theme installer on $(date)
colorscheme $THEME

" Enhanced terminal support
set t_Co=256
if has('termguicolors')
  set termguicolors
endif

" Theme switching function
function! ToggleIBTheme()
  if g:colors_name == 'ib-theme-dark'
    colorscheme ib-theme-light
    echo "Switched to iB-theme Light"
  else
    colorscheme ib-theme-dark
    echo "Switched to iB-theme Dark"
  endif
endfunction

" Map F5 to toggle themes
nnoremap <F5> :call ToggleIBTheme()<CR>

" Status line enhancement
set laststatus=2
set statusline=%f\ %m%r%h%w\ [%Y]\ [%{&ff}]\ %=%l,%c\ %p%%
EOF
    
    echo -e "${GREEN}✅ Added iB-theme configuration to $VIMRC${NC}"
fi

# Installation complete
echo ""
echo -e "${GREEN}🎉 Installation Complete!${NC}"
echo -e "${GREEN}========================${NC}"
echo ""
echo -e "${BLUE}📋 What was installed:${NC}"
echo "• ib-theme-dark.vim → $COLORS_DIR/"
echo "• ib-theme-light.vim → $COLORS_DIR/"
if [[ -n "$THEME" ]]; then
    echo "• Configuration added to $VIMRC"
fi
echo ""

echo -e "${BLUE}🚀 Getting Started:${NC}"
if [[ -n "$THEME" ]]; then
    echo "1. Restart VIM to see the new theme"
    echo "2. Press F5 to toggle between dark and light themes"
else
    echo "1. Add this line to your $VIMRC:"
    echo "   colorscheme ib-theme-dark"
    echo "   (or ib-theme-light for the light theme)"
    echo "2. Restart VIM to see the new theme"
fi
echo ""

echo -e "${BLUE}💡 Tips:${NC}"
echo "• Use :colorscheme ib-theme-dark or :colorscheme ib-theme-light to switch themes"
echo "• For best results, use a terminal with 256-color or true color support"
echo "• Check the README.md for advanced configuration options"
echo ""

echo -e "${BLUE}🔗 More Information:${NC}"
echo "• VIM README: $SCRIPT_DIR/README.md"
echo "• Project URL: https://github.com/themanpfc/iB-theme"
echo ""

echo -e "${GREEN}Thank you for using iB-theme! 🎨${NC}" 