# Subagent: Document Assembly

Use this module to select the file path, assemble the final demand document, run quality checks, and produce the completion response.

## File-selection rules

Use the following precedence:

1. Use a path explicitly supplied by the user.
2. Update an existing demand document only when the user clearly refers to it.
3. Otherwise, create `demands/<short-kebab-case-title>.md`. Create the `demands/` directory first when it does not yet exist.

Never overwrite an unrelated existing document. If the default path is occupied by unrelated content, create a uniquely named file instead and report the chosen path.

Do not create `demand.md` or any other demand document directly at the project root. All demand documents belong under `demands/`.

## Required document format

Use this structure. Omit a subsection only when it is genuinely irrelevant; do not omit required top-level sections.

```markdown
# Demand: <concise title>

## Document status

- **Status:** Draft | Ready for planning | Needs clarification
- **Readiness:** Ready | Ready with assumptions | Blocked by material questions
- **Source:** <brief description of the originating prompt or discussion>

## Executive summary

<One short paragraph describing the demand and intended outcome in plain language.>

## Context and problem

### Background

<Relevant context and why this demand exists.>

### Problem statement

<A precise description of the current problem, limitation, or opportunity.>

### Impact

<Who or what is affected and how. Use `Not yet confirmed` where necessary.>

## Desired outcome

<Describe the observable future state without prescribing the technical solution.>

## Users and stakeholders

| Actor | Need or responsibility | Status |
|---|---|---|
| <actor> | <need/responsibility> | Confirmed / Assumed / Unknown |

## Scope

### In scope

- <included outcome or capability>

### Out of scope and non-goals

- <explicit exclusion>
- <items that must not be inferred as part of this demand>

## Requirements

### Functional requirements

- **FR-001 — <title>:** <observable required behavior>

### Quality and non-functional requirements

- **NFR-001 — <title>:** <quality, performance, security, accessibility, reliability, or operational expectation>

### Business and process requirements

- <requirement, or `None confirmed`>

## Constraints and preferences

### Constraints

- **CON-001 — <title>:** <mandatory boundary and its source>

### Preferences for planner validation

- <requested direction that is not yet a mandatory constraint>

## Acceptance criteria

- **AC-001** (`FR-001`): <specific, verifiable success condition>

## Assumptions

- **ASM-001:** <assumption and why it was needed>

## Open questions

- **Q-001:** <material unresolved question>
  - **Why it matters:** <effect on scope, behavior, or acceptance>
  - **Suggested owner:** <user, product owner, architect, security, operations, or unknown>

## Dependencies and risks

### Dependencies

- <known dependency or `None confirmed`>

### Risks

- <requirement-level risk or `None identified at intake`>

### Related feedback reports

- `feedback/<slug>-blocker.md` — <one line, or `None open`>
- `feedback/<slug>-human-action.md` — <one line, or `None open`>

## Repository evidence

- `<relative/path>` — <fact confirmed by this source and why it is relevant>
- `No repository evidence used` when no inspection was needed

## Source notes and traceability

- <important original statement or faithful paraphrase>
- <contradictions or alternative interpretations that must be preserved>

## Planner handoff

### Planning focus

- <the key questions the planner should resolve>

### Do not assume

- <important boundaries or unresolved points>

### Readiness assessment

<Explain in two or three sentences whether planning can begin and what remains unresolved.>
```

## Quality checks

Before completing the document, verify all of the following:

- The demand can be understood without rereading the raw brainstorm.
- The problem and desired outcome are distinct.
- Scope and non-goals are explicit.
- Requirements describe outcomes, not implementation.
- Acceptance criteria are observable and traceable.
- Facts, assumptions, preferences, and open questions are clearly separated.
- Repository evidence includes paths and is not misrepresented as user intent.
- No architecture or code-level plan has been introduced.
- The planner handoff identifies what must be investigated next.
- The document does not contain fabricated details.
- Any open `feedback/` report relevant to this demand is reflected, not silently ignored.

If intake itself surfaces an action only a human can perform before planning can meaningfully begin (for example, obtaining access to a system needed to confirm scope), create a human action request under `feedback/` using `feedback/human-action-template.md` and reference it from the demand.

## Completion response

After creating or updating the document, respond with only:

1. the file path
2. a one-sentence summary of the captured demand
3. the readiness assessment
4. the number of assumptions and open questions
5. any material issue that prevents planning, and the path to any `feedback/` report created

Do not include an implementation proposal, architecture recommendation, or code.
