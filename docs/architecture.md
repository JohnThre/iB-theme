# Architecture

iB-theme ships one visual system across multiple editor and terminal targets. The VS Code/Cursor themes are JSON files, GNU Emacs themes are Emacs Lisp, Vim and Neovim themes are Vimscript, CotEditor themes are `.cottheme` files, and terminal profiles are generated from a shared Swift palette source.

## Repository Map

```mermaid
flowchart TD
    root["Repository root"] --> vscode["themes/\nVS Code and Cursor JSON"]
    root --> emacs["emacs/\nGNU Emacs themes"]
    root --> vim["vim/colors/\nVim and Neovim themes"]
    root --> coteditor["coteditor/\nCotEditor themes"]
    root --> terminal["terminal/\nTerminal.app and iTerm2 profiles"]
    root --> docs["docs/\nMaintainer documentation"]
    root --> github[".github/\nIssues, PRs, and Actions"]
```

## Terminal Generation Flow

`terminal/generate-terminal-themes.swift` is the source of truth for terminal profile colors. It writes both Terminal.app and iTerm2 artifacts from the same dark and light `ThemeColors` values.

```mermaid
flowchart LR
    palette["IBM Carbon palette\nThemeColors"] --> generator["Swift generator"]
    generator --> darkTerminal["ib-theme-dark.terminal"]
    generator --> lightTerminal["ib-theme-light.terminal"]
    generator --> darkITerm["ib-theme-dark.itermcolors"]
    generator --> lightITerm["ib-theme-light.itermcolors"]
    darkTerminal --> tests["test-themes.sh"]
    lightTerminal --> tests
    darkITerm --> tests
    lightITerm --> tests
```

## Validation And Packaging

Local validation and GitHub Actions use the same test entry point. Packaging copies each supported target into `build/`, creates archives in `dist/`, and writes checksums for release verification.

```mermaid
flowchart TD
    changes["Theme or documentation changes"] --> localTests["bash test-themes.sh"]
    changes --> ci["GitHub Actions\nValidate Theme"]
    localTests --> build["./build.sh --clean --test --package"]
    ci --> json["JSON validation"]
    ci --> suite["Theme test suite"]
    ci --> vsix["VS Code package check"]
    build --> dist["dist/\nArchives, VSIX, checksums"]
```

## Signed Release Flow

Releases use GitHub's free CLI and release tooling. The signed tag and detached artifact signatures use the configured Git signing key when `user.signingkey` is set, otherwise GPG's default secret key is used.

```mermaid
sequenceDiagram
    participant Maintainer
    participant Script as scripts/release.sh
    participant Git as Git
    participant GPG as GPG
    participant GH as GitHub

    Maintainer->>Script: scripts/release.sh
    Script->>Script: build, validate, package
    Script->>Git: create signed tag
    Script->>GPG: create detached signatures
    Script->>GH: push tag
    Script->>GH: create release with assets
```

## Open VSX Publishing Flow

Publishing to Open VSX is handled by GitHub Actions after a release is published. VS Code Marketplace publishing remains separate because that release channel is already handled outside this workflow.

```mermaid
flowchart LR
    release["GitHub release published"] --> action["Publish Open VSX workflow"]
    action --> build["./build.sh --clean --test --package"]
    build --> vsix["dist/ib-theme-<version>.vsix"]
    vsix --> openvsx["Open VSX\nnpx ovsx publish"]
```
