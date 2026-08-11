# Demands

This directory contains structured demand documents produced by the `demand-intake` agent.

A demand document turns a rough request, brainstorm, complaint, or observation into a traceable requirements handoff for the `technical-planner` agent. It describes the problem, desired outcome, scope, requirements, assumptions, open questions, and acceptance criteria. It does not prescribe an architecture or implementation.

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

## Creating a demand

Use the `demand-intake` agent rather than writing a demand document by hand, so that it follows the required structure (requirements, assumptions, open questions, and acceptance criteria with stable identifiers).

## Lifecycle

A demand document is a living requirements record for the duration of the related work:

- Update it in place while requirements are still being clarified.
- Once an implementation plan exists under `plans/`, keep the demand and the plan cross-referenced.
- Do not delete a demand after the related work ships. It remains useful history for future related requests.

## Traceability

Each demand should be referenced from its implementation plan under `plans/` using the demand's file path. When a decision derived from a demand is architecturally significant, record it as an ADR under `docs/adr/` and link back to the demand.

## Index

Add active and completed demands here when useful for navigation.

| Demand | Title | Status |
|---|---|---|
| | | |
