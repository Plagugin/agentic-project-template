# Feedback

This directory closes two workflow loops:

- demand and plan correction when work cannot proceed as specified or a person must act
- repository-context maintenance when completed implementation may have made broader documentation stale

It holds:

- **Blocker reports** — a plan or demand turned out to be impossible, unsafe, or materially wrong as written, and the requirements need to change before work can continue.
- **Human action requests** — the agents are not blocked on a decision, but a person needs to do something the agents cannot do (manual testing, granting access, running a destructive command, clicking through a third-party console, physically checking hardware, approving a cost, and so on).
- **Context revision ledger** — `context-revisions.md` records material or structural implementation changes for later processing by `repository-documentation-maintainer`.

Any agent may create either kind of document. This is not exclusive to the `plan-executor`.

The context revision ledger has narrower ownership: `plan-executor` normally raises entries, and `repository-documentation-maintainer` resolves them after reviewing current repository evidence.

## Why this exists

Plans and demands are written ahead of execution. Reality discovered during execution — missing credentials, contradictory requirements, an architecture that does not fit, a step only a human can perform — needs a durable, reviewable place to land so it can feed back into a revised demand or plan, even when the documents are only ever passed between agents by a human copying files around.

Implementation also changes the evidence on which project context, architecture, development, testing, security, and workflow documentation depends. `context-revisions.md` lets the executor record that impact without attempting a broad documentation audit during every implementation.

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

## Context revision lifecycle

The scoring model, entry format, and status definitions live in `context-revisions.md`.

- `plan-executor` updates directly affected behavioral and operational documentation during implementation.
- At completion, it always assesses broader documentation impact.
- Material, structural, security-uncertain, or contract-uncertain changes produce a pending ledger entry.
- `repository-documentation-maintainer` processes pending entries in `Revise` mode and marks them `Accounted for`, `No revision needed`, or `Superseded`.
- Resolved entries remain in the ledger for traceability.

The ledger is not a substitute for documentation required to use or operate the implemented behavior safely.

When the workflow state is local-only, ledger entries record work item, source branch, base branch, and merge status. The documentation maintainer resolves an entry only on the matching source branch or on the recorded base branch after the implementation is confirmed merged. Branch-mismatched entries remain pending.

## Feeding back into demands and plans

- `demand-intake` should check this directory for open reports referencing the demand it is creating or revising, and fold the underlying problem into updated requirements, assumptions, or open questions.
- `technical-planner` should check this directory for open reports referencing the demand or an earlier plan before planning, and address them in the new plan or explicitly carry them forward as unresolved risks.
- `plan-executor` should create a report here instead of silently abandoning a blocked task, and should reference any report it creates from its completion response.
- `plan-executor` should also record qualifying documentation impact in `context-revisions.md`.
- `repository-documentation-maintainer` should process all relevant pending context-revision entries before completing a revision.

## Index

Add active and resolved reports here when useful for navigation.

| Report | Kind | Related demand/plan | Status |
|---|---|---|---|
| | | | |
