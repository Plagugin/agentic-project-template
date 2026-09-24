# Subagent: Document Assembly

Use this module to select the file path, assemble the final demand document, run quality checks, and produce the completion response.

## File-selection rules

Use the following precedence:

1. Use a path explicitly supplied by the user.
2. Update an existing demand document only when the user clearly refers to it.
3. When `.github/agentic-workflow-state.md` says `Local-only` or `Local-only requested`, first look for an `Active` demand with the same work item. Update it only when it is the same request; otherwise create `demands/<work-item>-<short-kebab-case-title>.md`.
4. Otherwise, create `demands/<short-kebab-case-title>.md`. Create the `demands/` directory first when it does not yet exist.

Never automatically select a demand whose lifecycle is `Completed`, `Abandoned`, or `Superseded`. When several active local-only demands match the work item or branch, ask the user to select one.

Never overwrite an unrelated existing document. If the default path is occupied by unrelated content, create a uniquely named file instead and report the chosen path.

Do not create `demand.md` or any other demand document directly at the project root. All demand documents belong under `demands/`.

## Document formats

Read `.github/workflow-profiles.md`. Use the Compact format unless the confirmed profile is Extended. Do not copy the source prompt into multiple sections.

### Compact demand

Target 250–600 words. Omit optional rows that do not apply.

```markdown
# Demand: <concise title>

- **Status:** Draft | Ready for planning | Needs clarification
- **Readiness:** Ready | Ready with assumptions | Blocked
- **Workflow profile:** Compact
- **Classification:** Provisional
- **Classified by:** demand-intake
- **Selection source:** Agent-recommended | User-selected
- **Basis:** <one direct sentence>
- **Extended triggers:** None confirmed | <suspected trigger requiring planner verification>
- **Source:** <prompt or discussion>
- **Work item:** <identifier>
- **Source branch:** <branch>
- **Base branch:** <branch or `Not yet confirmed`>
- **Artifact scope:** Local-only cross-branch
- **Lifecycle:** Active

## Problem and outcome

- **Problem:** <one or two direct sentences>
- **Outcome:** <observable future state>
- **Affected users:** <actors or `Internal only`>

## Scope

| In | Out |
|---|---|
| <included outcome> | <explicit exclusion> |

## Requirements and acceptance

| ID | Requirement | Acceptance |
|---|---|---|
| FR-001 / AC-001 | <observable required behavior> | <verifiable success condition> |

## Constraints

- `CON-001` — <mandatory boundary and source>

## Assumptions and questions

| ID | Type | Detail | Impact |
|---|---|---|---|
| ASM-001 | Assumption | <detail> | <impact if false> |
| Q-001 | Question | <detail> | <impact if unresolved> |

## Evidence and handoff

- `<path>` — <relevant repository fact>
- **Planner focus:** <decision or investigation that matters>
- **Do not assume:** <important boundary>
```

### Extended demand

Use this when an Extended trigger is confirmed. Keep sections factual and omit irrelevant optional subsections.

```markdown
# Demand: <concise title>

## Status

- **Status:** Draft | Ready for planning | Needs clarification
- **Readiness:** Ready | Ready with assumptions | Blocked
- **Workflow profile:** Extended
- **Classification:** Provisional
- **Classified by:** demand-intake
- **Selection source:** Agent-recommended | User-selected
- **Basis:** <why Extended is required>
- **Extended triggers:** <confirmed triggers>
- **Source:** <prompt or discussion>
- **Work item:** <identifier>
- **Source branch:** <branch>
- **Base branch:** <branch or `Not yet confirmed`>
- **Artifact scope:** Local-only cross-branch
- **Lifecycle:** Active

## Problem, impact, and outcome

- **Problem:** <current limitation or opportunity>
- **Impact:** <affected actors, systems, or operations>
- **Outcome:** <observable future state>

## Users and stakeholders

| Actor | Need or responsibility | Certainty |
|---|---|---|
| <actor> | <need> | Confirmed / Assumed / Unknown |

## Scope

| In scope | Out of scope |
|---|---|
| <included capability> | <explicit exclusion> |

## Requirements

| ID | Type | Requirement |
|---|---|---|
| FR-001 | Functional | <observable behavior> |
| NFR-001 | Quality | <security, performance, reliability, accessibility, or operational need> |
| CON-001 | Constraint | <mandatory boundary and source> |

## Acceptance criteria

| ID | Requirement links | Verifiable condition |
|---|---|---|
| AC-001 | FR-001 | <success condition> |

## Assumptions, questions, dependencies, and risks

| ID | Type | Detail | Owner or response |
|---|---|---|---|
| ASM-001 | Assumption | <detail and basis> | <impact if false> |
| Q-001 | Question | <material unknown> | <owner> |
| DEP-001 | Dependency | <dependency> | <required state> |
| RISK-001 | Risk | <risk> | <mitigation or planning need> |

## Evidence and source notes

- `<path>` — <fact and relevance>
- <important source statement, contradiction, or preference>

## Planner handoff

- **Planning focus:** <material decisions and investigations>
- **Do not assume:** <unresolved boundaries>
- **Feedback reports:** <paths or `None open`>
- **Readiness:** <one or two direct sentences>
```

Include the work-item, branch, artifact-scope, and lifecycle rows only when the workflow state is `Local-only` or `Local-only requested`.

## Quality checks

Before completing the document, verify all of the following:

- The demand can be understood without rereading the raw brainstorm.
- The workflow profile follows `.github/workflow-profiles.md`.
- The classification basis and any Extended trigger are explicit.
- The problem and desired outcome are distinct.
- Scope and non-goals are explicit.
- Requirements describe outcomes, not implementation.
- Acceptance criteria are observable and traceable.
- Facts, assumptions, preferences, and open questions are clearly separated.
- Repository evidence includes paths and is not misrepresented as user intent.
- No architecture or code-level plan has been introduced.
- The planner handoff identifies what must be investigated next.
- Local-only demands have a stable work item, source branch, base branch, artifact scope, lifecycle, and work-item-prefixed filename.
- The document does not contain fabricated details.
- Compact documents do not repeat the same fact across narrative, tables, and handoff sections.
- Task or implementation detail has not been added merely to make the demand look complete.
- Any open `feedback/` report relevant to this demand is reflected, not silently ignored.

If intake itself surfaces an action only a human can perform before planning can meaningfully begin (for example, obtaining access to a system needed to confirm scope), create a human action request under `feedback/` using `feedback/human-action-template.md` and reference it from the demand.

## Completion response

After creating or updating the document, respond with only:

1. the file path
2. the workflow profile and classification basis
3. a one-sentence summary of the captured demand
4. the readiness assessment
5. the number of assumptions and open questions
6. any material issue that prevents planning, and the path to any `feedback/` report created

When Direct was confirmed and the user chose to skip the demand file, respond with only:

1. `Workflow profile: Direct`
2. the classification basis
3. `Demand file: Not created`
4. the recommended direct next action

Do not include an implementation proposal, architecture recommendation, or code.
