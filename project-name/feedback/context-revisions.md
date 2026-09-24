# Context Revision Ledger

This ledger is the durable handoff between implementation work and repository documentation maintenance.

The `plan-executor` assesses documentation impact after every execution. It appends a `Pending` entry when an implementation may have changed the repository's broader context, architecture, workflows, contracts, security boundaries, or quality model. The `repository-documentation-maintainer` processes pending entries in `Revise` mode and records how each entry was resolved.

This ledger does not replace immediate documentation updates. When implementation directly changes a command, API, event, schema, environment variable, migration procedure, public behavior, or operational step, the executor must update the directly affected documentation during the same implementation. Use this ledger for cross-document reconciliation and contextual changes that benefit from a dedicated repository-wide review.

## Impact scoring

Add each applicable weight once:

| Change dimension | Weight |
|---|---:|
| Architectural boundary, component responsibility, or dependency direction | 3 |
| Security, privacy, authentication, authorization, or trust boundary | 3 |
| Public API, schema, event, or persisted-data contract | 3 |
| Build, setup, CI, deployment, or operational workflow | 2 |
| Testing strategy, quality gate, or validation command | 2 |
| Project purpose, ownership, terminology, or user workflow | 2 |
| Repository layout or source-of-truth responsibility | 2 |
| Small local implementation detail with no contextual effect | 0 |

Interpret the total as follows:

- **0–2 — None or local:** no ledger entry is required.
- **3–5 — Material:** append a pending entry and recommend a documentation revision.
- **6 or more — Structural:** append a pending entry and strongly recommend a documentation revision before the next substantial feature.
- **Security or contract uncertainty:** append a pending entry and treat revision as required regardless of the numeric score.

The score is a consistent decision aid, not a substitute for an evidenced explanation.

## Entry lifecycle

- **Pending** — implementation evidence should be reviewed by the documentation maintainer.
- **Accounted for** — affected documentation was updated or reviewed and confirmed current.
- **No revision needed** — repository evidence showed that no contextual documentation change was warranted.
- **Superseded** — a later entry or change replaced this entry; link or name the replacement.

Do not delete resolved entries. Archive older resolved entries only under an explicit repository policy or user request.

## Entry format

Use the next available identifier in the form `CTX-YYYY-NNN`.

```markdown
## CTX-YYYY-NNN — <short title>

- **Status:** Pending | Accounted for | No revision needed | Superseded
- **Date raised:** <YYYY-MM-DD>
- **Raised by:** plan-executor | user | repository-documentation-maintainer
- **Related demand:** `demands/<slug>.md` or `None`
- **Related plan:** `plans/<slug>-implementation-plan.md` or `None`
- **Work item:** <identifier or `None`>
- **Source branch:** <branch or `Not confirmed`>
- **Base branch:** <branch or `Not confirmed`>
- **Merge status:** Unmerged | Merged | Not confirmed | Not applicable
- **Change reference:** commit `<hash>`, working-tree diff, execution report, or another durable reference
- **Impact score:** <number>
- **Impact level:** Material | Structural | Required
- **Dimensions:** <applicable scoring dimensions>
- **Evidence:**
  - `<path>` — <what changed>
- **Candidate documents:**
  - `<path>`
- **Reason:** <why repository context may now be stale>
- **Direct documentation updated during implementation:** <paths or `None`>
- **Resolution date:** <YYYY-MM-DD or `Pending`>
- **Documents reviewed:** <paths or `Pending`>
- **Documents changed:** <paths, `None`, or `Pending`>
- **Resolution:** <brief evidenced outcome or `Pending`>
- **Resolution reference:** commit `<hash>`, working-tree diff, or `Not committed`
```

## Entries

No entries yet.

Remove the `No entries yet.` line when adding the first entry.
