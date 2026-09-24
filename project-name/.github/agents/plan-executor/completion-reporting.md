# Subagent: Completion Reporting

Use this module to finish an execution: reviewing the final diff, checking completion criteria, optionally producing an execution report file, and formatting the final response. Always read this module at the end of execution, regardless of which earlier modules were used.

## Step 10: Review the final diff

Before completion, inspect the aggregate changes and check for:

- files outside planned scope
- accidental deletions
- unrelated formatting
- temporary files
- secrets or sensitive data
- generated files modified incorrectly
- missing tests
- missing documentation
- incompatible public changes
- incomplete migrations
- plan requirements not represented in the diff

Remove accidental or unnecessary changes without discarding pre-existing user work.

## Step 11: Assess documentation impact

Perform this assessment after every execution, including small direct tasks.

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

Classify the result:

- **0–2 — None or local:** do not create a ledger entry.
- **3–5 — Material:** append a `Pending` entry to `feedback/context-revisions.md` and recommend running `repository-documentation-maintainer` in `Revise` mode.
- **6 or more — Structural:** append a `Pending` entry and strongly recommend revision before the next substantial feature.
- **Security or contract uncertainty:** append a `Pending` entry and classify revision as `Required` regardless of the total.

Before appending:

1. Confirm that directly affected behavioral and operational documentation was updated during implementation.
2. Check existing pending entries and update a matching entry instead of creating a duplicate.
3. Use the next available `CTX-YYYY-NNN` identifier.
4. Record the demand, plan, work item, source branch, base branch, merge status, commit or working-tree reference, affected files, scoring dimensions, candidate documents, and concise reason. Use `Unmerged` for work completed on a feature branch, `Not applicable` for work completed directly on the base branch, and `Not confirmed` when repository evidence is insufficient.
5. Do not mark the entry resolved. Resolution belongs to `repository-documentation-maintainer` in `Revise` mode.

The numeric score is a consistent trigger, not a claim of mathematical precision. Explain the actual contextual impact.

## Completion criteria

A selected task is complete only when:

- its required behavior is implemented
- linked constraints are respected
- relevant tests are added or updated
- targeted validation passes or failures are explicitly resolved
- necessary documentation is updated
- its acceptance criteria are verified to the practical extent possible
- no material deviation is concealed
- the diff contains no known unintended changes

The overall execution is complete only when all selected tasks are complete or explicitly reported as blocked or incomplete.

For local-only artifacts:

- set the selected plan and linked demand lifecycle to `Completed` only when the approved scope and acceptance criteria are complete
- leave lifecycle `Active` for partial or blocked work
- use `Abandoned` or `Superseded` only when the user explicitly confirms that outcome
- change only the lifecycle metadata; do not rewrite the demand or plan's original intent

## Optional execution report file

Create an execution report file only when:

- the plan explicitly requires one
- the user requests one
- the repository workflow requires one
- the execution is large enough that a durable handoff is materially useful

Use this precedence for the path:

1. a path explicitly supplied by the user
2. `reports/execution/<plan-file-stem>-execution-report.md`

Do not create a report file for Direct work when the final response is sufficient.
Do not write an execution report to the repository root.

When a report file is created, use this format:

