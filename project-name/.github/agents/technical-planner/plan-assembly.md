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

Do not create `implementation-plan.md` or any other plan document directly at the project root. All implementation plans belong under `plans/`.

Never overwrite an unrelated document.

## Required plan format

Use the following structure. Adapt optional subsections to project size, but preserve the top-level sections.

```markdown
# Implementation Plan: <concise title>

## Document status

- **Status:** Draft | Ready for execution | Needs review | Blocked
- **Planning readiness:** Ready | Ready with assumptions | Partially blocked | Blocked
- **Demand source:** `<relative path or direct prompt>`
- **Repository basis:** <branch, snapshot, or `current working repository`; do not invent a commit>
- **Overall complexity:** S | M | L | XL
- **Planning confidence:** High | Medium | Low

## Executive summary

<Brief description of the recommended change, why it fits the project, and the most important risk or decision.>

## Demand interpretation

### Required outcomes

| Demand ID | Interpreted outcome | Planning status |
|---|---|---|
| FR-001 | <outcome> | Covered / Assumed / Blocked |

### Constraints

| Constraint ID | Constraint | Planning effect |
|---|---|---|
| CON-001 | <constraint> | <effect> |

### Non-goals

- <explicit exclusion>

### Demand gaps and conflicts

- <gap, contradiction, or `None material`>

## Current system assessment

### Repository map

| Area | Responsibility | Evidence |
|---|---|---|
| <component> | <responsibility> | `<path>` — <symbol or section> |

### Relevant current behavior

<Describe the verified behavior and execution/data flow.>

### Existing conventions to preserve

- <convention with repository evidence>

### Unknowns in the current system

- <unknown and how the executor should verify it>

## Change-impact analysis

| Area | Impact | Reason | Risk |
|---|---|---|---|
| <component or contract> | None / Low / Medium / High | <reason> | <risk> |

### Likely change locations

- `<relative/path>` — <expected responsibility of the change>
- `<directory/>` — <expected scope; mark as provisional where needed>

### Explicitly unaffected areas

- <area and reason>

## Technical options and decisions

### DEC-001 — <decision title>

- **Question:** <decision being made>
- **Demand drivers:** `FR-001`, `NFR-001`, `CON-001`
- **Repository evidence:** `<path>` — <relevant fact>
- **Options considered:**
  1. **<option>:** <summary, advantages, disadvantages>
  2. **<option>:** <summary, advantages, disadvantages>
- **Recommendation:** <selected option>
- **Rationale:** <why it fits this project>
- **Consequences:** <positive and negative>
- **Confidence:** High | Medium | Low
- **Revisit when:** <condition that invalidates or changes the decision>

## Target technical design

### Architecture and responsibilities

<Describe component boundaries and responsibility changes.>

### Control and data flow

<Describe the intended flow from entry point through persistence/integration and response.>

### Interfaces and contracts

| Interface | Planned change | Compatibility |
|---|---|---|
| <API/event/module/schema> | <change> | Compatible / Breaking / Internal |

### Data and state

<Describe models, persistence, migrations, state transitions, transactions, concurrency, or `No data impact`.>

### Error handling and resilience

<Expected validation, failures, retries, idempotency, recovery, and user-visible behavior.>

### Security and privacy

<Authorization, authentication, trust boundaries, input handling, secrets, personal data, auditability, or `No additional impact identified`.>

### Performance and scalability

<Expected impact, limits, hot paths, caching, query behavior, load validation, or `No material impact expected`.>

### Observability and operations

<Logging, metrics, tracing, alerts, dashboards, support diagnostics, and operational ownership.>

### Compatibility, migration, and rollout

<Backwards compatibility, data migration, feature flags, deployment order, staged release, rollback, or `Not applicable`.>

## Implementation sequence

### Phase 1 — <phase name>

#### TASK-001 — <task title>

- **Purpose:** <coherent implementation outcome>
- **Demand links:** `FR-001`, `AC-001`
- **Depends on:** None | `TASK-xxx` | external decision
- **Complexity:** S | M | L | XL
- **Confidence:** High | Medium | Low
- **Affected areas:** `<path or component>`
- **Required changes:**
  - <behavioral or structural change>
- **Implementation guidance:**
  - <important architectural constraints and patterns to follow>
- **Do not:**
  - <scope guardrail or prohibited shortcut>
- **Validation:**
  - <tests and checks>
- **Completion evidence:**
  - <what the executor must be able to report or demonstrate>
- **Risks and cautions:**
  - <task-specific risk>
- **Stop conditions:**
  - <condition requiring user or architect input, or `None identified`>

## Test and validation plan

### Traceability matrix

| Requirement / criterion | Planned tasks | Validation |
|---|---|---|
| FR-001 / AC-001 | TASK-001 | <test or check> |

### Automated testing

- **Unit:** <scope and likely locations>
- **Integration:** <scope and likely locations>
- **Contract:** <scope or `Not applicable`>
- **End-to-end:** <scope or `Not applicable`>
- **Migration:** <scope or `Not applicable`>
- **Security:** <scope or `Not applicable`>
- **Performance:** <scope or `Not applicable`>

### Manual and operational validation

- <manual workflow, deployment check, telemetry check, or `None required`>

### Regression focus

- <existing behavior most likely to regress>

## Documentation and delivery updates

- <documentation, changelog, runbook, API reference, configuration, support notes>
- <state `None required` where justified>

## Risks and mitigations

| Risk ID | Risk | Likelihood | Impact | Mitigation / fallback |
|---|---|---|---|---|
| RISK-001 | <risk> | Low / Medium / High | Low / Medium / High | <mitigation> |

## Dependencies and prerequisites

### Internal dependencies

- <dependency or `None identified`>

### External dependencies

- <dependency or `None identified`>

### Decisions or information required

- <question, owner, and affected tasks>

## Assumptions

- **PLAN-ASM-001:** <planning assumption>
  - **Basis:** <demand statement or repository evidence>
  - **Invalidation impact:** <what changes if false>

## Executor handoff

### Recommended execution order

1. `TASK-001`
2. `TASK-002`

### Executor must preserve

- <critical behavior, compatibility requirement, or project convention>

### Executor must verify before editing

- <uncertain repository fact or prerequisite>

### Executor stop and escalate conditions

- <material condition under which implementation should pause>

### Required completion report

The executor must report:

- tasks completed
- files changed
- tests and checks run, with outcomes
- acceptance criteria satisfied
- deviations from this plan
- newly discovered risks or assumptions
- unresolved items
- rollback or migration status where applicable

## Planning completeness review

- **Requirements covered:** <count or summary>
- **Acceptance criteria covered:** <count or summary>
- **Blocked items:** <count and identifiers>
- **Unresolved decisions:** <count and identifiers>
- **Ready for executor:** Yes | Yes, with stated assumptions | No
- **Planner conclusion:** <two or three sentences>
```

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

## Quality checklist

Before completing the plan, verify:

- The selected demand source is explicit.
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

## Completion response

After creating or updating the plan, respond with only:

1. the plan file path
2. the demand source used
3. the recommended approach in one sentence
4. planning readiness
5. overall complexity and confidence
6. the number of tasks, decisions, assumptions, and blockers
7. any material issue that prevents execution

Do not implement the plan.
