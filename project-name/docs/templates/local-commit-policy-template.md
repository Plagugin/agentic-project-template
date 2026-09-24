# Local Agentic Commit Policy

This clone contains local agentic-workflow files or tracked files with intentional local replacements. This policy lives under the Git directory and must never be copied into repository history.

- **Policy status:** Not yet configured
- **Workflow tracking mode:** Local-only
- **Protected-path list:** `<git-dir>/agentic-workflow/protected-paths.txt`
- **Clone-local rules:** `<git-dir>/agentic-workflow/local-rules.md`
- **Optional pre-commit guard:** `<git-dir>/hooks/pre-commit`
- **Last reviewed:** Not yet confirmed

## Protected tracked overrides

These paths exist in shared Git history but have intentional local content. They must not be staged, committed, or replaced by remote integration without explicit reconciliation.

| Path | Shared baseline blob | Reason |
|---|---|---|
| `AGENTS.md` | Not yet recorded | Local agent workflow override |

## Local-only untracked paths

These paths are protected by `.git/info/exclude` and the protected-path list. They must never be force-added.

| Path | Reason |
|---|---|
| `.github/agentic-workflow-state.md` | Clone-local workflow policy |

## Commit protocol

1. Read this policy before staging or committing.
2. Do not use broad staging commands such as `git add .` or `git add -A` while protected paths exist.
3. Stage intended shared project files explicitly.
4. Inspect `git diff --cached --name-only` before every commit.
5. Stop when any staged path matches an entry in `protected-paths.txt`.
6. Never use force-add or `--no-verify` to bypass this policy.
7. Do not automatically unstage, untrack, restore, or delete a violating path.

## Remote update protocol

Do not run direct `git pull` while protected paths exist.

When the user requests a pull or equivalent remote integration:

1. fetch the configured upstream without modifying the working tree
2. compare `HEAD..@{upstream}` for every protected path
3. stop before merge, rebase, checkout, or reset when any protected path changed upstream
4. report the affected paths and require explicit reconciliation
5. integrate only when no protected path changed and the working tree remains safe
6. use the repository-defined integration strategy; when none exists, prefer fast-forward-only integration

Fetching remote references is not approval to accept protected-path changes into the working tree.

Typical inspection commands:

```text
git fetch
git rev-parse --abbrev-ref --symbolic-full-name '@{upstream}'
git diff --name-status 'HEAD..@{upstream}' -- <protected-path>
```

## Protected override maintenance

`skip-worktree` may hide routine local modifications to tracked overrides, but it is not the source of truth for this policy.

Before branch switching, rebasing, or integrating remote changes:

- verify protected tracked overrides still have the expected index state
- compare the current shared blob with the recorded baseline
- stop when upstream changed the shared version
- reconcile intentionally; never overwrite the local replacement silently
