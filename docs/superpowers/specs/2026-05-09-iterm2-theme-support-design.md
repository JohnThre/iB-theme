# iTerm2 Theme Support Design

## Goal

Add iTerm2 support with dark and light theme files that stay synchronized with the existing IBM Carbon terminal palette and are included in validation, packaging, documentation, and GitHub Actions.

## Scope

- Generate `terminal/ib-theme-dark.itermcolors` and `terminal/ib-theme-light.itermcolors`.
- Add a macOS import script at `terminal/install-iterm2.sh`.
- Validate iTerm2 theme existence, plist syntax, and installer permissions in `test-themes.sh`.
- Package iTerm2 files with the existing terminal distribution in `build.sh`.
- Document iTerm2 installation in `README.md`, record the change in `CHANGELOG.md`, and add iTerm2 to relevant GitHub templates.
- Run the repository theme test suite in `.github/workflows/validate.yml` so GitHub Actions checks the new files.

## Architecture

The existing `terminal/generate-terminal-themes.swift` remains the source of truth for terminal colors. It will emit both macOS Terminal `.terminal` profiles and iTerm2 `.itermcolors` profiles from the same `ThemeColors` values, preventing palette drift between terminal targets.

iTerm2 files will use plist XML with `Color Space` set to `sRGB` and normalized `Red Component`, `Green Component`, `Blue Component`, and `Alpha Component` values. The ANSI mapping follows the existing Terminal.app mapping: `Ansi 0 Color` through `Ansi 7 Color` use the normal ANSI colors, and `Ansi 8 Color` through `Ansi 15 Color` use bright ANSI colors.

## Components

- `terminal/generate-terminal-themes.swift`: add iTerm2 plist generation helpers and include `.itermcolors` output in the main theme list.
- `terminal/install-iterm2.sh`: macOS-only helper that opens generated `.itermcolors` files for iTerm2 import.
- `test-themes.sh`: extend Terminal.app tests with iTerm2 file, plist, and executable checks.
- `build.sh`: include iTerm2 theme files and install script in the terminal package archive.
- Documentation and GitHub files: update user-facing installation docs and CI validation.

## Testing

Testing will start by adding failing checks in `test-themes.sh` for missing iTerm2 files and installer. After implementing generation and installer support, run:

```bash
swift terminal/generate-terminal-themes.swift
bash test-themes.sh
./build.sh --test
```

On GitHub Actions, `.github/workflows/validate.yml` will run `bash test-themes.sh` after JSON validation so CI catches missing or invalid iTerm2 artifacts.
