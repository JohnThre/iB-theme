# iB-theme for GNU Emacs

<p align="center">
  <img src="../iB-theme.png" alt="iB-theme Logo" width="128" height="128">
</p>

IBM-inspired themes for GNU Emacs based on the Carbon Design System.

## Features

- 🎨 **IBM Carbon Design System** color palette
- 🌓 **Dark and Light variants** for different preferences
- 👁️ **High contrast** and excellent readability
- 🔧 **Comprehensive coverage** of popular Emacs packages
- ♿ **Accessibility focused** with WCAG compliant colors
- 🚀 **Performance optimized** for smooth editing

## Supported Packages

The themes provide styling for:

- **Core Emacs**: Font-lock, mode-line, minibuffer, search, etc.
- **Org Mode**: Headers, code blocks, links, and more
- **Magit**: Branch indicators, diff highlighting, section headers
- **Company**: Completion tooltips and highlighting
- **Flycheck**: Error, warning, and info indicators
- **Helm**: Headers, selection, and matching
- **Ivy**: Current match and minibuffer faces
- **Which-key**: Key and command descriptions
- **Rainbow Delimiters**: Colorful parentheses matching
- **Web Mode**: HTML tags, attributes, and values
- **Markdown**: Headers, code blocks, and links
- **Treemacs**: Directory and file faces
- **LSP**: Highlight faces for Language Server Protocol
- **Dired**: Directory listings and file types

## Installation

### Automatic Installation (Recommended)

1. Navigate to the `emacs` directory:
   ```bash
   cd emacs
   ```

2. Run the installation script:
   ```bash
   ./install-emacs.sh
   ```

3. The script will:
   - Detect your Emacs configuration directory
   - Copy theme files to `~/.emacs.d/themes/` (or `~/.config/emacs/themes/`)
   - Update your `init.el` if needed

### Manual Installation

1. Copy the theme files to your Emacs themes directory. From the **repository root**:
   ```bash
   mkdir -p ~/.emacs.d/themes
   cp emacs/ib-theme-*-theme.el ~/.emacs.d/themes/
   ```
   Or from the **emacs** directory:
   ```bash
   mkdir -p ~/.emacs.d/themes
   cp ib-theme-*-theme.el ~/.emacs.d/themes/
   ```

2. Add the themes directory to your `custom-theme-load-path` in your `init.el`:
   ```elisp
   (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
   ```

3. Load the theme in your `init.el`:
   ```elisp
   ;; For dark theme
   (load-theme 'ib-theme-dark t)
   
   ;; Or for light theme
   (load-theme 'ib-theme-light t)
   ```

### Package Manager Installation

#### Using `use-package` (if available on MELPA)

```elisp
(use-package ib-theme
  :ensure t
  :config
  (load-theme 'ib-theme-dark t))
```

#### Using `package.el` (if available on MELPA)

```elisp
M-x package-install RET ib-theme RET
```

## Usage

### Interactive Theme Selection

You can switch themes interactively using:

```
M-x load-theme RET ib-theme-dark RET
```

or

```
M-x load-theme RET ib-theme-light RET
```

### Programmatic Theme Loading

Add to your `init.el`:

```elisp
;; Load dark theme
(load-theme 'ib-theme-dark t)

;; Or load light theme
(load-theme 'ib-theme-light t)
```

### Theme Switching Function

You can create a function to toggle between themes:

```elisp
(defun toggle-ib-theme ()
  "Toggle between iB-theme dark and light variants."
  (interactive)
  (if (eq (car custom-enabled-themes) 'ib-theme-dark)
      (progn
        (disable-theme 'ib-theme-dark)
        (load-theme 'ib-theme-light t))
    (progn
      (disable-theme 'ib-theme-light)
      (load-theme 'ib-theme-dark t))))

;; Bind to a key
(global-set-key (kbd "C-c t") 'toggle-ib-theme)
```

## Color Palette

### Dark Theme Colors

| Element | Color | Hex Code |
|---------|-------|----------|
| Background | IBM Gray 100 | `#161616` |
| Foreground | IBM White | `#ffffff` |
| Functions | IBM Blue 40 | `#78a9ff` |
| Keywords | IBM Purple 40 | `#be95ff` |
| Strings | IBM Green 50 | `#42be65` |
| Types | IBM Magenta 40 | `#ff7eb6` |
| Constants | IBM Cyan 40 | `#33b1ff` |
| Comments | IBM Gray 50 | `#8d8d8d` |

### Light Theme Colors

| Element | Color | Hex Code |
|---------|-------|----------|
| Background | IBM White | `#ffffff` |
| Foreground | IBM Gray 100 | `#161616` |
| Functions | IBM Blue 70 | `#0043ce` |
| Keywords | IBM Purple 60 | `#8a3ffc` |
| Strings | IBM Green 60 | `#198038` |
| Types | IBM Magenta 70 | `#9f1853` |
| Constants | IBM Cyan 50 | `#1192e8` |
| Comments | IBM Gray 60 | `#6f6f6f` |

## Customization

You can customize the themes by creating your own theme that inherits from iB-theme:

```elisp
(deftheme my-ib-theme-dark
  "My customized iB-theme dark variant.")

;; Load the base theme first
(load-theme 'ib-theme-dark t)

;; Then override specific faces
(custom-theme-set-faces
 'my-ib-theme-dark
 '(font-lock-comment-face ((t (:foreground "#a8a8a8" :slant normal)))))

(provide-theme 'my-ib-theme-dark)
```

## Troubleshooting

### Theme Not Loading

1. Ensure the theme files are in the correct directory
2. Check that the directory is in `custom-theme-load-path`
3. Verify the theme files have correct permissions

### Colors Not Displaying Correctly

1. Ensure your terminal supports 256 colors or true color
2. Check your Emacs version (requires Emacs 28.1+)
3. Try `M-x list-colors-display` to verify color support

### Package-Specific Issues

If certain packages don't look right:

1. Ensure the package is loaded after the theme
2. Check if the package has custom face definitions
3. Report issues on our GitHub repository

## Uninstallation

To remove the themes:

```bash
cd emacs
./install-emacs.sh uninstall
```

Or manually remove the files:

```bash
rm ~/.emacs.d/themes/ib-theme-*-theme.el
```

## Contributing

Contributions are welcome! Please see the main [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines.

### Adding Support for New Packages

To add support for a new package:

1. Identify the faces used by the package
2. Add appropriate face definitions to both theme files
3. Test with both dark and light variants
4. Submit a pull request

## License

Licensed under GNU General Public License v3.0. See [LICENSE](../LICENSE) for details.

## Acknowledgments

- Based on [IBM Carbon Design System](https://carbondesignsystem.com/)
- Inspired by [IBM Design Language](https://www.ibm.com/design/language/)
- Built for the GNU Emacs community 
