# iB-theme Documentation

This directory contains maintainer-focused documentation for the iB-theme multi-editor theme package.

## Documents

- [Architecture](architecture.md): theme targets, generation flow, validation, packaging, and release flow diagrams.
- [Terminal Themes](terminal-themes.md): macOS Terminal and iTerm2 theme generation, installation, and palette mapping.
- [Release Process](release-process.md): signed release checklist using GitHub CLI and GPG.

## Maintainer Workflow

1. Update theme sources and generated artifacts.
2. Run local validation with `bash test-themes.sh`.
3. Package release artifacts with `./build.sh --clean --test --package`.
4. Publish a signed GitHub release with `scripts/release.sh`.

GitHub Actions runs the repository validation suite on pull requests and pushes to protected branches.
