# File: ./.github/workflows/scripts/check_translations.sh
# Description: Ensure any updated docs in /docs have corresponding translations

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
            echo "❌ Error: Unknown option '$1'"
            exit 1
            ;;
    esac
done

echo "🔍 Checking for missing translations in $DOCS_DIR"

if [ ! -d "$DOCS_DIR" ]; then
    echo "❌ Error: Documentation directory not found at $DOCS_DIR"
    exit 1
fi

if [ "$DEBUG_MODE" = "true" ]; then
    echo "⚠️ DEBUG MODE: Checking ALL documentation files"
fi

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

MISSING=0

for file in $MODIFIED_DOCS; do
    # Only process existing files
    if [ ! -f "$file" ]; then
        continue
    fi

    REL_PATH=$(echo "$file" | sed 's|^docs/||')
    echo "Checking translations for: $REL_PATH"

    for lang in $(ls i18n 2>/dev/null); do
        TRANSLATED_FILE="i18n/$lang/docusaurus-plugin-content-docs/current/$REL_PATH"
        if [ ! -f "$TRANSLATED_FILE" ]; then
            if [ "$MISSING" -eq 0 ]; then
                echo "❌ Missing translations:"
            fi
            echo "- $TRANSLATED_FILE"
            MISSING=$((MISSING + 1))
        fi
    done
done

if [ "$MISSING" -eq 0 ]; then
    echo "✅ All translations present."
    exit 0
else
    exit 1
fi
