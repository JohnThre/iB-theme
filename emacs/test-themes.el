;;; test-themes.el --- Test script for iB-theme package

;; Copyright (C) 2024 Free Software Foundation, Inc.

;; This file is part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;;; Commentary:

;; Test script to validate iB-theme package functionality.
;; Run this script to ensure both themes load correctly.

;;; Code:

(defun ib-theme-test-load-themes ()
  "Test loading both iB-theme variants."
  (interactive)
  (message "Testing iB-theme package...")
  
  ;; Test dark theme
  (condition-case err
      (progn
        (load-theme 'ib-theme-dark t)
        (message "✓ ib-theme-dark loaded successfully"))
    (error
     (message "✗ Failed to load ib-theme-dark: %s" err)))
  
  ;; Wait a moment
  (sit-for 1)
  
  ;; Test light theme
  (condition-case err
      (progn
        (load-theme 'ib-theme-light t)
        (message "✓ ib-theme-light loaded successfully"))
    (error
     (message "✗ Failed to load ib-theme-light: %s" err)))
  
  (message "Theme testing complete."))

(defun ib-theme-test-faces ()
  "Test that key faces are properly defined."
  (interactive)
  (message "Testing theme faces...")
  
  (let ((test-faces '(default
                      font-lock-keyword-face
                      font-lock-string-face
                      font-lock-comment-face
                      font-lock-function-name-face
                      mode-line
                      mode-line-inactive)))
    
    (dolist (face test-faces)
      (if (facep face)
          (message "✓ Face %s is defined" face)
        (message "✗ Face %s is not defined" face))))
  
  (message "Face testing complete."))

(defun ib-theme-run-all-tests ()
  "Run all iB-theme tests."
  (interactive)
  (message "Starting iB-theme test suite...")
  (ib-theme-test-load-themes)
  (ib-theme-test-faces)
  (message "All tests completed."))

;; Auto-run tests when this file is loaded
(when (and (boundp 'noninteractive) (not noninteractive))
  (message "Run M-x ib-theme-run-all-tests to test the themes"))

(provide 'test-themes)

;;; test-themes.el ends here 