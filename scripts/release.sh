#!/bin/bash

# iB-theme signed release helper
# Builds release assets, signs them with the default GPG key, and publishes via GitHub CLI.

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if [ ! -f "package.json" ]; then
    echo "Error: package.json not found"
    exit 1
fi

VERSION=$(grep '"version"' package.json | sed 's/.*"version": "\([^"]*\)".*/\1/')
if [ -z "$VERSION" ]; then
    echo "Error: could not read version from package.json"
    exit 1
fi

TAG="${1:-v$VERSION}"
TITLE="${2:-iB-theme $TAG}"

for cmd in git gpg gh jq npm; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "Error: required command not found: $cmd"
        exit 1
    fi
done

GIT_SIGNING_KEY=$(git config --get user.signingkey || true)
GPG_SIGNING_ARGS=()

if [ -n "$GIT_SIGNING_KEY" ]; then
    if ! gpg --list-secret-keys "$GIT_SIGNING_KEY" &> /dev/null; then
        echo "Error: git user.signingkey is configured but no matching GPG secret key is available: $GIT_SIGNING_KEY"
        exit 1
    fi
    GPG_SIGNING_ARGS=(--local-user "$GIT_SIGNING_KEY")
elif ! gpg --list-secret-keys --with-colons | grep -q "^sec"; then
    echo "Error: no default GPG secret key is available for signing"
    echo "Configure a default GPG key registered with GitHub before releasing."
    exit 1
fi

if ! gh auth status &> /dev/null; then
    echo "Error: GitHub CLI is not authenticated"
    echo "Run: gh auth login"
    exit 1
fi

if [ -n "$(git status --porcelain)" ]; then
    echo "Error: working tree has uncommitted changes"
    echo "Commit or stash changes before creating a release."
    exit 1
fi

if git rev-parse "$TAG" &> /dev/null; then
    echo "Error: tag already exists: $TAG"
    exit 1
fi

./build.sh --clean --test --package

echo "Creating signed tag $TAG with the default GPG key..."
git tag -s "$TAG" -m "Release $TAG"
git tag -v "$TAG"

echo "Signing release artifacts..."
find dist -maxdepth 1 -type f ! -name "*.asc" -print0 | while IFS= read -r -d '' artifact; do
    gpg "${GPG_SIGNING_ARGS[@]}" --armor --detach-sign "$artifact"
done

echo "Pushing signed tag..."
git push origin "$TAG"

echo "Creating GitHub release..."
gh release create "$TAG" dist/* --title "$TITLE" --generate-notes --verify-tag

echo "Release $TAG created with signed tag and detached artifact signatures."
