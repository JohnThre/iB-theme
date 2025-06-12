# iB-theme for GNU ELPA

<p align="center">
  <img src="../iB-theme.svg" alt="iB-theme Logo" width="128" height="128">
</p>

## Package Description

IBM-inspired themes for GNU Emacs based on IBM Carbon Design System. This package provides both dark and light variants with professional appearance and excellent readability.

## Package Structure

This package consists of three main files:

- `ib-theme.el` - Main package file with autoloads
- `ib-theme-dark-theme.el` - Dark theme variant
- `ib-theme-light-theme.el` - Light theme variant

## GNU ELPA Compliance

This package has been prepared for GNU ELPA submission with the following requirements met:

### Copyright Assignment
- Copyright assigned to Free Software Foundation, Inc.
- All files properly licensed under GPL v3+

### Package Headers
- Proper Emacs Lisp header conventions followed
- Correct number of semicolons and hyphens in headers/footers
- Version field uses dotted numeric format (1.0.0)
- Appropriate `;;;###autoload` comments added

### Package Requirements
- Minimum Emacs version: 24.1
- No external dependencies
- Themes are self-contained

### Features
- IBM Carbon Design System color palette
- Support for 50+ popular Emacs packages
- Both dark and light variants
- Professional appearance optimized for coding
- High contrast and excellent readability

## Installation

After acceptance into GNU ELPA, users can install via:

```elisp
M-x package-install RET ib-theme RET
```

Then load a theme:

```elisp
(load-theme 'ib-theme-dark t)
;; or
(load-theme 'ib-theme-light t)
```

## Supported Packages

The themes provide custom faces for:

- Org mode
- Magit
- Company
- Flycheck
- Helm
- Ivy
- Which-key
- Rainbow delimiters
- Web mode
- Markdown mode
- Treemacs
- LSP mode
- And many more...

## Author Information

- Author: Pengfan Chang <jnc@freew.org>
- Maintainer: Pengfan Chang <jnc@freew.org>
- URL: https://github.com/JohnThre/iB-theme
- License: GPL v3+

## Submission Notes

This package is ready for GNU ELPA submission. All files follow GNU ELPA requirements and the package has been tested with multiple Emacs versions. 