```markdown
# Execution Report: <title>

## Status

- **Result:** Complete | Complete with limitations | Partially complete | Blocked
- **Plan source:** `<path>`
- **Workflow profile:** Direct | Compact | Extended
- **Selected tasks:** `TASK-001`, `TASK-002`
- **Working tree baseline:** <clean, dirty with preserved changes, or unavailable>

## Summary

<What was implemented and the resulting behavior.>

## Task results

### TASK-001 — <title>

- **Result:** Complete | Partial | Blocked | Not attempted
- **Demand links:** `FR-001`, `AC-001`
- **Files changed:**
  - `<path>` — <change>
- **Validation:**
  - `<command or check>` — Passed | Failed | Not run
- **Completion evidence:** <evidence>
- **Deviations:** <none or details>
- **Remaining work:** <none or details>

## Acceptance-criteria results

| Criterion | Status | Evidence |
|---|---|---|
| AC-001 | Satisfied and verified | <test, command, or manual check> |

## Validation results

| Check | Result | Notes |
|---|---|---|
| `<command>` | Passed / Failed / Not run | <details> |

## Plan deviations

- <deviation, rationale, impact, or `None`>

## Preserved pre-existing changes

- `<path>` — <pre-existing change that was not overwritten>
- `None identified`

## Risks and unresolved issues

- <issue or `None identified`>

## Follow-up work

- <work outside selected scope or `None`>

## Context revision assessment

- **Impact score:** <number>
- **Impact level:** None or local | Material | Structural | Required
- **Dimensions:** <scored dimensions or `None`>
- **Direct documentation updated:** <paths or `None required`>
- **Ledger entry:** `feedback/context-revisions.md#<entry>` or `Not created`
- **Recommendation:** <run `repository-documentation-maintainer` in `Revise` mode, revise before the next substantial feature, required revision, or no revision needed>
- **Reason:** <concise evidence-based explanation>
```

## Final response format

At completion, respond using this structure:

```markdown
## Execution result

**Status:** Complete | Complete with limitations | Partially complete | Blocked  
**Plan:** `<path or direct instructions>`  
**Workflow profile:** Direct | Compact | Extended
**Tasks:** <completed count>/<selected count> completed

### Implemented

- `TASK-001` — <result>
- <important behavior delivered>

### Files changed

- `<path>` — <purpose>

### Validation

- `<command or check>` — Passed
- `<command or check>` — Failed: <concise reason>
- <important check> — Not run: <concise reason>

### Acceptance criteria

- `AC-001` — Satisfied and verified: <evidence>
- `AC-002` — Partially verified: <limitation>

### Deviations and discoveries

- <deviation, discovered defect, preserved user change, or `None`>

### Feedback and follow-up documents

- Blocker report: `feedback/<slug>-blocker.md` — <one line, or `None created`>
- Human action request: `feedback/<slug>-human-action.md` — <one line, or `None created`>
- Context revision: `CTX-YYYY-NNN` — <impact level and recommendation, or `Not needed`>
- Stakeholder summary: `<path>` — <audience, or `Not created`>

### Remaining issues

- <blocker, residual risk, follow-up, or `None`>
```

Keep the final response concise but complete.

Do not include:

- unsupported claims
- raw verbose command output unless needed to explain a failure
- a new architecture proposal
- unrelated improvement suggestions
- statements implying remote actions that were not performed

## Quality checklist

Before completing, verify all of the following:

- The correct plan and selected tasks were used.
- Applicable repository instructions were followed.
- Pre-existing working-tree changes were preserved.
- The repository was inspected before editing.
- Plan assumptions were verified where material.
- All edits are within approved scope.
- No unrelated refactoring or dependency upgrade was introduced.
- Each completed task maps to requirements and acceptance criteria.
- Tests were added or updated where behavior changed.
- Applicable formatting, linting, type-checking, building, and testing were run.
- Validation results are reported truthfully.
- Security, privacy, compatibility, migration, and operational impacts were handled where relevant.
- Documentation matches the actual implementation.
- The final diff was reviewed.
- No secrets, debugging artifacts, or accidental files remain.
- Material deviations were stopped and surfaced rather than implemented silently.
- No unaddressed Extended trigger was implemented through a Direct or Compact workflow.
- The completion report distinguishes complete, partial, blocked, failed, and unverified work.
- Any genuine blocker or required human action was recorded under `feedback/` rather than silently dropped, and `feedback/` was checked for an existing open report before creating a new one.
- The documentation-impact assessment was completed, directly affected documentation was not improperly deferred, and any required context-revision entry was recorded.
