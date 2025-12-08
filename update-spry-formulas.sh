#!/usr/bin/env bash
set -e

# ---------------------------------------------
# Usage:
#   ./update-spry-formulas.sh 0.91.0
#
# Automatically updates:
#   Formula/spry.rb
#
# Then commits & pushes changes.
# ---------------------------------------------

VERSION="$1"

if [ -z "$VERSION" ]; then
  echo "❌ ERROR: version not provided"
  echo "Usage: $0 <version>"
  exit 1
fi

echo "🔧 Updating Spry formula to version: $VERSION"
echo ""

SPRY_FORMULA="Formula/spry.rb"

# Artifact filenames
SPRY_MAC="spry-macos.tar.gz"
SPRY_DEB="spry-sqlpage_${VERSION}-ubuntu22.04u1_amd64.deb"

# Artifact URLs
SPRY_MAC_URL="https://github.com/programmablemd/packages/releases/download/v${VERSION}/${SPRY_MAC}"
SPRY_DEB_URL="https://github.com/programmablemd/packages/releases/download/v${VERSION}/${SPRY_DEB}"

echo "⬇️  Downloading macOS + Linux artifacts..."

curl -L -o "$SPRY_MAC" "$SPRY_MAC_URL"
curl -L -o "$SPRY_DEB" "$SPRY_DEB_URL"

echo ""
echo "🔐 Calculating SHA256 hashes..."

SPRY_MAC_SHA=$(sha256sum "$SPRY_MAC" | awk '{print $1}')
SPRY_DEB_SHA=$(sha256sum "$SPRY_DEB" | awk '{print $1}')

echo "Spry macOS SHA:  $SPRY_MAC_SHA"
echo "Spry Linux SHA:  $SPRY_DEB_SHA"
echo ""

# =======================================================
# UPDATE SPRY FORMULA
# =======================================================
echo "✍️ Updating $SPRY_FORMULA"

sed -i "s/version \".*\"/version \"${VERSION}\"/" "$SPRY_FORMULA"
sed -i "s|v[0-9]\+\.[0-9]\+\.[0-9]\+|v${VERSION}|g" "$SPRY_FORMULA"
sed -i "s|spry-sqlpage_.*-ubuntu22.04u1_amd64.deb|spry-sqlpage_${VERSION}-ubuntu22.04u1_amd64.deb|g" "$SPRY_FORMULA"

# macOS SHA (first sha256)
sed -i "0,/sha256 \".*\"/{s/sha256 \".*\"/sha256 \"${SPRY_MAC_SHA}\"/}" "$SPRY_FORMULA"

# Linux SHA (second sha256)
sed -i "s/sha256 \".*\"/sha256 \"${SPRY_DEB_SHA}\"/2" "$SPRY_FORMULA"

echo ""
echo "📄 Updated Spry Formula:"
cat "$SPRY_FORMULA"
echo ""

# =======================================================
# CLEANUP
# =======================================================
echo "🧹 Cleaning up downloaded artifacts..."
rm -f "$SPRY_MAC" "$SPRY_DEB"

# =======================================================
# GIT COMMIT & PUSH
# =======================================================
echo "📦 Committing changes to git..."

git add "$SPRY_FORMULA"
git commit -m "Bump Spry formula to ${VERSION}"
git push

echo "🎉 All done! Spry formula updated, committed, and pushed!"
