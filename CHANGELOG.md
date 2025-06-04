# Changelog

All notable changes to the iB-theme project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2024-12-19

### Added
- 🎉 **GNU Emacs support** - Complete theme implementation for Emacs
- 🎉 **VIM/Neovim support** - Complete theme implementation for VIM
- 📦 **GNU ELPA preparation** - Package ready for GNU ELPA submission
- Dark theme for GNU Emacs (`ib-theme-dark-theme.el`)
- Light theme for GNU Emacs (`ib-theme-light-theme.el`)
- Dark theme for VIM (`vim/colors/ib-theme-dark.vim`)
- Light theme for VIM (`vim/colors/ib-theme-light.vim`)
- Main package file (`ib-theme.el`) with proper autoloads
- Automatic installation script for Emacs (`install-emacs.sh`)
- Automatic installation script for VIM (`vim/install-vim.sh`)
- Theme validation test script (`test-themes.el`)
- GNU ELPA submission documentation and guides
- Comprehensive VIM support including:
  - Terminal and GUI VIM compatibility
  - 256-color and true color support
  - Popular plugin integration (NERDTree, Git, Markdown)
  - Theme switching functionality
  - Cross-platform installation support
- Comprehensive Emacs package support including:
  - Core Emacs (font-lock, mode-line, minibuffer, search)
  - Org Mode (headers, code blocks, links)
  - Magit (branch indicators, diff highlighting)
  - Company (completion tooltips)
  - Flycheck (error/warning indicators)
  - Helm and Ivy (selection and matching)
  - Which-key, Rainbow Delimiters, Web Mode
  - Markdown, Treemacs, LSP support
- Dedicated Emacs README with installation and usage instructions
- Dedicated VIM README with installation and usage instructions
- Theme switching function for Emacs users
- Theme switching function for VIM users (F5 key mapping)

### Enhanced
- Updated copyright assignment to Free Software Foundation
- Improved package headers to meet GNU ELPA standards
- Added proper `;;;###autoload` comments for package discovery
- Updated author email to `themanpfc@outlook.com`
- Enhanced documentation for multi-editor support
- Updated main README with GNU ELPA information

### Technical Details
- Emacs themes compatible with Emacs 24.1+
- Proper `custom-theme-load-path` integration
- Autoload functionality for theme discovery
- Support for both `~/.emacs.d` and `~/.config/emacs` configurations
- GNU ELPA compliant package structure
- FSF copyright assignment ready

### Documentation
- `GNU-ELPA-SUBMISSION.md` - Complete submission guide
- `GNU-ELPA-CHECKLIST.md` - Submission process checklist
- `emacs/README-ELPA.md` - GNU ELPA specific documentation
- Updated project roadmap with GNU ELPA status

## [1.0.0] - 2024-12-04

### Added
- Initial release of iB-theme
- Dark theme variant with IBM Carbon Design System colors
- Light theme variant with IBM Carbon Design System colors
- Support for Cursor IDE (VS Code compatible)
- Comprehensive syntax highlighting for major programming languages
- Professional color palette optimized for readability
- Installation script for easy setup
- GNU GPL v3 license

### Features
- IBM-inspired color scheme
- High contrast for better readability
- Support for multiple programming languages:
  - JavaScript/TypeScript
  - Python
  - Java
  - C/C++
  - Go
  - Swift
  - Dart
  - R
  - HTML/CSS
  - JSON/YAML
  - Markdown

### Technical Details
- Package.json configuration for VS Code extension
- Theme JSON files with complete color definitions
- Cross-platform installation support (macOS, Linux, Windows)

## [Planned]

### Future Releases
- VIM/Neovim theme support (v1.2.0)
- JetBrains IDEs support (v1.3.0)
- Sublime Text support (v1.3.0)
- Additional color variants (v2.0.0)
- Enhanced language-specific syntax highlighting
- Custom icon theme integration 