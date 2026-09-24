# Subagent: Plan Assembly

Use this module to review completeness, select the output path, assemble the plan document in the required format, and produce the completion response. Always read this module at the end of planning, regardless of which earlier modules were used.

## Planning principle: Use honest estimates

Use relative complexity only:

- **S** — local and well-understood
- **M** — multiple files or moderate integration
- **L** — cross-cutting, high-risk, or substantial uncertainty
- **XL** — should be decomposed before execution

Also state confidence as `High`, `Medium`, or `Low`.

Do not estimate calendar time unless the user explicitly requests it and sufficient team-specific evidence exists.

## Step 9: Review for completeness and scope

Before finalizing:

- verify every confirmed requirement is covered
- verify each task has a reason
- remove speculative improvements
- expose unresolved decisions
- identify executor stop conditions
- check that source-code changes were not made
- ensure the plan is internally consistent

## File-selection rules

Use this precedence for the output:

1. a path explicitly supplied by the user
2. an existing plan explicitly referenced by the user
3. `plans/<demand-file-stem>-implementation-plan.md`. Create the `plans/` directory first when it does not yet exist.

When the default path already contains an unrelated plan, create a uniquely named plan using a concise kebab-case demand title.

When the workflow state is local-only, update an existing plan only when it is `Active` and belongs to the same work item. Never automatically select a `Completed`, `Abandoned`, or `Superseded` plan. Ask the user when several active plans match.

Do not create `implementation-plan.md` or any other plan document directly at the project root. All implementation plans belong under `plans/`.

Never overwrite an unrelated document.

## Plan formats

Read `.github/workflow-profiles.md`. Use the Compact format unless the confirmed profile is Extended. Preserve task granularity, validation, dependencies, and stop conditions in both formats.

### Compact plan

Target 400–1,000 words. Omit optional rows that do not apply.

```markdown
# Implementation Plan: <concise title>

- **Status:** Draft | Ready for execution | Needs review | Blocked
- **Readiness:** Ready | Ready with assumptions | Partially blocked | Blocked
- **Workflow profile:** Compact
- **Demand profile:** Compact | Extended | Direct
- **Profile adjustment:** Unchanged | Escalated | Reduced | User-requested Compact
- **Adjustment reason:** <one sentence>
- **Demand:** `<path or direct prompt>`
- **Repository basis:** <branch, snapshot, or current working repository>
- **Work item:** <identifier>
- **Source branch:** <branch>
- **Base branch:** <branch or `Not yet confirmed`>
- **Artifact scope:** Local-only cross-branch
- **Lifecycle:** Active
- **Complexity:** S | M
- **Confidence:** High | Medium

## Approach

<One short paragraph describing the implementation direction, fit with existing patterns, and most important constraint.>

## Change surface

| Area | Planned change | Evidence |
|---|---|---|
| `<path or component>` | <change> | `<path>` |

## Decisions

Include only when meaningful alternatives existed.

| ID | Decision | Rationale | Consequence |
|---|---|---|---|
| DEC-001 | <choice> | <reason> | <trade-off> |

## Tasks

| ID | Outcome and demand links | Areas | Depends on | Validation | Stop condition |
|---|---|---|---|---|---|
| TASK-001 | <outcome>; `FR-001`, `AC-001` | `<path>` | None | <test/check> | <condition or None> |

## Risks, assumptions, and prerequisites

| ID | Type | Detail | Response or invalidation impact |
|---|---|---|---|
| RISK-001 | Risk | <risk> | <mitigation> |
| PLAN-ASM-001 | Assumption | <assumption and basis> | <impact if false> |

## Completion requirements

- satisfy <acceptance IDs>
- preserve <critical convention or behavior>
- update <directly affected documentation>
- report deviations, validation results, unresolved items, and context-revision impact
```

### Extended plan

Use this when an Extended trigger is confirmed.

