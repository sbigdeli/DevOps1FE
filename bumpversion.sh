#!/bin/bash

# Requirements 4: version.md will update
# Check if argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <bump_type>"
    echo "Available bump types: major, minor, patch"
    exit 1
fi

version_file="version.md"

current_version=$(grep -oP '(?<=Version:\s)\d+\.\d+\.\d+' "$version_file")

# Parse major, minor, and patch numbers
major=$(echo "$current_version" | cut -d '.' -f 1)
minor=$(echo "$current_version" | cut -d '.' -f 2)
patch=$(echo "$current_version" | cut -d '.' -f 3)

# Bump version based on bump type
case "$1" in
    major)
        major=$((major + 1))
        minor=0
        patch=0
        ;;
    minor)
        minor=$((minor + 1))
        patch=0
        ;;
    patch)
        patch=$((patch + 1))
        ;;
    *)
        echo "Invalid bump type. Available bump types: major, minor, patch"
        exit 1
        ;;
esac

# Write new version to file
new_version="$major.$minor.$patch"
sed -i "s/Version: $current_version/Version: $new_version/" "$version_file"

echo "Bumped $1 version to $new_version in $version_file"
