# Implementation plans

This directory contains implementation plans produced by the `technical-planner` agent.

An implementation plan turns a structured demand from `demands/` and the current repository state into an evidence-based, executor-ready technical plan: affected components, technical decisions, task breakdown, test strategy, migration and rollout considerations, risks, and stop conditions for the `plan-executor` agent.

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

## Creating a plan

Use the `technical-planner` agent rather than writing a plan by hand, so that it inspects the repository, links back to demand requirement identifiers, and produces an executor-ready task breakdown.

## Lifecycle

- Update the plan in place while it is still being reviewed or refined.
- Once execution begins, keep the plan as the record of intended work; the `plan-executor` agent may report deviations without rewriting the plan's original intent.
- Do not delete a plan after the related work ships. It remains useful history and audit evidence.

## Traceability

Each plan should reference its source demand under `demands/`. When the plan selects among materially different architectural alternatives, record that decision as an ADR under `docs/adr/` and link it from the plan.

## Index

Add active and completed plans here when useful for navigation.

| Plan | Demand | Status |
|---|---|---|
| | | |
