# Document templates

Reusable templates referenced by agent instructions. These are starting points, not finished documents — replace every placeholder before delivering the result.

## `stakeholder-summary-template.html`

A self-contained, single-file HTML template for summarizing completed work for a **non-technical audience** (typically a product owner or manager). No build step or external assets are required; open it directly in a browser.

Used by:

- `plan-executor`, after completing an approved plan, when a stakeholder-facing summary is useful (see `.github/agent-modules/plan-executor/stakeholder-summary.md`).
- Any other agent producing a similar plain-language summary of finished work.

Conventions:

- Keep language non-technical: explain impact and outcome, not implementation detail.
- Keep code identifiers, file paths, and commands out of the prose; use the `<code>` tag sparingly only where a reader would need the exact name.
- Distinguish what was verified from what remains open or at risk.
- Output location is a user-specified path or `reports/stakeholder/<plan-file-stem>-summary.html`. Do not write generated summaries to the repository root.
- This file is a project deliverable tied to a plan/demand. It is tracked in Shared mode and remains local when `.github/agentic-workflow-state.md` selects local-only operation.

## Developer-specific summaries

For an ad hoc summary requested by the current developer on any topic that is **not** meant to be committed, reuse this same HTML skeleton (or plain Markdown) but write it under `reports/local/` instead — see `reports/local/README.md`.

## Clone-local Git protection templates

- `local-commit-policy-template.md` — human- and agent-readable rules copied to `<git-dir>/agentic-workflow/commit-policy.md`.
- `local-protected-paths-template.txt` — machine-readable repository-relative paths copied to `<git-dir>/agentic-workflow/protected-paths.txt`.
- `local-pre-commit-hook.sh` — optional hard guard that blocks commits containing protected paths.
- `local-rules-template.md` — structured clone- or worktree-specific rules copied to `<git-dir>/agentic-workflow/local-rules.md`.

The documentation maintainer customizes the policy, protected-path list, and initial rule registry. It must not overwrite an existing Git hook; when one exists, report that manual integration is required.
