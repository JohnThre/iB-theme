# iB-theme

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Version](https://img.shields.io/badge/version-1.0.0-green.svg)](https://github.com/JohnThre/iB-theme/releases)
[![Validate Theme](https://github.com/JohnThre/iB-theme/workflows/Validate%20Theme/badge.svg)](https://github.com/JohnThre/iB-theme/actions)

![iB-theme Preview](https://imgur.com/BpeOoAK.png)

> IBM-inspired code editor theme for Cursor IDE, GNU Emacs and VIM.

## Overview

iB-theme is a professional color scheme based on IBM's Carbon Design System, providing both dark and light variants optimized for coding productivity and visual comfort. Designed with enterprise development environments in mind, it offers exceptional readability and a modern aesthetic.

## Features

- **IBM Carbon Design System** inspired color palette
- **Dark and Light variants** for different preferences and lighting conditions
- **Optimized for readability** with high contrast and carefully selected colors
- **Multi-editor support** - Works with Cursor IDE, GNU Emacs, and VIM
- **Professional appearance** suitable for enterprise development environments
- **Accessibility focused** with WCAG compliant color contrasts
- **Performance optimized** for smooth editing experience

## Installation

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

```elisp
;; Emacs theme files will be provided in future releases
;; Stay tuned for v1.1.0
```

#### VIM/Neovim

```vim
" VIM theme files will be provided in future releases
" Stay tuned for v1.1.0
```

## Color Palette

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

## Supported Languages

The theme provides optimized syntax highlighting for:

**Web Technologies**: JavaScript, TypeScript, HTML, CSS, SCSS, JSON, YAML  
**Systems Programming**: C, C++, Rust, Go  
**Mobile Development**: Swift, Dart, Java, Kotlin  
**Data Science**: Python, R, SQL  
**Documentation**: Markdown, reStructuredText  
**Configuration**: TOML, INI, XML  
**And many more...**

## Development

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

## Contributing

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
- [ ] GNU Emacs support (v1.1.0)
- [ ] VIM/Neovim support (v1.1.0)

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## Author

**iB-theme Team**  
Email: jnc@freew.org  
GitHub: [@JohnThre](https://github.com/JohnThre)

## Acknowledgments

- Inspired by [IBM's Carbon Design System](https://carbondesignsystem.com/)
- Colors based on [IBM Design Language](https://www.ibm.com/design/language/)
- Built for modern development workflows
- 🇺🇸 Made with ❤️ in the USA

## 📊 Stats

![GitHub stars](https://img.shields.io/github/stars/JohnThre/iB-theme?style=social)
![GitHub forks](https://img.shields.io/github/forks/JohnThre/iB-theme?style=social)
![GitHub issues](https://img.shields.io/github/issues/JohnThre/iB-theme)
![GitHub pull requests](https://img.shields.io/github/issues-pr/JohnThre/iB-theme)

---

⭐ **Star this repository if you find it useful!** 