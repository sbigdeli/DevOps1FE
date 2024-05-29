#!/bin/bash

# Read current version from version.txt
VERSION=$(<version.txt)

# Bump version number (example: increment by 1)
NEW_VERSION=$((VERSION + 1))

# Write new version back to version.txt
echo "${NEW_VERSION}" > version.txt

# Optionally, you can do more actions here based on your versioning needss
# For example, update version in package.json or other files
# sed -i "s/\"version\": \".*\"/\"version\": \"${NEW_VERSION}\"/" package.json
