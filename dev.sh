#!/bin/bash

# Read current version from version.txt
VERSION=$(<version.md)

# Bump version number (example: increment by 1)
NEW_VERSION=$((VERSION + 1))

# Write new version back to version.txt
echo "${NEW_VERSION}" > version.md

# Optionally, you can do more actions here based on your versioning needsssss
# For example, update version in package.json or other files
# sed -i "s/\"version\": \".*\"/\"version\": \"${NEW_VERSION}\"/" package.json
