# Demands

This directory contains structured demand documents produced by the `demand-intake` agent.

A demand document turns a Compact or Extended request into a traceable requirements handoff for the `technical-planner` agent. Direct work normally does not create a demand. See `.github/workflow-profiles.md`.

## File naming

Use a concise kebab-case title that identifies the demand:

```text
<short-kebab-case-title>.md
```

Examples:

```text
self-service-password-reset.md
bulk-export-of-audit-logs.md
notification-preferences-center.md
```

When `.github/agentic-workflow-state.md` uses `Work-item-prefixed` naming, use:

```text
<work-item>-<short-kebab-case-title>.md
```

Examples:

```text
PROJ-123-self-service-password-reset.md
local-2026-09-24-notification-preferences.md
```

## Creating a demand

Use the `demand-intake` agent rather than writing a demand document by hand. It recommends Direct, Compact, or Extended; asks whether to skip the document when Direct is appropriate; and preserves stable requirement, assumption, question, and acceptance identifiers when a document is created.

Compact demands use concise tables and direct sentences. Extended demands add only the detail required by material contracts, data, security, architecture, migration, deployment, compatibility, coordination, reversibility, or uncertainty.

## Lifecycle

A demand document is a living requirements record for the duration of the related work:

- Update it in place while requirements are still being clarified.
- Once an implementation plan exists under `plans/`, keep the demand and the plan cross-referenced.
- Do not delete a demand after the related work ships. It remains useful history for future related requests.

Use `Active`, `Completed`, `Abandoned`, or `Superseded` for the artifact lifecycle. Agents automatically select only `Active` local-only demands matching the current work item or branch. Explicit paths always take precedence.

Local-only demands may remain in the working directory across ticket branches. Their presence does not make them applicable to the current branch.

## Traceability

Each demand should be referenced from its implementation plan under `plans/` using the demand's file path. When implemented work materially changes the system architecture, update `docs/ARCHITECTURE.md` with the resulting current state and link to the relevant demand or plan when useful.

## Feedback loop

If planning or execution later reveals that this demand cannot be satisfied as written, or depends on a human action, that gets recorded as a report under `feedback/` (see `feedback/README.md`), referencing this demand's slug. When revising a demand, check `feedback/` first for an open report and fold it into the update.

## Index

Add active and completed demands here when useful for navigation.

| Demand | Title | Status |
|---|---|---|
| | | |
