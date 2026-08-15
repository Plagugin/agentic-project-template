# Document templates

Reusable templates referenced by agent instructions. These are starting points, not finished documents — replace every placeholder before delivering the result.

## `stakeholder-summary-template.html`

A self-contained, single-file HTML template for summarizing completed work for a **non-technical audience** (typically a product owner or manager). No build step or external assets are required; open it directly in a browser.

Used by:

- `plan-executor`, after completing an approved plan, when a stakeholder-facing summary is useful (see `.github/agents/plan-executor/stakeholder-summary.md`).
- Any other agent producing a similar plain-language summary of finished work.

Conventions:

- Keep language non-technical: explain impact and outcome, not implementation detail.
- Keep code identifiers, file paths, and commands out of the prose; use the `<code>` tag sparingly only where a reader would need the exact name.
- Distinguish what was verified from what remains open or at risk.
- Output location follows the same precedence as the execution report: a user-specified path, otherwise `reports/summaries/<plan-file-stem>-summary.html` when `reports/` exists, otherwise `<plan-file-stem>-summary.html` at the repository root.
- This file is a project deliverable tied to a plan/demand and is committed like any other generated documentation, unless the user says otherwise.

## Developer-specific summaries

For an ad hoc summary requested by the current developer on any topic, that is **not** meant to be committed, reuse this same HTML skeleton (or plain Markdown) but write it under `dev-notes/` instead — see `dev-notes/README.md`.
