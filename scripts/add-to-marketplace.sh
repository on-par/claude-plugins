#!/bin/bash

# add-to-marketplace.sh
# Adds a plugin to the marketplace.json file if not already present
# Usage: ./add-to-marketplace.sh <plugin-name>

set -e

PLUGIN_NAME=$1

if [ -z "$PLUGIN_NAME" ]; then
    echo "Error: Plugin name required"
    echo "Usage: $0 <plugin-name>"
    exit 1
fi

PLUGIN_DIR="${PLUGIN_NAME}"
PLUGIN_JSON="${PLUGIN_DIR}/.claude-plugin/plugin.json"
MARKETPLACE_JSON=".claude-plugin/marketplace.json"

# Check if plugin directory exists
if [ ! -d "$PLUGIN_DIR" ]; then
    echo "Error: Plugin directory not found: ${PLUGIN_DIR}"
    exit 1
fi

# Check if plugin.json exists
if [ ! -f "$PLUGIN_JSON" ]; then
    echo "Error: Plugin metadata not found at ${PLUGIN_JSON}"
    exit 1
fi

# Check if marketplace.json exists
if [ ! -f "$MARKETPLACE_JSON" ]; then
    echo "Error: Marketplace file not found at ${MARKETPLACE_JSON}"
    exit 1
fi

# Extract plugin description from plugin.json
DESCRIPTION=$(grep -o '"description"[[:space:]]*:[[:space:]]*"[^"]*"' "$PLUGIN_JSON" | \
    sed 's/"description"[[:space:]]*:[[:space:]]*"\([^"]*\)"/\1/' | head -1)

if [ -z "$DESCRIPTION" ]; then
    echo "Error: Could not read description from ${PLUGIN_JSON}"
    exit 1
fi

# Check if plugin is already in marketplace.json
if grep -q "\"name\"[[:space:]]*:[[:space:]]*\"${PLUGIN_NAME}\"" "$MARKETPLACE_JSON"; then
    echo "Plugin '${PLUGIN_NAME}' is already in the marketplace"
    exit 0
fi

# Create the plugin entry
PLUGIN_ENTRY="    {
      \"name\": \"${PLUGIN_NAME}\",
      \"source\": \"./${PLUGIN_NAME}\",
      \"description\": \"${DESCRIPTION}\"
    }"

# Read the file content
CONTENT=$(cat "$MARKETPLACE_JSON")

# Find the last plugin entry and add the new one after it
# We'll use awk to insert before the closing bracket of the plugins array
awk -v entry="$PLUGIN_ENTRY" '
/^  \]$/ && !done {
    # Check if we need a comma (if there are existing plugins)
    if (prev_line ~ /}$/) {
        print prev_line ","
    } else {
        print prev_line
    }
    print entry
    print $0
    done = 1
    next
}
{
    if (NR > 1) print prev_line
    prev_line = $0
}
END {
    if (!done) print prev_line
}
' "$MARKETPLACE_JSON" > "${MARKETPLACE_JSON}.tmp"

mv "${MARKETPLACE_JSON}.tmp" "$MARKETPLACE_JSON"

echo "✓ Added '${PLUGIN_NAME}' to marketplace.json"
echo "  Description: ${DESCRIPTION}"
