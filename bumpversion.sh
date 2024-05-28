# Requirements 4: version.md will update
# Check if argument is provided or extracted from commit message
if [ -z "$1" ]; then
    echo "Error: Bump type not provided or extracted from commit message."
    exit 1
fi

bump_type="$1"
version_file="version.md"

current_version=$(grep -oP '(?<=Version:\s)\d+\.\d+\.\d+' "$version_file")

# Parse major, minor, and patch numbers
major=$(echo "$current_version" | cut -d '.' -f 1)
minor=$(echo "$current_version" | cut -d '.' -f 2)
patch=$(echo "$current_version" | cut -d '.' -f 3)

# Bump version based on bump type
case "$bump_type" in
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

echo "Bumped $bump_type version to $new_version in $version_file"
