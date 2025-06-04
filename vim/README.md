# iB-theme for VIM

IBM-inspired themes for VIM based on IBM Carbon Design System. This package provides both dark and light variants with professional appearance and excellent readability.

## 🎨 Overview

The iB-theme for VIM implements the IBM Carbon Design System color palette, offering excellent readability and a professional appearance suitable for extended coding sessions. Both themes support GUI VIM (gVim) and terminal VIM with 256-color support.

## ✨ Features

- 🎯 **IBM Carbon Design System** inspired color palette
- 🌓 **Dark and Light variants** for different preferences
- 👁️ **Optimized for readability** with high contrast colors
- 🔧 **Terminal and GUI support** - Works in both environments
- 💼 **Professional appearance** suitable for enterprise development
- 🚀 **Comprehensive syntax highlighting** for major programming languages
- 🎨 **Plugin support** - Enhanced colors for popular VIM plugins

## 📦 Installation

### Method 1: Manual Installation

1. **Download the theme files**:
   ```bash
   # Clone the repository
   git clone https://github.com/JohnThre/iB-theme.git
   cd iB-theme/vim
   ```

2. **Copy to VIM colors directory**:
   ```bash
   # Create colors directory if it doesn't exist
   mkdir -p ~/.vim/colors
   
   # Copy theme files
   cp colors/ib-theme-dark.vim ~/.vim/colors/
   cp colors/ib-theme-light.vim ~/.vim/colors/
   ```

3. **Activate the theme**:
   Add one of the following lines to your `~/.vimrc`:
   ```vim
   colorscheme ib-theme-dark
   " or
   colorscheme ib-theme-light
   ```

### Method 2: Using a Plugin Manager

#### Vim-Plug
Add to your `~/.vimrc`:
```vim
Plug 'JohnThre/iB-theme', {'rtp': 'vim/'}
```

Then run:
```vim
:PlugInstall
```

#### Vundle
Add to your `~/.vimrc`:
```vim
Plugin 'JohnThre/iB-theme'
```

#### Pathogen
```bash
cd ~/.vim/bundle
git clone https://github.com/JohnThre/iB-theme.git
```

### Method 3: Automatic Installation Script

```bash
cd vim
chmod +x install-vim.sh
./install-vim.sh
```

## 🎨 Usage

### Basic Usage

After installation, activate the theme by adding one of these lines to your `~/.vimrc`:

```vim
" For dark theme
colorscheme ib-theme-dark

" For light theme  
colorscheme ib-theme-light
```

### Advanced Configuration

#### Theme Switching Function
Add this function to your `~/.vimrc` to easily switch between themes:

```vim
function! ToggleIBTheme()
  if g:colors_name == 'ib-theme-dark'
    colorscheme ib-theme-light
    echo "Switched to iB-theme Light"
  else
    colorscheme ib-theme-dark
    echo "Switched to iB-theme Dark"
  endif
endfunction

" Map to F5 key
nnoremap <F5> :call ToggleIBTheme()<CR>
```

#### Terminal Configuration
For best results in terminal VIM, ensure your terminal supports 256 colors:

```vim
" Add to your .vimrc
set t_Co=256
set termguicolors  " For true color support (VIM 8.0+)
```

#### Status Line Enhancement
The themes work great with custom status lines:

```vim
" Simple status line configuration
set laststatus=2
set statusline=%f\ %m%r%h%w\ [%Y]\ [%{&ff}]\ %=%l,%c\ %p%%
```

## 🎯 Supported Languages

The themes provide optimized syntax highlighting for:

**Web Technologies**: HTML, CSS, JavaScript, TypeScript, JSON, YAML  
**Systems Programming**: C, C++, Rust, Go  
**Scripting**: Python, Ruby, Perl, Shell  
**Mobile Development**: Swift, Java, Kotlin  
**Data Science**: R, SQL  
**Documentation**: Markdown, reStructuredText  
**Configuration**: TOML, INI, XML  
**And many more...**

## 🔌 Plugin Support

Enhanced colors for popular VIM plugins:

- **NERDTree** - File explorer with themed icons
- **Git** - Commit message highlighting
- **Markdown** - Enhanced markdown syntax
- **HTML/CSS** - Web development support
- **JavaScript** - Modern JS syntax highlighting
- **Python** - Enhanced Python support

## 🎨 Color Palette

### Dark Theme
| Element | Color | Hex Code |
|---------|-------|----------|
| Background | IBM Gray 100 | `#161616` |
| Foreground | IBM White | `#ffffff` |
| Comments | IBM Gray 50 | `#8d8d8d` |
| Strings | IBM Green 50 | `#42be65` |
| Keywords | IBM Purple 40 | `#be95ff` |
| Functions | IBM Blue 40 | `#78a9ff` |
| Types | IBM Magenta 40 | `#ff7eb6` |
| Numbers | IBM Red 40 | `#ff8389` |

### Light Theme
| Element | Color | Hex Code |
|---------|-------|----------|
| Background | IBM White | `#ffffff` |
| Foreground | IBM Gray 100 | `#161616` |
| Comments | IBM Gray 60 | `#6f6f6f` |
| Strings | IBM Green 60 | `#198038` |
| Keywords | IBM Purple 60 | `#8a3ffc` |
| Functions | IBM Blue 70 | `#0043ce` |
| Types | IBM Magenta 70 | `#9f1853` |
| Numbers | IBM Red 60 | `#da1e28` |

## 🔧 Customization

### Override Specific Colors
You can customize specific highlight groups in your `~/.vimrc`:

```vim
" Example: Change comment color
autocmd ColorScheme ib-theme-dark hi Comment guifg=#a8a8a8
```

### Terminal Color Mapping
For terminal VIM, the themes use standard 16-color mappings that work well with most terminal color schemes.

## 🐛 Troubleshooting

### Colors Not Displaying Correctly
1. **Check color support**:
   ```vim
   :echo &t_Co
   ```
   Should return 256 or higher.

2. **Enable true color** (VIM 8.0+):
   ```vim
   set termguicolors
   ```

3. **Terminal compatibility**:
   Ensure your terminal supports 256 colors or true color.

### Theme Not Loading
1. **Verify installation**:
   ```vim
   :echo globpath(&rtp, 'colors/ib-theme-dark.vim')
   ```

2. **Check for errors**:
   ```vim
   :messages
   ```

## 📝 Requirements

- **VIM 7.0+** (VIM 8.0+ recommended for best experience)
- **256-color terminal** or GUI VIM
- **True color support** recommended for optimal appearance

## 🤝 Contributing

Contributions are welcome! Please see the main project [Contributing Guidelines](../CONTRIBUTING.md) for details.

### Reporting Issues
- Use the main project issue tracker
- Include VIM version and terminal information
- Provide screenshots if possible

## 📄 License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](../LICENSE) file for details.

## 🙏 Acknowledgments

- 🎨 Inspired by [IBM's Carbon Design System](https://carbondesignsystem.com/)
- 🎯 Colors based on [IBM Design Language](https://www.ibm.com/design/language/)
- 💡 Built for modern development workflows

---

**Part of the iB-theme project** - IBM-inspired themes for multiple editors  
🔗 **Main Project**: https://github.com/JohnThre/iB-theme 