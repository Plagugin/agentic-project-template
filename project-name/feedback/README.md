# Feedback

This directory closes the loop between the `plan-executor`, `technical-planner`, and `demand-intake` agents when work cannot proceed as currently specified, or when a human has to do something the agents cannot do themselves.

It holds two kinds of short, structured Markdown documents, produced by whichever agent hits the situation:

- **Blocker reports** — a plan or demand turned out to be impossible, unsafe, or materially wrong as written, and the requirements need to change before work can continue.
- **Human action requests** — the agents are not blocked on a decision, but a person needs to do something the agents cannot do (manual testing, granting access, running a destructive command, clicking through a third-party console, physically checking hardware, approving a cost, and so on).

Any agent may create either kind of document. This is not exclusive to the `plan-executor`.

## Why this exists

Plans and demands are written ahead of execution. Reality discovered during execution — missing credentials, contradictory requirements, an architecture that does not fit, a step only a human can perform — needs a durable, reviewable place to land so it can feed back into a revised demand or plan, even when the documents are only ever passed between agents by a human copying files around.

## File naming

```text
feedback/<demand-or-plan-slug>-blocker.md
feedback/<demand-or-plan-slug>-human-action.md
```

Use the same slug as the related demand or plan file so the connection is obvious. Append `-2`, `-3`, and so on only when more than one report accumulates for the same slug and the earlier ones are still open.

Examples:

```text
feedback/self-service-password-reset-blocker.md
feedback/bulk-export-of-audit-logs-human-action.md
```

## Creating a report

Use `feedback/blocker-template.md` or `feedback/human-action-template.md` as the starting structure. Keep the report short and specific — this is a targeted handoff, not a full plan or demand rewrite.

## Lifecycle

- **Open** — the condition still blocks or requires action.
- **Resolved** — the blocker was cleared or the human action was completed; record how, and either update the related demand/plan or link the follow-up change.
- **Superseded** — a newer report replaces this one; link to the replacement.

Do not delete a report merely because work moved on. Mark it resolved or superseded instead so the history of why a plan changed remains traceable.

## Feeding back into demands and plans

- `demand-intake` should check this directory for open reports referencing the demand it is creating or revising, and fold the underlying problem into updated requirements, assumptions, or open questions.
- `technical-planner` should check this directory for open reports referencing the demand or an earlier plan before planning, and address them in the new plan or explicitly carry them forward as unresolved risks.
- `plan-executor` should create a report here instead of silently abandoning a blocked task, and should reference any report it creates from its completion response.

## Index

Add active and resolved reports here when useful for navigation.

| Report | Kind | Related demand/plan | Status |
|---|---|---|---|
| | | | |
