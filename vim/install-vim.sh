#!/bin/bash

# iB-theme VIM Installation Script
# Maintainer: Pengfan Chang <jnc@freew.org>
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

# Check if at least one of VIM or Neovim is installed
HAS_VIM=false
HAS_NVIM=false
if command -v vim &> /dev/null; then
    HAS_VIM=true
fi
if command -v nvim &> /dev/null; then
    HAS_NVIM=true
fi

if [[ "$HAS_VIM" != true && "$HAS_NVIM" != true ]]; then
    echo -e "${RED}❌ Neither VIM nor Neovim is installed. Please install one of them first.${NC}"
    exit 1
fi

# Determine install target(s)
INSTALL_VIM=false
INSTALL_NVIM=false
if [[ "$HAS_VIM" == true ]]; then
    echo -e "${GREEN}✅ VIM found: $(vim --version | head -n1)${NC}"
fi
if [[ "$HAS_NVIM" == true ]]; then
    echo -e "${GREEN}✅ Neovim found: $(nvim --version | head -n1)${NC}"
fi

if [[ "$HAS_VIM" == true && "$HAS_NVIM" == true ]]; then
    echo ""
    echo "Install iB-theme for:"
    echo "1) Vim only"
    echo "2) Neovim only"
    echo "3) Both (default)"
    echo ""
    read -p "Enter your choice (1-3) [3]: " editor_choice
    editor_choice="${editor_choice:-3}"
    case $editor_choice in
        1) INSTALL_VIM=true ;;
        2) INSTALL_NVIM=true ;;
        3) INSTALL_VIM=true; INSTALL_NVIM=true ;;
        *) INSTALL_VIM=true; INSTALL_NVIM=true ;;
    esac
elif [[ "$HAS_VIM" == true ]]; then
    INSTALL_VIM=true
else
    INSTALL_NVIM=true
fi

# Determine OS
is_windows() {
    [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]
}

# Helper to copy theme files into a colors directory
install_themes_to() {
    local dest_dir="$1"
    local label="$2"
    echo -e "${YELLOW}📁 Creating colors directory: $dest_dir${NC}"
    mkdir -p "$dest_dir"
    echo -e "${YELLOW}📋 Installing theme files to $label...${NC}"
    if [[ -f "$SCRIPT_DIR/colors/ib-theme-dark.vim" ]]; then
        cp "$SCRIPT_DIR/colors/ib-theme-dark.vim" "$dest_dir/"
        echo -e "${GREEN}✅ Installed ib-theme-dark.vim${NC}"
    else
        echo -e "${RED}❌ ib-theme-dark.vim not found${NC}"
        return 1
    fi
    if [[ -f "$SCRIPT_DIR/colors/ib-theme-light.vim" ]]; then
        cp "$SCRIPT_DIR/colors/ib-theme-light.vim" "$dest_dir/"
        echo -e "${GREEN}✅ Installed ib-theme-light.vim${NC}"
    else
        echo -e "${RED}❌ ib-theme-light.vim not found${NC}"
        return 1
    fi
    return 0
}

# Install for Vim
if [[ "$INSTALL_VIM" == true ]]; then
    VIM_DIR="$HOME/.vim"
    if is_windows; then
        VIM_DIR="$HOME/vimfiles"
    fi
    COLORS_DIR="$VIM_DIR/colors"
    if ! install_themes_to "$COLORS_DIR" "Vim"; then
        exit 1
    fi
fi

# Install for Neovim
if [[ "$INSTALL_NVIM" == true ]]; then
    NVIM_COLORS_DIR="$HOME/.config/nvim/colors"
    if ! install_themes_to "$NVIM_COLORS_DIR" "Neovim"; then
        exit 1
    fi
fi

echo ""
echo -e "${BLUE}🔧 Configuration Options${NC}"
echo -e "${BLUE}========================${NC}"

# Ask user for theme preference (for Vim .vimrc only; Neovim gets instructions only)
THEME=""
if [[ "$INSTALL_VIM" == true || "$INSTALL_NVIM" == true ]]; then
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
fi

# Configure .vimrc only for Vim (we do not modify init.vim/init.lua for Neovim)
if [[ -n "$THEME" && "$INSTALL_VIM" == true ]]; then
    VIMRC="$HOME/.vimrc"
    if is_windows; then
        VIMRC="$HOME/_vimrc"
    fi
    echo ""
    echo -e "${YELLOW}📝 Configuring .vimrc...${NC}"
    
    if [[ -f "$VIMRC" ]]; then
        BACKUP_DATE=$(date +%Y%m%d_%H%M%S)
        cp "$VIMRC" "$VIMRC.backup.$BACKUP_DATE"
        echo -e "${GREEN}✅ Created backup: $VIMRC.backup.$BACKUP_DATE${NC}"
    fi
    
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
if [[ "$INSTALL_VIM" == true ]]; then
    echo "• ib-theme-dark.vim, ib-theme-light.vim → $VIM_DIR/colors/"
fi
if [[ "$INSTALL_NVIM" == true ]]; then
    echo "• ib-theme-dark.vim, ib-theme-light.vim → $NVIM_COLORS_DIR/"
fi
if [[ -n "$THEME" && "$INSTALL_VIM" == true ]]; then
    echo "• Configuration added to $VIMRC"
fi
echo ""

echo -e "${BLUE}🚀 Getting Started:${NC}"
if [[ "$INSTALL_VIM" == true ]]; then
    if [[ -n "$THEME" ]]; then
        echo "Vim: Restart VIM to see the theme. Press F5 to toggle dark/light."
    else
        echo "Vim: Add to your ~/.vimrc: colorscheme ib-theme-dark (or ib-theme-light)"
    fi
fi
if [[ "$INSTALL_NVIM" == true ]]; then
    echo ""
    echo "Neovim: Add one of the following to your config:"
    echo "  • init.vim:  colorscheme ${THEME:-ib-theme-dark}"
    echo "  • init.lua:  vim.cmd('colorscheme ${THEME:-ib-theme-dark}')"
    echo "  Config path: ~/.config/nvim/init.vim or ~/.config/nvim/init.lua"
fi
echo ""

echo -e "${BLUE}💡 Tips:${NC}"
echo "• Use :colorscheme ib-theme-dark or :colorscheme ib-theme-light to switch themes"
echo "• For best results, use a terminal with 256-color or true color support"
echo "• Check the README.md for advanced configuration options"
echo ""

echo -e "${BLUE}🔗 More Information:${NC}"
echo "• VIM README: $SCRIPT_DIR/README.md"
echo "• Project URL: https://github.com/JohnThre/iB-theme"
echo ""

echo -e "${GREEN}Thank you for using iB-theme! 🎨${NC}" 