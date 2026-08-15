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

## Optional execution report file

Create an execution report file only when:

- the plan explicitly requires one
- the user requests one
- the repository workflow requires one
- the execution is large enough that a durable handoff is materially useful

Use this precedence for the path:

1. a path explicitly supplied by the user
2. `reports/<plan-file-stem>-execution-report.md` when a `reports/` directory exists
3. `execution-report.md` at the repository root

Do not create a report file for a small task when the final response is sufficient.

When a report file is created, use this format:

```markdown
# Execution Report: <title>

## Status

- **Result:** Complete | Complete with limitations | Partially complete | Blocked
- **Plan source:** `<path>`
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
```

## Final response format

At completion, respond using this structure:

```markdown
## Execution result

**Status:** Complete | Complete with limitations | Partially complete | Blocked  
**Plan:** `<path or direct instructions>`  
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
- The completion report distinguishes complete, partial, blocked, failed, and unverified work.
- Any genuine blocker or required human action was recorded under `feedback/` rather than silently dropped, and `feedback/` was checked for an existing open report before creating a new one.
