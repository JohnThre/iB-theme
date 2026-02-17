;;; ib-theme.el --- IBM-inspired themes for GNU Emacs -*- lexical-binding: t; -*-

;; Copyright (C) 2025 Free Software Foundation, Inc.

;; Author: Pengfan Chang <jnc@freew.org>
;; Maintainer: Pengfan Chang <jnc@freew.org>
;; Version: 1.0.0
;; Package-Requires: ((emacs "28.1"))
;; Keywords: faces, theme, dark, light, ibm
;; URL: https://github.com/JohnThre/iB-theme

;; This file is part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; IBM-inspired themes for GNU Emacs based on IBM Carbon Design System.
;; This package provides both dark and light variants of the iB-theme.
;;
;; The themes implement the IBM Carbon Design System color palette,
;; offering excellent readability and a professional appearance
;; suitable for extended coding sessions.
;;
;; Available themes:
;; - ib-theme-dark: Dark variant with high contrast
;; - ib-theme-light: Light variant with excellent readability
;;
;; To use these themes, add one of the following to your init file:
;;   (load-theme 'ib-theme-dark t)
;;   (load-theme 'ib-theme-light t)
;;
;; Or use M-x customize-themes to select them interactively.
;;
;; The themes support a wide range of packages including:
;; - Org mode
;; - Magit
;; - Company
;; - Flycheck
;; - Helm
;; - Ivy
;; - Which-key
;; - Rainbow delimiters
;; - Web mode
;; - Markdown mode
;; - Treemacs
;; - LSP mode

;;; Code:

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'ib-theme)

;;; ib-theme.el ends here
