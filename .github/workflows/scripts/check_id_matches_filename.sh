# File: ./scripts/docs/check_id_matches_filename.sh
# Description: Ensure each doc file's frontmatter id matches its filename
# Is possible to add more checks to the Front Matter infromations

DEBUG_MODE="false"
DOCS_DIR="docusaurus/docs"
EXTENSIONS=("*.md" "*.mdx")
FIND_EXPR=""

# Parse command line arguments
while [ "$#" -gt 0 ]; do
    case "$1" in
        --debug)
            DEBUG_MODE="true"
            shift
            ;;
        *)
            echo "❌ Error: Unknown argument: $1"
            exit 1
            ;;
    esac
done

echo "🔍 Checking if doc IDs match filenames in $DOCS_DIR"

if [ ! -d "$DOCS_DIR" ]; then
    echo "❌ Error: Documentation directory not found at $DOCS_DIR"
    exit 1
fi

MISMATCH_COUNT=0
CHECKED_FILES=0


# TODO: Probably transform in a dedicated function as is used in chack_id and check_translations
# Get modified files or all files based on debug mode
if [ "$DEBUG_MODE" = "true" ]; then
    # Build the `-name` expression dynamically
    for EXT in "${EXTENSIONS[@]}"; do
        if [ -n "$FIND_EXPR" ]; then
            FIND_EXPR="$FIND_EXPR -o -name \"$EXT\""
        else
            FIND_EXPR="-name \"$EXT\""
        fi
    done
    # Wrap the whole expression in escaped parentheses
    FIND_CMD="find "$DOCS_DIR" -type f \\( $FIND_EXPR \\) ! -path \"versioned_docs/*\""
    # Evaluate and execute
    MODIFIED_DOCS=$(eval $FIND_CMD)
else
    BASE_REF="${GITHUB_BASE_REF:-origin/main}"
    MODIFIED_DOCS=$(git diff --name-only "$BASE_REF...HEAD" -- 'docs/**/*.md' 'docs/**/*.mdx' ':!versioned_docs/**')
fi

if [ -z "$MODIFIED_DOCS" ]; then
    echo "✅ No files to check."
    exit 0
fi

# Use a temporary file to store mismatches
TMP_MISMATCHES=$(mktemp)

for FILE in $MODIFIED_DOCS; do
    # Only process existing files
    if [ ! -f "$file" ]; then
        continue
    fi
    
    CHECKED_FILES=$((CHECKED_FILES + 1))

    FILENAME=$(basename "$FILE")
    EXPECTED_ID=$(basename "$FILE" .md)  # Remove .md extension
    EXPECTED_ID=$(basename "$EXPECTED_ID" .mdx)  # Remove .mdx extension if present
    EXPECTED_ID=$(echo "$FILENAME" | sed 's/\.[^.]*$//')  # Remove extension
    FOUND_ID=$(grep -E '^id: ' "$FILE" | head -n 1 | cut -d ' ' -f2-)

    if [ "$DEBUG_MODE" = "true" ]; then
        REL_PATH=$(echo "$FILE" | sed "s|^$DOCS_DIR/||")
        echo "🔎 Checking: $REL_PATH (ID: $FOUND_ID)"
    fi

    if [ -n "$FOUND_ID" ] && [ "$FOUND_ID" != "$EXPECTED_ID" ]; then
        REL_PATH=$(echo "$FILE" | sed "s|^$DOCS_DIR/||")
        echo "$REL_PATH (id: $FOUND_ID, expected: $EXPECTED_ID)" >> "$TMP_MISMATCHES"
        MISMATCH_COUNT=$((MISMATCH_COUNT + 1))
    fi
done

if [ "$MISMATCH_COUNT" -eq 0 ]; then
    echo "✅ All doc IDs match filenames (checked $CHECKED_FILES files)."
    rm -f "$TMP_MISMATCHES"
    exit 0
else
    echo "❌ ID/Filename mismatches found:"
    cat "$TMP_MISMATCHES" | while read -r LINE; do
        echo "- $LINE"
    done
    rm -f "$TMP_MISMATCHES"
    exit 1
fi
