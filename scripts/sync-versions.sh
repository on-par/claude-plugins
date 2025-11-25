#!/bin/bash

# sync-versions.sh
# Syncs plugin versions from plugin.json files to the root README.md

set -e

README="README.md"
TEMP_README="${README}.tmp"

echo "Syncing plugin versions to ${README}..."

# Copy README to temp file
cp "$README" "$TEMP_README"

# Function to get version from plugin.json
get_version() {
    local plugin_dir=$1
    local plugin_json="${plugin_dir}/.claude-plugin/plugin.json"

    if [ -f "$plugin_json" ]; then
        # Extract version using grep and sed
        grep -o '"version"[[:space:]]*:[[:space:]]*"[^"]*"' "$plugin_json" | \
            sed 's/"version"[[:space:]]*:[[:space:]]*"\([^"]*\)"/\1/'
    else
        echo "ERROR: ${plugin_json} not found" >&2
        return 1
    fi
}

# Update version for each plugin
for plugin_dir in rpi product-team enablement-team utensils; do
    if [ -d "$plugin_dir" ]; then
        version=$(get_version "$plugin_dir")

        if [ -n "$version" ]; then
            echo "  ${plugin_dir}: ${version}"

            # Update the version in the README table
            # Match: | [Plugin Name](./path/) | X.X.X | Description |
            # Replace with new version
            case $plugin_dir in
                "rpi")
                    sed -i '' "s#| \[RPI\](./rpi/) | [0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]* |#| [RPI](./rpi/) | ${version} |#" "$TEMP_README"
                    ;;
                "product-team")
                    sed -i '' "s#| \[Product Team\](./product-team/) | [0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]* |#| [Product Team](./product-team/) | ${version} |#" "$TEMP_README"
                    ;;
                "enablement-team")
                    sed -i '' "s#| \[Enablement Team\](./enablement-team/) | [0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]* |#| [Enablement Team](./enablement-team/) | ${version} |#" "$TEMP_README"
                    ;;
                "utensils")
                    sed -i '' "s#| \[Utensils\](./utensils/) | [0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]* |#| [Utensils](./utensils/) | ${version} |#" "$TEMP_README"
                    ;;
            esac
        else
            echo "  ${plugin_dir}: ERROR - Could not read version" >&2
        fi
    fi
done

# Replace original README with updated version
mv "$TEMP_README" "$README"

echo "Version sync complete!"
