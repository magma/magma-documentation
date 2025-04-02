import subprocess
import sys
from pathlib import Path

DOCS_DIR = Path("docusaurus/docs")
REPO_ROOT = Path(".")

def get_created_md_files():
    """
    Identify and return a list of Markdown (.md, .mdx) files that were added
    in the current Git branch compared to the main branch.
    The function uses `git diff` to determine the files that have been added
    (status "A") and filters them to include only Markdown files located within
    the documentation directory.
    Returns:
        list[Path]: A list of relative paths to the newly created Markdown files.
    """
    result = subprocess.run(
        ["git", "diff", "--name-status", "origin/main...HEAD"],
        stdout=subprocess.PIPE,
        text=True,
        check=True
    )

    created_files = []
    for line in result.stdout.strip().splitlines():
        status, filepath = line.split(maxsplit=1)
        path = Path(filepath)
        if status == "A" and path.suffix in [".md", ".mdx"] and DOCS_DIR in path.parents:
            created_files.append(path.relative_to(REPO_ROOT))

    return created_files

def is_file_referenced(file_path):
    """
    Checks if a given file is referenced in the Git repository.
    This function searches the Git repository for occurrences of the file name
    and determines if the file is referenced in any other files.
    Args:
        file_path (Path): The path to the file to check.
    Returns:
        bool: True if the file is referenced in other files, False otherwise.
    """
    file_name = file_path.name
    result = subprocess.run(
        ["git", "grep", "-l", file_name],
        stdout=subprocess.PIPE,
        text=True
    )

    matches = [line for line in result.stdout.strip().splitlines() if Path(line) != file_path]
    return len(matches) > 0

def main():
    created_files = get_created_md_files()
    if not created_files:
        print("No new Markdown files detected.")
        return

    print(f"Checking {len(created_files)} new Markdown files...")

    unreferenced = []

    for md_file in created_files:
        if not is_file_referenced(md_file):
            unreferenced.append(md_file)

    if unreferenced:
        print("❌ The following new files are unreferenced:")
        for f in unreferenced:
            print(f" - {f}")
        sys.exit(1)
    else:
        print("✅ All new Markdown files are referenced.")

if __name__ == "__main__":
    main()
