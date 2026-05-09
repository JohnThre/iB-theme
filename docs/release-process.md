# Release Process

Use this process to publish iB-theme releases through GitHub's free release tooling.

## Prerequisites

- `gh` authenticated with permission to create releases.
- `gpg` installed with a secret signing key.
- Git configured with `user.signingkey` for the GitHub-registered release key, or a suitable default GPG secret key.
- `jq`, `npm`, and VS Code packaging support available.
- Repository secrets configured for marketplace publishing:
  - `VSCE_PAT`: Visual Studio Marketplace Personal Access Token with Marketplace Manage scope.
  - `OVSX_PAT`: Open VSX access token.
- Clean working tree on the release commit.

Check the active signing key:

```bash
git config --get user.signingkey
gpg --list-secret-keys --keyid-format=long
```

## Release Checklist

1. Update `package.json` version.
2. Move `CHANGELOG.md` entries from `Unreleased` to the release version and date.
3. Run `swift terminal/generate-terminal-themes.swift` if terminal colors changed.
4. Run `bash test-themes.sh`.
5. Commit the release changes.
6. Run `scripts/release.sh`.
7. Verify the GitHub release page shows the expected tag, assets, checksums, and `.asc` signatures.
8. Verify the `Publish Marketplaces` GitHub Actions workflow publishes the VSIX to Visual Studio Marketplace and Open VSX.

## Publishing

Default tag and title:

```bash
scripts/release.sh
```

Explicit tag and title:

```bash
scripts/release.sh v1.3.0 "iB-theme v1.3.0"
```

The helper creates a signed Git tag, verifies the tag locally, signs every `dist/` artifact with detached ASCII-armored GPG signatures, pushes the tag, and creates the GitHub release with `gh release create`.

## Marketplace Publishing

`.github/workflows/publish-marketplaces.yml` runs automatically when a GitHub release is published. It can also be run manually through `workflow_dispatch` with an optional tag input.

The workflow rebuilds and validates the release with:

```bash
./build.sh --clean --test --package
```

It publishes the generated `dist/ib-theme-<version>.vsix` to both registries:

```bash
npx @vscode/vsce publish --packagePath dist/ib-theme-<version>.vsix --pat "$VSCE_PAT"
npx ovsx publish dist/ib-theme-<version>.vsix -p "$OVSX_PAT"
```
