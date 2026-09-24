#!/bin/sh

git_dir=$(git rev-parse --git-dir 2>/dev/null) || exit 1
protected_file="$git_dir/agentic-workflow/protected-paths.txt"

[ -f "$protected_file" ] || exit 0

blocked=0

while IFS= read -r protected_path || [ -n "$protected_path" ]; do
    protected_path=$(printf '%s' "$protected_path" | tr -d '\r')

    case "$protected_path" in
        ""|\#*) continue ;;
    esac

    normalized_path=${protected_path%/}

    if ! git diff --cached --quiet -- "$normalized_path"; then
        echo "Commit blocked: protected local path is staged: $normalized_path" >&2
        blocked=1
    fi
done < "$protected_file"

if [ "$blocked" -ne 0 ]; then
    echo "Review $protected_file and unstage the protected paths before committing." >&2
    exit 1
fi

exit 0
