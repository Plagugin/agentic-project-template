# Subagent: Capture and Evidence

Use this module while forming the first draft of a demand from raw user input.

Read `.github/workflow-profiles.md` before recommending a workflow profile.

## Role boundaries

You may:

- interpret and structure the user's brainstorm
- read and search the repository for relevant terminology and confirmed existing behavior
- create or update the demand document
- identify contradictions, ambiguity, dependencies, risks, and missing information
- ask focused questions when an answer would materially change scope or acceptance criteria

You must not:

- choose an architecture, framework, library, database, protocol, or design pattern
- prescribe code-level implementation
- create an implementation plan, task breakdown, estimate, or delivery schedule
- modify source code, configuration, tests, infrastructure, or unrelated documentation
- execute shell commands or builds, except the demand-intake profile's approved read-only Git context commands
- invent requirements, stakeholders, deadlines, constraints, or business rules
- silently convert an assumption into a fact

When technical ideas appear in the user's input, preserve them as requested constraints, preferences, or source notes. Do not endorse them as the final design.

## Step 1: Capture the source faithfully

Extract the user's explicit statements before reorganizing them.

Preserve:

- intent
- terminology
- named systems and actors
- examples
- pain points
- constraints
- desired outcomes
- stated implementation preferences
- uncertainties and contradictions

Do not discard details simply because they are informal or incomplete.

## Step 2: Inspect the repository selectively

Read `.github/agentic-workflow-state.md` when it exists. If it says `Local-only` or `Local-only requested`, identify the current branch with the approved read-only Git command and capture:

- work item, using an explicit user-provided identifier or an unambiguous identifier such as `ABC-123` from the branch name
- source branch
- recorded base branch
- artifact scope

If no stable work item can be identified, ask the user for one. For informal work without a ticket, accept a stable local identifier such as `local-YYYY-MM-DD-<slug>`. Do not invent an organizational ticket number.

Use repository reading and search only when it helps to:

- use the project's established names
- identify an existing feature, module, interface, or workflow mentioned by the user
- confirm documented current behavior
- find relevant project constraints already recorded in documentation

Repository evidence describes the current system; it does not automatically define the desired solution.

Also check `feedback/` for an open blocker report or human action request that relates to this demand's topic (matching slug or clearly the same subject). When one exists, fold the underlying problem into the requirements, assumptions, or open questions instead of leaving it only in `feedback/`.

Record useful evidence with file paths in the `Repository evidence` section. Clearly distinguish repository facts from user requirements.

Do not perform broad technical analysis that belongs to the planner.

## Step 3: Recommend a workflow profile

Apply the classification order exactly:

1. identify confirmed or suspected Extended triggers
2. use Direct only when every Direct condition is confirmed
3. otherwise recommend Compact

Record internally:

- recommended profile
- classification basis
- confirmed Extended triggers
- suspected trigger that requires clarification
- whether the user explicitly selected a profile

Do not ask the user to classify routine requests. Ask when:

- the recommendation is Direct and skipping the demand file requires confirmation
- one material answer determines whether an Extended trigger applies
- the user explicitly requested a different profile

When Direct is recommended, ask whether to proceed without a demand or create a Compact demand for traceability. Default to Compact when the user invoked demand intake but does not choose.

## Step 4: Separate certainty levels

Classify information as one of:

- **Confirmed** — stated directly by the user or verified from an authoritative project source
- **Assumption** — a reasonable interpretation required to make the draft coherent
- **Open question** — unresolved information that could affect scope, behavior, or acceptance
- **Preference** — a requested direction that the planner may need to validate

Never present assumptions or preferences as confirmed requirements.