```markdown
# Implementation Plan: <concise title>

## Status

- **Status:** Draft | Ready for execution | Needs review | Blocked
- **Readiness:** Ready | Ready with assumptions | Partially blocked | Blocked
- **Workflow profile:** Extended
- **Demand profile:** Compact | Extended | Direct
- **Profile adjustment:** Unchanged | Escalated | Reduced | User-selected
- **Adjustment reason:** <evidence-based reason>
- **Extended triggers:** <confirmed triggers>
- **Demand:** `<path or direct prompt>`
- **Repository basis:** <branch, snapshot, or current working repository>
- **Work item:** <identifier>
- **Source branch:** <branch>
- **Base branch:** <branch or `Not yet confirmed`>
- **Artifact scope:** Local-only cross-branch
- **Lifecycle:** Active
- **Complexity:** M | L | XL
- **Confidence:** High | Medium | Low

## Executive summary

<Recommended approach, why it fits, and the most important risk or decision.>

## Demand deltas and current state

Do not restate unchanged demand text.

| Item | Planning interpretation or repository finding | Evidence / effect |
|---|---|---|
| `FR-001` | <clarification, conflict, or unchanged reference> | `<path>` or <planning effect> |

## Change surface

| Area or contract | Current responsibility | Planned impact | Risk | Evidence |
|---|---|---|---|---|
| <area> | <responsibility> | <change> | Low / Medium / High | `<path>` |

## Technical decisions

### DEC-001 — <title>

- **Question:** <decision>
- **Drivers:** <requirement and constraint IDs>
- **Options:** <concise comparison>
- **Recommendation:** <selected option>
- **Rationale:** <repository-specific reason>
- **Consequences:** <important benefits and costs>
- **Confidence:** High | Medium | Low
- **Revisit when:** <invalidation condition>

## Target design

- **Responsibilities and boundaries:** <changes>
- **Control and data flow:** <intended flow>
- **Interfaces and compatibility:** <contracts and compatibility>
- **Data and migration:** <state, integrity, transactions, migration, or no impact>
- **Security and privacy:** <trust, authorization, input, secrets, sensitive data>
- **Resilience and operations:** <failure handling, observability, rollout, rollback>

## Implementation sequence

### TASK-001 — <title>

- **Outcome:** <coherent implementation result>
- **Demand links:** `FR-001`, `AC-001`
- **Depends on:** None | `TASK-xxx` | external decision
- **Parallel group:** None | `PG-1`
- **Complexity / confidence:** S | M | L / High | Medium | Low
- **Areas:** `<path or component>`
- **Required changes:** <behavioral or structural changes>
- **Constraints:** <patterns and prohibited shortcuts>
- **Validation:** <tests and checks>
- **Completion evidence:** <required evidence>
- **Risks:** <task-specific risk>
- **Stop conditions:** <condition or None>

## Validation and traceability

| Requirement / criterion | Tasks | Validation |
|---|---|---|
| FR-001 / AC-001 | TASK-001 | <test or check> |

- **Regression focus:** <behavior>
- **Manual or operational checks:** <checks or None>

## Delivery, dependencies, and risks

- **Documentation:** <updates>
- **Compatibility and rollout:** <sequence, flags, rollback>
- **Internal dependencies:** <items>
- **External dependencies:** <items>
- **Required decisions:** <owner and affected tasks>

| ID | Risk or assumption | Response / invalidation impact |
|---|---|---|
| RISK-001 | <risk> | <mitigation> |
| PLAN-ASM-001 | <assumption and basis> | <impact if false> |

## Executor handoff

- **Execution order:** `TASK-001`, `TASK-002`
- **Must preserve:** <behavior or constraint>
- **Verify before editing:** <uncertain fact>
- **Stop and escalate when:** <conditions>
- **Completion report:** tasks, files, validation, acceptance, deviations, unresolved items, migration or rollback status, and context-revision impact
```

Include the work-item, branch, artifact-scope, and lifecycle rows only when the workflow state is `Local-only` or `Local-only requested`.

## Material blocker rules

Mark the plan as `Blocked` only when no responsible implementation path can be selected without information such as:

- contradictory required behavior
- missing authority for a breaking contract decision
- unknown compliance or security requirement that determines the design
- unknown source-of-truth system
- unknown migration or data-loss tolerance
- absent repository content required to understand the target
- unresolved choice that fundamentally changes scope

For partial blockers:

- plan the unblocked work
- identify affected tasks
- state who should resolve the question
- do not invent an answer

When planning is `Blocked` or `Partially blocked`, also create a blocker report under `feedback/` using `feedback/blocker-template.md`, referencing the demand and (if one exists) the previous plan, so the missing information can be turned into a demand revision. Check `feedback/` first and update or supersede an existing open report for the same demand instead of creating a duplicate.

## Quality checklist

Before completing the plan, verify:

- The confirmed workflow profile follows `.github/workflow-profiles.md`.
- The demand profile, adjustment, basis, and Extended triggers are explicit.
- The selected demand source is explicit.
- Local-only plans match the demand's work item, source branch, base branch, artifact scope, and work-item-prefixed stem.
- The plan reflects the actual repository rather than a generic architecture.
- Repository claims include evidence paths.
- Current state and target state are clearly separated.
- All confirmed requirements and acceptance criteria are traceable.
- The recommended approach includes rationale and trade-offs.
- Planned work is minimal, coherent, and within demand scope.
- Tasks are dependency-aware and executor-sized.
- Tests are planned alongside behavior changes.
- Security, privacy, compatibility, migration, observability, and rollback were considered.
- Assumptions, unknowns, and blockers are visible.
- No source code or non-plan file was modified.
- The executor handoff is actionable without being a code patch.
- Compact plans reference demand IDs and repository documentation instead of repeating their prose.
- Irrelevant sections and repeated `None` entries were omitted.
- Document brevity did not remove necessary tasks, validation, dependencies, or stop conditions.

## Completion response

After creating or updating the plan, respond with only:

1. the plan file path
2. the confirmed workflow profile and any adjustment from the demand
3. the demand source used
4. the recommended approach in one sentence
5. planning readiness
6. overall complexity and confidence
7. the number of tasks, decisions, assumptions, and blockers
8. whether the plan uses parallel task groups (and how many), or `Sequential only`
9. any material issue that prevents execution, and the path to any blocker report created under `feedback/`

When Direct was confirmed and the user chose to skip the plan file, respond with only:

1. `Workflow profile: Direct`
2. the classification basis
3. `Plan file: Not created`
4. the recommended direct next action

Do not implement the plan.
