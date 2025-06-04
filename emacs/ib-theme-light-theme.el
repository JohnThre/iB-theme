;;; ib-theme-light-theme.el --- IBM-inspired light theme for GNU Emacs

;; Copyright (C) 2024 Free Software Foundation, Inc.

;; Author: iB-theme <themanpfc@outlook.com>
;; Maintainer: iB-theme <themanpfc@outlook.com>
;; Version: 1.0.0
;; Package-Requires: ((emacs "24.1"))
;; Keywords: faces, theme, light, ibm
;; URL: https://github.com/themanpfc/iB-theme

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

;; IBM-inspired light theme for GNU Emacs based on IBM Carbon Design System.
;; Provides professional appearance with high contrast and readability.
;;
;; This theme implements the IBM Carbon Design System color palette
;; in a light variant, offering excellent readability and a professional
;; appearance suitable for extended coding sessions.
;;
;; To use this theme, add the following to your init file:
;;   (load-theme 'ib-theme-light t)
;;
;; Or use M-x customize-themes to select it interactively.

;;; Code:

;;;###autoload
(deftheme ib-theme-light
  "IBM-inspired light theme for GNU Emacs.")

(let ((class '((class color) (min-colors 89)))
      ;; IBM Carbon Design System Colors (Light)
      (ibm-white    "#ffffff")    ; Background
      (ibm-gray-10  "#f4f4f4")    ; Editor background
      (ibm-gray-20  "#e0e0e0")    ; Subtle background
      (ibm-gray-30  "#c6c6c6")    ; UI elements
      (ibm-gray-40  "#a8a8a8")    ; Disabled text
      (ibm-gray-50  "#8d8d8d")    ; Secondary text
      (ibm-gray-60  "#6f6f6f")    ; Placeholder text
      (ibm-gray-70  "#525252")    ; Tertiary text
      (ibm-gray-80  "#393939")    ; Primary text alt
      (ibm-gray-90  "#262626")    ; Field background
      (ibm-gray-100 "#161616")    ; Primary text
      
      ;; IBM Color Palette (Light)
      (ibm-blue-70  "#0043ce")    ; Functions
      (ibm-blue-60  "#0f62fe")    ; Accent/Links
      (ibm-blue-40  "#78a9ff")    ; Functions alt
      (ibm-green-60 "#198038")    ; Strings
      (ibm-green-50 "#42be65")    ; Success
      (ibm-purple-60 "#8a3ffc")   ; Keywords
      (ibm-purple-40 "#be95ff")   ; Keywords alt
      (ibm-magenta-70 "#9f1853")  ; Classes/Types
      (ibm-magenta-40 "#ff7eb6")  ; Classes alt
      (ibm-red-60   "#da1e28")    ; Numbers/Errors
      (ibm-red-40   "#ff8389")    ; Errors
      (ibm-yellow-20 "#fdd13a")   ; Warnings
      (ibm-cyan-50  "#1192e8"))   ; Constants

  (custom-theme-set-faces
   'ib-theme-light

   ;; Basic faces
   `(default ((,class (:foreground ,ibm-gray-100 :background ,ibm-white))))
   `(cursor ((,class (:background ,ibm-blue-60))))
   `(region ((,class (:background ,ibm-gray-20))))
   `(highlight ((,class (:background ,ibm-gray-20))))
   `(hl-line ((,class (:background ,ibm-gray-10))))
   `(fringe ((,class (:background ,ibm-white :foreground ,ibm-gray-50))))
   `(vertical-border ((,class (:foreground ,ibm-gray-30))))

   ;; Font lock faces (syntax highlighting)
   `(font-lock-builtin-face ((,class (:foreground ,ibm-cyan-50))))
   `(font-lock-comment-face ((,class (:foreground ,ibm-gray-60 :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,ibm-gray-60))))
   `(font-lock-constant-face ((,class (:foreground ,ibm-cyan-50))))
   `(font-lock-doc-face ((,class (:foreground ,ibm-gray-70 :slant italic))))
   `(font-lock-function-name-face ((,class (:foreground ,ibm-blue-70))))
   `(font-lock-keyword-face ((,class (:foreground ,ibm-purple-60))))
   `(font-lock-negation-char-face ((,class (:foreground ,ibm-red-60))))
   `(font-lock-preprocessor-face ((,class (:foreground ,ibm-purple-60))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,ibm-yellow-20))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,ibm-yellow-20))))
   `(font-lock-string-face ((,class (:foreground ,ibm-green-60))))
   `(font-lock-type-face ((,class (:foreground ,ibm-magenta-70))))
   `(font-lock-variable-name-face ((,class (:foreground ,ibm-gray-100))))
   `(font-lock-warning-face ((,class (:foreground ,ibm-yellow-20))))

   ;; Mode line
   `(mode-line ((,class (:background ,ibm-gray-20 :foreground ,ibm-gray-100 
                         :box (:line-width 1 :color ,ibm-gray-30)))))
   `(mode-line-inactive ((,class (:background ,ibm-gray-10 :foreground ,ibm-gray-60
                                  :box (:line-width 1 :color ,ibm-gray-20)))))
   `(mode-line-buffer-id ((,class (:foreground ,ibm-blue-70 :weight bold))))

   ;; Minibuffer
   `(minibuffer-prompt ((,class (:foreground ,ibm-blue-60 :weight bold))))

   ;; Line numbers
   `(line-number ((,class (:foreground ,ibm-gray-50 :background ,ibm-white))))
   `(line-number-current-line ((,class (:foreground ,ibm-gray-100 :background ,ibm-gray-10))))

   ;; Search
   `(isearch ((,class (:background ,ibm-blue-60 :foreground ,ibm-white))))
   `(lazy-highlight ((,class (:background ,ibm-gray-20 :foreground ,ibm-gray-100))))

   ;; Error/Warning faces
   `(error ((,class (:foreground ,ibm-red-60 :weight bold))))
   `(warning ((,class (:foreground ,ibm-yellow-20 :weight bold))))
   `(success ((,class (:foreground ,ibm-green-60 :weight bold))))

   ;; Compilation
   `(compilation-error ((,class (:foreground ,ibm-red-60))))
   `(compilation-warning ((,class (:foreground ,ibm-yellow-20))))
   `(compilation-info ((,class (:foreground ,ibm-blue-70))))

   ;; Dired
   `(dired-directory ((,class (:foreground ,ibm-blue-70 :weight bold))))
   `(dired-header ((,class (:foreground ,ibm-magenta-70 :weight bold))))
   `(dired-symlink ((,class (:foreground ,ibm-cyan-50))))

   ;; Org mode
   `(org-level-1 ((,class (:foreground ,ibm-blue-70 :weight bold :height 1.3))))
   `(org-level-2 ((,class (:foreground ,ibm-magenta-70 :weight bold :height 1.2))))
   `(org-level-3 ((,class (:foreground ,ibm-green-60 :weight bold :height 1.1))))
   `(org-level-4 ((,class (:foreground ,ibm-cyan-50 :weight bold))))
   `(org-code ((,class (:foreground ,ibm-green-60 :background ,ibm-gray-10))))
   `(org-verbatim ((,class (:foreground ,ibm-cyan-50))))
   `(org-link ((,class (:foreground ,ibm-blue-60 :underline t))))

   ;; Parentheses matching
   `(show-paren-match ((,class (:background ,ibm-blue-60 :foreground ,ibm-white))))
   `(show-paren-mismatch ((,class (:background ,ibm-red-60 :foreground ,ibm-white))))

   ;; Company mode
   `(company-tooltip ((,class (:background ,ibm-gray-20 :foreground ,ibm-gray-100))))
   `(company-tooltip-selection ((,class (:background ,ibm-blue-60 :foreground ,ibm-white))))
   `(company-tooltip-common ((,class (:foreground ,ibm-blue-70 :weight bold))))

   ;; Flycheck
   `(flycheck-error ((,class (:underline (:style wave :color ,ibm-red-60)))))
   `(flycheck-warning ((,class (:underline (:style wave :color ,ibm-yellow-20)))))
   `(flycheck-info ((,class (:underline (:style wave :color ,ibm-blue-70)))))

   ;; Magit
   `(magit-branch-local ((,class (:foreground ,ibm-blue-70))))
   `(magit-branch-remote ((,class (:foreground ,ibm-green-60))))
   `(magit-diff-added ((,class (:background ,ibm-green-60 :foreground ,ibm-white))))
   `(magit-diff-removed ((,class (:background ,ibm-red-60 :foreground ,ibm-white))))
   `(magit-section-heading ((,class (:foreground ,ibm-magenta-70 :weight bold))))

   ;; Helm
   `(helm-header ((,class (:background ,ibm-gray-20 :foreground ,ibm-gray-100))))
   `(helm-source-header ((,class (:background ,ibm-blue-60 :foreground ,ibm-white))))
   `(helm-selection ((,class (:background ,ibm-gray-20))))
   `(helm-match ((,class (:foreground ,ibm-blue-70 :weight bold))))

   ;; Ivy
   `(ivy-current-match ((,class (:background ,ibm-gray-20 :foreground ,ibm-gray-100))))
   `(ivy-minibuffer-match-face-1 ((,class (:foreground ,ibm-blue-70))))
   `(ivy-minibuffer-match-face-2 ((,class (:foreground ,ibm-magenta-70 :weight bold))))

   ;; Which-key
   `(which-key-key-face ((,class (:foreground ,ibm-blue-70))))
   `(which-key-group-description-face ((,class (:foreground ,ibm-magenta-70))))
   `(which-key-command-description-face ((,class (:foreground ,ibm-gray-100))))

   ;; Whitespace
   `(whitespace-space ((,class (:foreground ,ibm-gray-40))))
   `(whitespace-tab ((,class (:foreground ,ibm-gray-40))))
   `(whitespace-trailing ((,class (:background ,ibm-red-60))))

   ;; Rainbow delimiters
   `(rainbow-delimiters-depth-1-face ((,class (:foreground ,ibm-blue-70))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground ,ibm-magenta-70))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground ,ibm-green-60))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground ,ibm-cyan-50))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground ,ibm-yellow-20))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground ,ibm-purple-60))))
   `(rainbow-delimiters-depth-7-face ((,class (:foreground ,ibm-red-60))))

   ;; Web mode
   `(web-mode-html-tag-face ((,class (:foreground ,ibm-blue-70))))
   `(web-mode-html-attr-name-face ((,class (:foreground ,ibm-magenta-70))))
   `(web-mode-html-attr-value-face ((,class (:foreground ,ibm-green-60))))

   ;; Markdown
   `(markdown-header-face-1 ((,class (:foreground ,ibm-blue-70 :weight bold :height 1.3))))
   `(markdown-header-face-2 ((,class (:foreground ,ibm-magenta-70 :weight bold :height 1.2))))
   `(markdown-header-face-3 ((,class (:foreground ,ibm-green-60 :weight bold :height 1.1))))
   `(markdown-code-face ((,class (:foreground ,ibm-green-60 :background ,ibm-gray-10))))
   `(markdown-link-face ((,class (:foreground ,ibm-blue-60 :underline t))))

   ;; Treemacs
   `(treemacs-directory-face ((,class (:foreground ,ibm-blue-70))))
   `(treemacs-file-face ((,class (:foreground ,ibm-gray-100))))
   `(treemacs-root-face ((,class (:foreground ,ibm-magenta-70 :weight bold))))

   ;; LSP
   `(lsp-face-highlight-textual ((,class (:background ,ibm-gray-20))))
   `(lsp-face-highlight-read ((,class (:background ,ibm-gray-20))))
   `(lsp-face-highlight-write ((,class (:background ,ibm-gray-20))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'ib-theme-light)

;;; ib-theme-light-theme.el ends here 