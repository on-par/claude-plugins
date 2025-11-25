#!/bin/bash

# bump-version.sh
# Bumps the version of a plugin in its plugin.json file
# Usage: ./bump-version.sh <plugin-name> [major|minor|patch]
#   If not provided, bumps patch version by 0.0.1
#   - major: bump major version (e.g., 1.2.3 -> 2.0.0)
#   - minor: bump minor version (e.g., 1.2.3 -> 1.3.0)
#   - patch: bump patch version (e.g., 1.2.3 -> 1.2.4)

set -e

PLUGIN_NAME=$1
BUMP_TYPE=${2:-patch}  # Default to patch bump

if [ -z "$PLUGIN_NAME" ]; then
    echo "Error: Plugin name required"
    echo "Usage: $0 <plugin-name> [major|minor|patch]"
    echo "  major = bump major version (e.g., 1.2.3 -> 2.0.0)"
    echo "  minor = bump minor version (e.g., 1.2.3 -> 1.3.0)"
    echo "  patch = bump patch version (e.g., 1.2.3 -> 1.2.4) [default]"
    exit 1
fi

PLUGIN_JSON="${PLUGIN_NAME}/.claude-plugin/plugin.json"

if [ ! -f "$PLUGIN_JSON" ]; then
    echo "Error: Plugin not found at ${PLUGIN_JSON}"
    exit 1
fi

# Extract current version
CURRENT_VERSION=$(grep -o '"version"[[:space:]]*:[[:space:]]*"[^"]*"' "$PLUGIN_JSON" | \
    sed 's/"version"[[:space:]]*:[[:space:]]*"\([^"]*\)"/\1/')

if [ -z "$CURRENT_VERSION" ]; then
    echo "Error: Could not read current version from ${PLUGIN_JSON}"
    exit 1
fi

echo "Current version: ${CURRENT_VERSION}"

# Split version into parts
IFS='.' read -r MAJOR MINOR PATCH <<< "$CURRENT_VERSION"

# Bump the appropriate part
case $BUMP_TYPE in
    major)
        MAJOR=$((MAJOR + 1))
        MINOR=0
        PATCH=0
        ;;
    minor)
        MINOR=$((MINOR + 1))
        PATCH=0
        ;;
    patch)
        PATCH=$((PATCH + 1))
        ;;
    *)
        echo "Error: Invalid bump type '${BUMP_TYPE}'. Use major, minor, or patch."
        exit 1
        ;;
esac

NEW_VERSION="${MAJOR}.${MINOR}.${PATCH}"

echo "Bumping ${BUMP_TYPE} version: ${CURRENT_VERSION} -> ${NEW_VERSION}"

# Update the version in plugin.json
sed -i '' "s/\"version\"[[:space:]]*:[[:space:]]*\"${CURRENT_VERSION}\"/\"version\": \"${NEW_VERSION}\"/" "$PLUGIN_JSON"

echo "✓ Updated ${PLUGIN_JSON}"
echo ""
echo "Don't forget to run: ./scripts/sync-versions.sh"
