# File: ./scripts/docs/check_id_matches_filename.sh
# Description: Ensure each doc file's frontmatter id matches its filename
# Is possible to add more checks to the Front Matter infromations

DEBUG_MODE="false"
DOCS_DIR="docusaurus/docs"

# Parse command line arguments
while [ "$#" -gt 0 ]; do
    case "$1" in
        --debug)
            DEBUG_MODE="true"
            shift
            ;;
        *)
            shift
            ;;
    esac
done

echo "🔍 Checking if doc IDs match filenames in $DOCS_DIR..."

if [ ! -d "$DOCS_DIR" ]; then
    echo "❌ Error: Documentation directory not found at $DOCS_DIR"
    exit 1
fi

MISMATCH_COUNT=0
CHECKED_FILES=0

# Use a temporary file to store mismatches (no arrays in POSIX shell)
TMP_MISMATCHES=$(mktemp)

find "$DOCS_DIR" -type f \( -name '*.md' -o -name '*.mdx' \) | while read -r file; do
    CHECKED_FILES=$((CHECKED_FILES + 1))

    filename=$(basename "$file")
    expected_id=$(echo "$filename" | sed 's/\.[^.]*$//')  # Remove extension
    found_id=$(grep -E '^id: ' "$file" | head -n 1 | cut -d ' ' -f2-)

    if [ "$DEBUG_MODE" = "true" ]; then
        rel_path=$(echo "$file" | sed "s|^$DOCS_DIR/||")
        echo "🔎 Checking: $rel_path (ID: $found_id)"
    fi

    if [ -n "$found_id" ] && [ "$found_id" != "$expected_id" ]; then
        rel_path=$(echo "$file" | sed "s|^$DOCS_DIR/||")
        echo "$rel_path (id: $found_id, expected: $expected_id)" >> "$TMP_MISMATCHES"
        MISMATCH_COUNT=$((MISMATCH_COUNT + 1))
    fi
done

if [ "$MISMATCH_COUNT" -eq 0 ]; then
    echo "✅ All doc IDs match filenames (checked $CHECKED_FILES files)."
    rm -f "$TMP_MISMATCHES"
    exit 0
else
    echo "❌ ID/Filename mismatches found:"
    cat "$TMP_MISMATCHES" | while read -r line; do
        echo "- $line"
    done
    rm -f "$TMP_MISMATCHES"
    exit 1
fi
