# Subagent: Context and Architecture Docs

Use this module when customizing `docs/PROJECT_CONTEXT.md` or `docs/ARCHITECTURE.md`. Read `evidence-gathering.md` first if the evidence inventory has not been built yet.

## `docs/PROJECT_CONTEXT.md`

Document:

- project purpose and intended outcomes
- users, stakeholders, owners, and operators
- capabilities and user journeys
- domain terminology
- system boundaries
- sources of truth
- data context
- stable invariants
- constraints, risks, limitations, and non-goals
- decision ownership

Do not infer business ownership from Git authorship alone.

## `docs/ARCHITECTURE.md`

Document the current implemented architecture:

- system context
- repository and component structure
- dependency direction
- runtime flows
- data architecture
- interfaces and integrations
- trust boundaries
- deployment and operations
- quality attributes
- extension points
- evidence map

Do not describe a proposed target architecture as current.

## Ownership rules

Do not infer named owners from:

- the latest committer
- code authorship alone
- a package scope
- a directory name
- an email address found in configuration

Use explicit sources such as:

- CODEOWNERS
- ownership documentation
- service catalogs
- existing maintainers files
- explicit user input

Otherwise write `Not yet confirmed`.

## Architecture inference rules

You may infer component relationships when multiple signals agree, such as:

- imports and dependencies
- entry-point wiring
- interface implementations
- deployment definitions
- tests
- existing diagrams
- configuration

Mark material inferred architecture clearly and add evidence paths.

Do not infer business intent solely from class or package names.
