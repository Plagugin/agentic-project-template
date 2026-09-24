# Implementation plans

This directory contains implementation plans produced by the `technical-planner` agent.

An implementation plan turns a Compact or Extended demand and the current repository state into an evidence-based, executor-ready technical plan. Direct work normally proceeds without a plan. See `.github/workflow-profiles.md`.

## File naming

Name the plan after the demand it implements:

```text
<demand-file-stem>-implementation-plan.md
```

Examples:

```text
self-service-password-reset-implementation-plan.md
bulk-export-of-audit-logs-implementation-plan.md
```

With `Work-item-prefixed` naming, the demand stem already contains the work item:

```text
PROJ-123-self-service-password-reset-implementation-plan.md
local-2026-09-24-notification-preferences-implementation-plan.md
```

## Creating a plan

Use the `technical-planner` agent rather than writing a plan by hand. It inherits the demand profile, reclassifies from repository evidence, records any adjustment, links demand identifiers, and preserves executor-ready task granularity.

Compact plans reference the demand and repository documentation instead of repeating them. Extended plans add the design, compatibility, migration, rollout, security, data, and operational detail required by confirmed triggers.

## Lifecycle

- Update the plan in place while it is still being reviewed or refined.
- Once execution begins, keep the plan as the record of intended work; the `plan-executor` agent may report deviations without rewriting the plan's original intent.
- Do not delete a plan after the related work ships. It remains useful history and audit evidence.

Use `Active`, `Completed`, `Abandoned`, or `Superseded` for the artifact lifecycle. Agents automatically select only `Active` local-only plans matching the current work item or branch. A plan from another branch is historical evidence until it is explicitly selected and revalidated.

The executor may change only lifecycle metadata after an evidenced terminal outcome; it must not rewrite the plan's original intent.

## Traceability

Each plan should reference its source demand under `demands/`. Record material option analysis as structured `DEC-*` entries in the plan. After implementation, ensure `docs/ARCHITECTURE.md` reflects the approved and implemented architectural result.

## Feedback loop and parallel tasks

If a plan turns out to be blocked, or depends on a human action, that gets recorded under `feedback/` (see `feedback/README.md`), referencing this plan's slug. Check `feedback/` first before revising a plan.

A plan is sequential by default. It uses explicit `Parallel group` task labels only when parallel execution was specifically requested; `plan-executor` recognizes these labels and treats grouped tasks as safely reorderable relative to each other while still respecting stated dependencies.

## Index

Add active and completed plans here when useful for navigation.

| Plan | Demand | Status |
|---|---|---|
| | | |
