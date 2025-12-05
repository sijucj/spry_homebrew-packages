#!/usr/bin/env bash
set -e

# ---------------------------------------------
# Usage:
#   ./update-spry-formulas.sh 0.91.0
#
# Automatically updates:
#   Formula/spry-sqlpage.rb
#   Formula/spry-runbook.rb
#
# Then commits & pushes changes.
# ---------------------------------------------

VERSION="$1"

if [ -z "$VERSION" ]; then
  echo "❌ ERROR: version not provided"
  echo "Usage: $0 <version>"
  exit 1
fi

echo "🔧 Updating Spry formulas to version: $VERSION"
echo ""

SQLPAGE_FORMULA="Formula/spry-sqlpage.rb"
RUNBOOK_FORMULA="Formula/spry-runbook.rb"

# Artifact filenames
SQLPAGE_MAC="spry-sqlpage-macos.tar.gz"
SQLPAGE_DEB="spry-sqlpage_${VERSION}-ubuntu22.04u1_amd64.deb"

RUNBOOK_MAC="spry-runbook-macos.tar.gz"
RUNBOOK_DEB="spry-runbook_${VERSION}-ubuntu22.04u1_amd64.deb"

# Artifact URLs
SQLPAGE_MAC_URL="https://github.com/programmablemd/packages/releases/download/v${VERSION}/${SQLPAGE_MAC}"
SQLPAGE_DEB_URL="https://github.com/programmablemd/packages/releases/download/v${VERSION}/${SQLPAGE_DEB}"

RUNBOOK_MAC_URL="https://github.com/programmablemd/packages/releases/download/v${VERSION}/${RUNBOOK_MAC}"
RUNBOOK_DEB_URL="https://github.com/programmablemd/packages/releases/download/v${VERSION}/${RUNBOOK_DEB}"

echo "⬇️  Downloading macOS + Linux artifacts..."

curl -L -o "$SQLPAGE_MAC" "$SQLPAGE_MAC_URL"
curl -L -o "$SQLPAGE_DEB" "$SQLPAGE_DEB_URL"

curl -L -o "$RUNBOOK_MAC" "$RUNBOOK_MAC_URL"
curl -L -o "$RUNBOOK_DEB" "$RUNBOOK_DEB_URL"

echo ""
echo "🔐 Calculating SHA256 hashes..."

SQLPAGE_MAC_SHA=$(sha256sum "$SQLPAGE_MAC" | awk '{print $1}')
SQLPAGE_DEB_SHA=$(sha256sum "$SQLPAGE_DEB" | awk '{print $1}')

RUNBOOK_MAC_SHA=$(sha256sum "$RUNBOOK_MAC" | awk '{print $1}')
RUNBOOK_DEB_SHA=$(sha256sum "$RUNBOOK_DEB" | awk '{print $1}')

echo "SQLPage macOS SHA:  $SQLPAGE_MAC_SHA"
echo "SQLPage Linux SHA:  $SQLPAGE_DEB_SHA"
echo "Runbook macOS SHA:  $RUNBOOK_MAC_SHA"
echo "Runbook Linux SHA:  $RUNBOOK_DEB_SHA"
echo ""

# =======================================================
# UPDATE SQLPAGE FORMULA
# =======================================================
echo "✍️ Updating $SQLPAGE_FORMULA"

sed -i "s/version \".*\"/version \"${VERSION}\"/" "$SQLPAGE_FORMULA"
sed -i "s|v[0-9]\+\.[0-9]\+\.[0-9]\+|v${VERSION}|g" "$SQLPAGE_FORMULA"
sed -i "s|spry-sqlpage_.*-ubuntu22.04u1_amd64.deb|spry-sqlpage_${VERSION}-ubuntu22.04u1_amd64.deb|g" "$SQLPAGE_FORMULA"

# macOS SHA (first sha256)
sed -i "0,/sha256 \".*\"/{s/sha256 \".*\"/sha256 \"${SQLPAGE_MAC_SHA}\"/}" "$SQLPAGE_FORMULA"

# Linux SHA (second sha256)
sed -i "s/sha256 \".*\"/sha256 \"${SQLPAGE_DEB_SHA}\"/2" "$SQLPAGE_FORMULA"

# =======================================================
# UPDATE RUNBOOK FORMULA
# =======================================================
echo "✍️ Updating $RUNBOOK_FORMULA"

sed -i "s/version \".*\"/version \"${VERSION}\"/" "$RUNBOOK_FORMULA"
sed -i "s|v[0-9]\+\.[0-9]\+\.[0-9]\+|v${VERSION}|g" "$RUNBOOK_FORMULA"

# update .deb filename
sed -i "s|spry-sqlpage_.*-ubuntu22.04u1_amd64.deb|spry-sqlpage_${VERSION}-ubuntu22.04u1_amd64.deb|g" "$RUNBOOK_FORMULA"

# macOS SHA (first sha256)
sed -i "0,/sha256 \".*\"/{s/sha256 \".*\"/sha256 \"${RUNBOOK_MAC_SHA}\"/}" "$RUNBOOK_FORMULA"

# Linux SHA (second sha256)
sed -i "s/sha256 \".*\"/sha256 \"${RUNBOOK_DEB_SHA}\"/2" "$RUNBOOK_FORMULA"

echo ""
echo "📄 Updated SQLPage Formula:"
cat "$SQLPAGE_FORMULA"
echo ""

echo "📄 Updated Runbook Formula:"
cat "$RUNBOOK_FORMULA"
echo ""

# =======================================================
# GIT COMMIT & PUSH
# =======================================================
echo "📦 Committing changes to git..."

git add "$SQLPAGE_FORMULA" "$RUNBOOK_FORMULA"
git commit -m "Bump Spry formulas to ${VERSION}"
git push

echo "🎉 All done! Both formulas updated, committed, and pushed!"
