;;; ib-theme-dark-theme.el --- IBM-inspired dark theme for GNU Emacs

;; Copyright (C) 2025 Free Software Foundation, Inc.

;; Author: Pengfan Chang <jnc@freew.org>
;; Maintainer: Pengfan Chang <jnc@freew.org>
;; Version: 1.0.0
;; Package-Requires: ((emacs "28"))
;; Keywords: faces, theme, dark, ibm
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

;; IBM-inspired dark theme for GNU Emacs based on IBM Carbon Design System.
;; Provides professional appearance with high contrast and readability.
;;
;; This theme implements the IBM Carbon Design System color palette
;; in a dark variant, offering excellent readability and a professional
;; appearance suitable for extended coding sessions.
;;
;; To use this theme, add the following to your init file:
;;   (load-theme 'ib-theme-dark t)
;;
;; Or use M-x customize-themes to select it interactively.

;;; Code:

;;;###autoload
(deftheme ib-theme-dark
  "IBM-inspired dark theme for GNU Emacs.")

(let ((class '((class color) (min-colors 89)))
      ;; IBM Carbon Design System Colors
      (ibm-gray-100 "#161616")    ; Background
      (ibm-gray-90  "#262626")    ; Editor background
      (ibm-gray-80  "#393939")    ; Subtle background
      (ibm-gray-70  "#525252")    ; UI elements
      (ibm-gray-60  "#6f6f6f")    ; Disabled text
      (ibm-gray-50  "#8d8d8d")    ; Secondary text
      (ibm-gray-40  "#a8a8a8")    ; Placeholder text
      (ibm-gray-30  "#c6c6c6")    ; Tertiary text
      (ibm-gray-20  "#e0e0e0")    ; Primary text alt
      (ibm-gray-10  "#f4f4f4")    ; Field background
      (ibm-white    "#ffffff")    ; Primary text
      
      ;; IBM Color Palette
      (ibm-blue-40  "#78a9ff")    ; Functions
      (ibm-blue-60  "#0f62fe")    ; Accent/Links
      (ibm-blue-70  "#0043ce")    ; Functions alt
      (ibm-green-50 "#42be65")    ; Strings
      (ibm-green-60 "#198038")    ; Success
      (ibm-purple-40 "#be95ff")   ; Keywords
      (ibm-purple-60 "#8a3ffc")   ; Keywords alt
      (ibm-magenta-40 "#ff7eb6")  ; Classes/Types
      (ibm-magenta-70 "#9f1853")  ; Classes alt
      (ibm-red-40   "#ff8389")    ; Numbers/Errors
      (ibm-red-60   "#da1e28")    ; Errors
      (ibm-yellow-30 "#f1c21b")   ; Warnings
      (ibm-cyan-40  "#33b1ff"))   ; Constants

  (custom-theme-set-faces
   'ib-theme-dark

   ;; Basic faces
   `(default ((,class (:foreground ,ibm-white :background ,ibm-gray-100))))
   `(cursor ((,class (:background ,ibm-blue-60))))
   `(region ((,class (:background ,ibm-gray-80))))
   `(highlight ((,class (:background ,ibm-gray-80))))
   `(hl-line ((,class (:background ,ibm-gray-90))))
   `(fringe ((,class (:background ,ibm-gray-100 :foreground ,ibm-gray-60))))
   `(vertical-border ((,class (:foreground ,ibm-gray-70))))

   ;; Font lock faces (syntax highlighting)
   `(font-lock-builtin-face ((,class (:foreground ,ibm-cyan-40))))
   `(font-lock-comment-face ((,class (:foreground ,ibm-gray-50 :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,ibm-gray-50))))
   `(font-lock-constant-face ((,class (:foreground ,ibm-cyan-40))))
   `(font-lock-doc-face ((,class (:foreground ,ibm-gray-40 :slant italic))))
   `(font-lock-function-name-face ((,class (:foreground ,ibm-blue-40))))
   `(font-lock-keyword-face ((,class (:foreground ,ibm-purple-40))))
   `(font-lock-negation-char-face ((,class (:foreground ,ibm-red-40))))
   `(font-lock-preprocessor-face ((,class (:foreground ,ibm-purple-40))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,ibm-yellow-30))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,ibm-yellow-30))))
   `(font-lock-string-face ((,class (:foreground ,ibm-green-50))))
   `(font-lock-type-face ((,class (:foreground ,ibm-magenta-40))))
   `(font-lock-variable-name-face ((,class (:foreground ,ibm-white))))
   `(font-lock-warning-face ((,class (:foreground ,ibm-yellow-30))))

   ;; Mode line
   `(mode-line ((,class (:background ,ibm-gray-80 :foreground ,ibm-white 
                         :box (:line-width 1 :color ,ibm-gray-70)))))
   `(mode-line-inactive ((,class (:background ,ibm-gray-90 :foreground ,ibm-gray-50
                                  :box (:line-width 1 :color ,ibm-gray-80)))))
   `(mode-line-buffer-id ((,class (:foreground ,ibm-blue-40 :weight bold))))

   ;; Minibuffer
   `(minibuffer-prompt ((,class (:foreground ,ibm-blue-60 :weight bold))))

   ;; Line numbers
   `(line-number ((,class (:foreground ,ibm-gray-60 :background ,ibm-gray-100))))
   `(line-number-current-line ((,class (:foreground ,ibm-white :background ,ibm-gray-90))))

   ;; Search
   `(isearch ((,class (:background ,ibm-blue-60 :foreground ,ibm-white))))
   `(lazy-highlight ((,class (:background ,ibm-gray-80 :foreground ,ibm-white))))

   ;; Error/Warning faces
   `(error ((,class (:foreground ,ibm-red-40 :weight bold))))
   `(warning ((,class (:foreground ,ibm-yellow-30 :weight bold))))
   `(success ((,class (:foreground ,ibm-green-50 :weight bold))))

   ;; Compilation
   `(compilation-error ((,class (:foreground ,ibm-red-40))))
   `(compilation-warning ((,class (:foreground ,ibm-yellow-30))))
   `(compilation-info ((,class (:foreground ,ibm-blue-40))))

   ;; Dired
   `(dired-directory ((,class (:foreground ,ibm-blue-40 :weight bold))))
   `(dired-header ((,class (:foreground ,ibm-magenta-40 :weight bold))))
   `(dired-symlink ((,class (:foreground ,ibm-cyan-40))))

   ;; Org mode
   `(org-level-1 ((,class (:foreground ,ibm-blue-40 :weight bold :height 1.3))))
   `(org-level-2 ((,class (:foreground ,ibm-magenta-40 :weight bold :height 1.2))))
   `(org-level-3 ((,class (:foreground ,ibm-green-50 :weight bold :height 1.1))))
   `(org-level-4 ((,class (:foreground ,ibm-cyan-40 :weight bold))))
   `(org-code ((,class (:foreground ,ibm-green-50 :background ,ibm-gray-90))))
   `(org-verbatim ((,class (:foreground ,ibm-cyan-40))))
   `(org-link ((,class (:foreground ,ibm-blue-60 :underline t))))

   ;; Parentheses matching
   `(show-paren-match ((,class (:background ,ibm-blue-60 :foreground ,ibm-white))))
   `(show-paren-mismatch ((,class (:background ,ibm-red-60 :foreground ,ibm-white))))

   ;; Company mode
   `(company-tooltip ((,class (:background ,ibm-gray-80 :foreground ,ibm-white))))
   `(company-tooltip-selection ((,class (:background ,ibm-blue-60 :foreground ,ibm-white))))
   `(company-tooltip-common ((,class (:foreground ,ibm-blue-40 :weight bold))))

   ;; Flycheck
   `(flycheck-error ((,class (:underline (:style wave :color ,ibm-red-40)))))
   `(flycheck-warning ((,class (:underline (:style wave :color ,ibm-yellow-30)))))
   `(flycheck-info ((,class (:underline (:style wave :color ,ibm-blue-40)))))

   ;; Magit
   `(magit-branch-local ((,class (:foreground ,ibm-blue-40))))
   `(magit-branch-remote ((,class (:foreground ,ibm-green-50))))
   `(magit-diff-added ((,class (:background ,ibm-green-60 :foreground ,ibm-white))))
   `(magit-diff-removed ((,class (:background ,ibm-red-60 :foreground ,ibm-white))))
   `(magit-section-heading ((,class (:foreground ,ibm-magenta-40 :weight bold))))

   ;; Helm
   `(helm-header ((,class (:background ,ibm-gray-80 :foreground ,ibm-white))))
   `(helm-source-header ((,class (:background ,ibm-blue-60 :foreground ,ibm-white))))
   `(helm-selection ((,class (:background ,ibm-gray-80))))
   `(helm-match ((,class (:foreground ,ibm-blue-40 :weight bold))))

   ;; Ivy
   `(ivy-current-match ((,class (:background ,ibm-gray-80 :foreground ,ibm-white))))
   `(ivy-minibuffer-match-face-1 ((,class (:foreground ,ibm-blue-40))))
   `(ivy-minibuffer-match-face-2 ((,class (:foreground ,ibm-magenta-40 :weight bold))))

   ;; Which-key
   `(which-key-key-face ((,class (:foreground ,ibm-blue-40))))
   `(which-key-group-description-face ((,class (:foreground ,ibm-magenta-40))))
   `(which-key-command-description-face ((,class (:foreground ,ibm-white))))

   ;; Whitespace
   `(whitespace-space ((,class (:foreground ,ibm-gray-70))))
   `(whitespace-tab ((,class (:foreground ,ibm-gray-70))))
   `(whitespace-trailing ((,class (:background ,ibm-red-60))))

   ;; Rainbow delimiters
   `(rainbow-delimiters-depth-1-face ((,class (:foreground ,ibm-blue-40))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground ,ibm-magenta-40))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground ,ibm-green-50))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground ,ibm-cyan-40))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground ,ibm-yellow-30))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground ,ibm-purple-40))))
   `(rainbow-delimiters-depth-7-face ((,class (:foreground ,ibm-red-40))))

   ;; Web mode
   `(web-mode-html-tag-face ((,class (:foreground ,ibm-blue-40))))
   `(web-mode-html-attr-name-face ((,class (:foreground ,ibm-magenta-40))))
   `(web-mode-html-attr-value-face ((,class (:foreground ,ibm-green-50))))

   ;; Markdown
   `(markdown-header-face-1 ((,class (:foreground ,ibm-blue-40 :weight bold :height 1.3))))
   `(markdown-header-face-2 ((,class (:foreground ,ibm-magenta-40 :weight bold :height 1.2))))
   `(markdown-header-face-3 ((,class (:foreground ,ibm-green-50 :weight bold :height 1.1))))
   `(markdown-code-face ((,class (:foreground ,ibm-green-50 :background ,ibm-gray-90))))
   `(markdown-link-face ((,class (:foreground ,ibm-blue-60 :underline t))))

   ;; Treemacs
   `(treemacs-directory-face ((,class (:foreground ,ibm-blue-40))))
   `(treemacs-file-face ((,class (:foreground ,ibm-white))))
   `(treemacs-root-face ((,class (:foreground ,ibm-magenta-40 :weight bold))))

   ;; LSP
   `(lsp-face-highlight-textual ((,class (:background ,ibm-gray-80))))
   `(lsp-face-highlight-read ((,class (:background ,ibm-gray-80))))
   `(lsp-face-highlight-write ((,class (:background ,ibm-gray-80))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'ib-theme-dark)

;;; ib-theme-dark-theme.el ends here 