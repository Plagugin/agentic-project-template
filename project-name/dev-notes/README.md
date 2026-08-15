# Developer notes (local, not committed)

This folder holds on-demand summary files generated for **the current developer**, on whatever topic they ask an agent to explain. Content here is personal working material, not a project deliverable.

Any agent (demand-intake, technical-planner, plan-executor, solution-discovery-consultant, repository-documentation-initializer, or the default assistant) may write here when a developer asks for a summary, explanation, or write-up that is not meant to become part of the tracked project history.

## Rules

- Files in this folder (other than this `README.md`) are **not committed**. `dev-notes/*` is excluded in `.gitignore`.
- Content may be Markdown or HTML (the HTML skeleton in `docs/templates/stakeholder-summary-template.html` can be reused for a nicer read, but a plain Markdown file is equally acceptable here).
- Topic is unrestricted: it can explain a subsystem, summarize a discussion, translate a technical change for a non-technical audience, capture a personal decision log, or anything else the developer finds useful.
- Do not put secrets, credentials, or sensitive production data in these files even though they are not committed — they may still be synced, backed up, or shared unintentionally.
- Do not treat a file here as a substitute for a demand, plan, ADR, blocker/human-action report, or completion report. If content is meant to be shared with teammates or kept as project history, it belongs in `demands/`, `plans/`, `docs/adr/`, `feedback/`, or a committed report instead.

## Naming

Use a short, freeform, kebab-case name that describes the topic and, optionally, a date:

```text
dev-notes/<topic>.md
dev-notes/<topic>.html
dev-notes/<YYYY-MM-DD>-<topic>.md
```

There is no required structure and no index to maintain — this is disposable, developer-scoped scratch space.
