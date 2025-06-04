# GNU ELPA Submission Guide for iB-theme

## Overview

This document provides step-by-step instructions for submitting the iB-theme package to GNU ELPA (Emacs Lisp Package Archive).

## Prerequisites

Before submitting to GNU ELPA, ensure you have:

1. **Copyright Assignment**: All code must be assigned to the Free Software Foundation (FSF)
2. **GPL-compatible License**: The package must use GPL v3+ (already done)
3. **Proper Package Format**: Files must follow Emacs Lisp conventions (completed)

## Package Files Ready for Submission

The following files in the `emacs/` directory are ready for GNU ELPA:

- `ib-theme.el` - Main package file
- `ib-theme-dark-theme.el` - Dark theme
- `ib-theme-light-theme.el` - Light theme

## Submission Process

### Step 1: Copyright Assignment

**IMPORTANT**: Before submitting to GNU ELPA, you must assign copyright to the FSF.

1. Contact the FSF at <assign@gnu.org>
2. Request copyright assignment forms for Emacs packages
3. Complete and return the signed forms
4. Wait for confirmation from FSF

### Step 2: Prepare Submission Email

Create an email to the GNU ELPA maintainers with:

**To**: `emacs-devel@gnu.org`
**Subject**: `[ELPA] New package submission: ib-theme`

**Email Template**:

```
Dear GNU ELPA maintainers,

I would like to submit the "ib-theme" package to GNU ELPA.

Package Details:
- Name: ib-theme
- Description: IBM-inspired themes for GNU Emacs based on IBM Carbon Design System
- Version: 1.0.0
- Author: iB-theme <themanpfc@outlook.com>
- License: GPL v3+
- URL: https://github.com/themanpfc/iB-theme

The package provides both dark and light theme variants implementing the IBM Carbon Design System color palette. It supports 50+ popular Emacs packages and has been designed for professional use with excellent readability.

Copyright Assignment Status:
[X] Copyright has been assigned to the FSF (include confirmation details)
[ ] Copyright assignment is in progress (include timeline)

Package Files:
- ib-theme.el (main package file)
- ib-theme-dark-theme.el (dark theme variant)
- ib-theme-light-theme.el (light theme variant)

All files follow GNU ELPA requirements:
- Proper Emacs Lisp header conventions
- Appropriate ;;;###autoload comments
- Dotted numeric version format
- GPL v3+ license headers
- FSF copyright assignment

The package has been tested with Emacs 24.1+ and is ready for inclusion in GNU ELPA.

Please let me know if you need any additional information or modifications.

Best regards,
[Your Name]
```

### Step 3: Attach Package Files

Attach the three main package files:
- `emacs/ib-theme.el`
- `emacs/ib-theme-dark-theme.el`
- `emacs/ib-theme-light-theme.el`

### Step 4: Follow Up

1. Monitor the emacs-devel mailing list for responses
2. Address any feedback or requested changes
3. Be patient - the review process can take several weeks

## Alternative: Single File Submission

If preferred, you can submit as a single file package by combining all themes into one file. However, the current multi-file structure is cleaner and more maintainable.

## Post-Submission

After acceptance:

1. The package will appear in GNU ELPA
2. Users can install via `M-x package-install RET ib-theme RET`
3. Monitor for bug reports and user feedback
4. Submit updates as needed following the same process

## Important Notes

1. **Copyright Assignment is Mandatory**: GNU ELPA requires FSF copyright assignment
2. **Be Patient**: The review process can take time
3. **Follow Guidelines**: Strictly adhere to Emacs Lisp conventions
4. **Respond Promptly**: Address reviewer feedback quickly
5. **Test Thoroughly**: Ensure the package works across Emacs versions

## Resources

- GNU ELPA: https://elpa.gnu.org/
- Emacs Lisp Conventions: https://www.gnu.org/software/emacs/manual/html_node/elisp/Packaging.html
- FSF Copyright Assignment: https://www.fsf.org/licensing/contributor-agreements/
- Emacs Development Mailing List: https://lists.gnu.org/mailman/listinfo/emacs-devel

## Contact

For questions about this submission:
- Author: iB-theme <themanpfc@outlook.com>
- Project URL: https://github.com/themanpfc/iB-theme

---

**Status**: Ready for submission pending FSF copyright assignment completion. 