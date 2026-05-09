# Terminal Themes

iB-theme supports macOS Terminal and iTerm2 with generated dark and light variants.

## Files

| Target | Dark Theme | Light Theme | Installer |
| --- | --- | --- | --- |
| macOS Terminal | `terminal/ib-theme-dark.terminal` | `terminal/ib-theme-light.terminal` | `terminal/install-terminal.sh` |
| iTerm2 | `terminal/ib-theme-dark.itermcolors` | `terminal/ib-theme-light.itermcolors` | `terminal/install-iterm2.sh` |

## Generation

Regenerate terminal profiles after palette changes:

```bash
swift terminal/generate-terminal-themes.swift
```

The generator maps normal ANSI colors to slots `0` through `7` and bright ANSI colors to slots `8` through `15`. iTerm2 profiles are written as plist XML with sRGB color components, matching iTerm2's `.itermcolors` format.

## Installation

Terminal.app:

```bash
cd terminal
./install-terminal.sh
```

iTerm2:

```bash
cd terminal
./install-iterm2.sh
```

Manual iTerm2 import path: iTerm2 > Settings > Profiles > Colors > Color Presets > Import.

## Validation

Run:

```bash
bash test-themes.sh
```

On macOS, `plutil` validates both `.terminal` and `.itermcolors` plist files. On other systems, file existence and installer permissions are still checked.
