# Release Process

Use this process to publish iB-theme releases through GitHub's free release tooling.

## Prerequisites

- `gh` authenticated with permission to create releases.
- `gpg` installed with a secret signing key.
- Git configured with `user.signingkey` for the GitHub-registered release key, or a suitable default GPG secret key.
- `jq`, `npm`, and VS Code packaging support available.
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
