# Architecture Decision Records

This directory contains Architecture Decision Records (ADRs) for significant technical decisions made in this project.

ADRs explain not only what was decided, but also why the decision was made, which alternatives were considered, and what consequences follow from it.

## When to create an ADR

Create an ADR when a decision is:

- architecturally significant
- difficult or expensive to reverse
- cross-cutting across several components or teams
- related to security, privacy, data ownership, or compliance
- likely to affect public contracts, integrations, deployment, or operations
- likely to be questioned later
- based on important constraints that are not obvious from the code

Typical examples:

- choosing a database, framework, protocol, or messaging system
- introducing or removing a service
- changing an API or event-versioning strategy
- changing authentication or authorization architecture
- defining a source-of-truth system
- selecting a migration, deployment, or rollback strategy
- establishing a major dependency or architectural boundary
- accepting an important technical trade-off

Do not create an ADR for ordinary, local, and easily reversible implementation details.

Examples that usually do not require an ADR:

- naming a private helper
- choosing a local collection type
- reorganizing one small function
- applying an established project pattern
- making a low-risk internal refactor

A useful rule is:

> Create an ADR when a future developer or agent is likely to ask, “Why did we choose this?”

## File naming

Use the following format:

```text
NNNN-short-kebab-case-title.md
```

Examples:

```text
0001-use-postgresql-for-transactional-data.md
0002-adopt-openid-connect-for-authentication.md
0003-use-outbox-pattern-for-event-publication.md
```

Use the next available number. Do not renumber existing ADRs.

## ADR lifecycle

Recommended statuses:

- **Proposed** — under discussion
- **Accepted** — approved and intended to be followed
- **Rejected** — considered but not selected
- **Superseded** — replaced by a newer ADR
- **Deprecated** — no longer recommended, but not yet fully removed
- **Withdrawn** — proposal abandoned before acceptance

When a decision changes:

- do not rewrite the old ADR to make history appear different
- create a new ADR
- mark the old ADR as superseded
- link both documents

Minor corrections such as typos, broken links, or clarification that does not change the decision may be edited in place.

## Creating an ADR

1. Copy `0000-template.md`.
2. Rename it using the next available number and a concise title.
3. Describe the context and decision drivers.
4. Record realistic options.
5. State the decision clearly.
6. Document positive and negative consequences.
7. Identify follow-up work and review conditions.
8. Request the required review or approval.
9. Update the status when a decision is made.

Example:

```sh
cp docs/adr/0000-template.md   docs/adr/0001-use-postgresql-for-transactional-data.md
```

## Writing guidance

A good ADR is:

- concise
- specific
- understandable without reading the full implementation
- honest about trade-offs
- explicit about constraints
- clear about consequences
- linked to relevant requirements, plans, issues, or documentation

Avoid:

- presenting only the selected option
- manufacturing unrealistic alternatives
- hiding negative consequences
- embedding implementation task lists
- copying large amounts of source code
- including secrets or sensitive operational details
- treating an ADR as immutable architecture documentation

An ADR records a decision. `docs/ARCHITECTURE.md` should describe the current implemented architecture.

## Review expectations

The appropriate reviewers depend on the decision.

| Decision area | Suggested reviewer |
|---|---|
| Product behavior | Product owner |
| Architecture | Technical lead or architect |
| Security and privacy | Security or privacy owner |
| Data ownership | Data owner |
| Operations and deployment | Platform or operations owner |
| Public contracts | API or integration owner |

Use the project’s actual ownership and review process.

## Traceability

Where useful, link the ADR to:

- a demand in `demands/`
- an implementation plan in `plans/`
- an issue or ticket
- a pull request
- related ADRs
- architecture documentation
- security or threat-model documentation

Likewise, update relevant documentation to reference accepted ADRs.

## Use by coding agents

Coding agents should:

- inspect applicable accepted ADRs before proposing material architectural changes
- preserve accepted decisions unless the current task explicitly revisits them
- identify conflicts between a requested change and an accepted ADR
- recommend a new ADR when a material decision is required
- avoid silently replacing an existing architectural decision

Coding agents should not:

- treat every local implementation choice as an ADR
- rewrite decision history
- mark an ADR accepted without the required approval
- infer that a proposed ADR is authoritative
- expose restricted security details in a broadly visible ADR

## Index

Add accepted and active ADRs here when useful.

| ADR | Title | Status |
|---|---|---|
| `0000-template.md` | ADR template | Template |

For a large project, maintain this table or generate an index through the repository’s documentation workflow.
