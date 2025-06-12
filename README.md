# iB-theme

<p align="center">
  <img src="iB-theme.png" alt="iB-theme Logo" width="128" height="128">
</p>

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Version](https://img.shields.io/badge/version-1.0.0-green.svg)](https://github.com/JohnThre/iB-theme/releases)
[![Validate Theme](https://github.com/JohnThre/iB-theme/workflows/Validate%20Theme/badge.svg)](https://github.com/JohnThre/iB-theme/actions)

![iB-theme Preview of VS Code](https://imgur.com/BpeOoAK.png)

> IBM-inspired code editor theme for Cursor IDE, GNU Emacs and VIM.

## 🎨 Overview

iB-theme is a professional color scheme based on IBM's Carbon Design System, providing both dark and light variants optimized for coding productivity and visual comfort. Designed with enterprise development environments in mind, it offers exceptional readability and a modern aesthetic.

## ✨ Features

- 🎯 **IBM Carbon Design System** inspired color palette
- 🌓 **Dark and Light variants** for different preferences and lighting conditions
- 👁️ **Optimized for readability** with high contrast and carefully selected colors
- 🔧 **Multi-editor support** - Works with Cursor IDE, GNU Emacs, and VIM/Neovim
- 💼 **Professional appearance** suitable for enterprise development environments
- ♿ **Accessibility focused** with WCAG compliant color contrasts
- 🚀 **Performance optimized** for smooth editing experience

## 📦 Installation

### Method 1: VS Code Marketplace (Coming Soon)
```bash
# Will be available via VS Code marketplace
code --install-extension ib-theme.ib-theme
```

### Method 2: Manual Installation

#### Cursor IDE / VS Code

1. **Download the latest release**:
   ```bash
   # Clone the repository
   git clone https://github.com/JohnThre/iB-theme.git
   cd iB-theme
   ```

2. **Install using the provided script**:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

3. **Or install manually**:
   - Copy the theme folder to your extensions directory:
     - **macOS**: `~/.vscode/extensions/` or `~/.cursor/extensions/`
     - **Windows**: `%USERPROFILE%\.vscode\extensions\` or `%USERPROFILE%\.cursor\extensions\`
     - **Linux**: `~/.vscode/extensions/` or `~/.cursor/extensions/`

4. **Activate the theme**:
   - Restart your editor
   - Go to `File > Preferences > Color Theme` (or `Cmd/Ctrl + K, Cmd/Ctrl + T`)
   - Select "iB-theme Dark" or "iB-theme Light"

#### GNU Emacs

**GNU ELPA (Recommended)**:
```elisp
;; Coming soon to GNU ELPA!
;; Once available, install via:
M-x package-install RET ib-theme RET

;; Then load a theme:
(load-theme 'ib-theme-dark t)
;; or
(load-theme 'ib-theme-light t)
```

**Automatic Installation (Current)**:
```bash
cd emacs
./install-emacs.sh
```

**Manual Installation**:
```bash
# Copy theme files
mkdir -p ~/.emacs.d/themes
cp emacs/ib-theme-*-theme.el ~/.emacs.d/themes/

# Add to your init.el
echo "(add-to-list 'custom-theme-load-path \"~/.emacs.d/themes\")" >> ~/.emacs.d/init.el
echo "(load-theme 'ib-theme-dark t)  ; or 'ib-theme-light" >> ~/.emacs.d/init.el
```

**Interactive Loading**:
```
M-x load-theme RET ib-theme-dark RET
```

For detailed Emacs installation and usage instructions, see [emacs/README.md](emacs/README.md).

**GNU ELPA Submission Status**: The iB-theme package has been prepared for GNU ELPA submission with proper copyright assignment and package formatting. See [GNU-ELPA-SUBMISSION.md](GNU-ELPA-SUBMISSION.md) for details.

#### VIM/Neovim

**Automatic Installation (Recommended)**:
```bash
cd vim
chmod +x install-vim.sh
./install-vim.sh
```

**Manual Installation**:
```bash
# Create colors directory
mkdir -p ~/.vim/colors

# Copy theme files
cp vim/colors/ib-theme-dark.vim ~/.vim/colors/
cp vim/colors/ib-theme-light.vim ~/.vim/colors/

# Add to your .vimrc
echo "colorscheme ib-theme-dark" >> ~/.vimrc
# or for light theme
echo "colorscheme ib-theme-light" >> ~/.vimrc
```

**Plugin Manager Installation**:
```vim
" Vim-Plug
Plug 'JohnThre/iB-theme', {'rtp': 'vim/'}

" Vundle
Plugin 'JohnThre/iB-theme'
```

**Interactive Loading**:
```vim
:colorscheme ib-theme-dark
" or
:colorscheme ib-theme-light
```

For detailed VIM installation and usage instructions, see [vim/README.md](vim/README.md).

## 🎨 Color Palette

### Dark Theme
| Element | Color | Hex Code |
|---------|-------|----------|
| Background | IBM Gray 100 | `#161616` |
| Editor | IBM Gray 90 | `#262626` |
| Foreground | IBM White | `#ffffff` |
| Accent | IBM Blue 60 | `#0f62fe` |
| Strings | IBM Green 50 | `#42be65` |
| Keywords | IBM Purple 40 | `#be95ff` |
| Functions | IBM Blue 40 | `#78a9ff` |
| Classes | IBM Magenta 40 | `#ff7eb6` |
| Numbers | IBM Red 40 | `#ff8389` |

### Light Theme
| Element | Color | Hex Code |
|---------|-------|----------|
| Background | IBM White | `#ffffff` |
| Editor | IBM White | `#ffffff` |
| Foreground | IBM Gray 100 | `#161616` |
| Accent | IBM Blue 60 | `#0f62fe` |
| Strings | IBM Green 60 | `#198038` |
| Keywords | IBM Purple 60 | `#8a3ffc` |
| Functions | IBM Blue 70 | `#0043ce` |
| Classes | IBM Magenta 70 | `#9f1853` |
| Numbers | IBM Red 60 | `#da1e28` |

## 🔧 Supported Languages

The theme provides optimized syntax highlighting for:

**Web Technologies**: JavaScript, TypeScript, HTML, CSS, SCSS, JSON, YAML  
**Systems Programming**: C, C++, Rust, Go  
**Mobile Development**: Swift, Dart, Java, Kotlin  
**Data Science**: Python, R, SQL  
**Documentation**: Markdown, reStructuredText  
**Configuration**: TOML, INI, XML  
**And many more...**

## 🚀 Development

### Building from Source

```bash
# Clone the repository
git clone https://github.com/JohnThre/iB-theme.git
cd iB-theme

# Install VS Code Extension Manager
npm install -g @vscode/vsce

# Package the extension
vsce package

# Install locally
code --install-extension ib-theme-1.0.0.vsix
```

### Testing

```bash
# Validate JSON files
npm install -g jsonlint
jsonlint themes/ib-theme-dark.json
jsonlint themes/ib-theme-light.json
```

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

### Quick Start for Contributors

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes and test thoroughly
4. Commit your changes: `git commit -m 'Add amazing feature'`
5. Push to the branch: `git push origin feature/amazing-feature`
6. Open a Pull Request

## 📋 Roadmap

- [x] VS Code/Cursor IDE support
- [x] Dark and Light themes
- [x] GNU Emacs support (v1.0.0) ✨ **NEW!**
- [x] GNU ELPA preparation (v1.0.0) ✨ **NEW!**
- [x] VIM/Neovim support (v1.1.0) ✨ **NEW!**
- [ ] GNU ELPA submission (pending FSF copyright assignment)
- [ ] JetBrains IDEs support (v1.2.0)
- [ ] Sublime Text support (v1.2.0)
- [ ] Additional color variants (v2.0.0)

## 📄 License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**iB-theme Team**  
📧 Email: jnc@freew.org  
🐙 GitHub: [@JohnThre](https://github.com/JohnThre)

## 🙏 Acknowledgments

- 🎨 Inspired by [IBM's Carbon Design System](https://carbondesignsystem.com/)
- 🎯 Colors based on [IBM Design Language](https://www.ibm.com/design/language/)
- 💡 Built for modern development workflows
- 🇺🇸 Made with ❤️ in the USA

## 📊 Stats

![GitHub stars](https://img.shields.io/github/stars/JohnThre/iB-theme?style=social)
![GitHub forks](https://img.shields.io/github/forks/JohnThre/iB-theme?style=social)
![GitHub issues](https://img.shields.io/github/issues/JohnThre/iB-theme)
![GitHub pull requests](https://img.shields.io/github/issues-pr/JohnThre/iB-theme)

---

⭐ **Star this repository if you find it useful!** 