# Project Context

This document explains what the project is, why it exists, who depends on it, and which boundaries and invariants must be preserved.

It is intended for developers, reviewers, architects, operators, and coding agents. Keep it focused on stable project knowledge rather than implementation details that belong in `ARCHITECTURE.md`, setup instructions that belong in `DEVELOPMENT.md`, or test procedures that belong in `TESTING.md`.

Replace every `<...>` placeholder before treating this document as authoritative. Remove sections that do not apply.

## Document status

- **Project:** <project name>
- **Status:** Draft | Active | Deprecated
- **Owners:** <team, role, or individuals>
- **Last reviewed:** <YYYY-MM-DD>
- **Review cadence:** <for example: quarterly or after major product changes>
- **Related repositories:** <repository links or names, if applicable>

## Executive summary

<Describe the project in two or three sentences. Explain what it does, who it serves, and the main outcome it provides.>

## Why this project exists

### Problem or opportunity

<Describe the underlying problem, limitation, business need, or opportunity that led to this project.>

### Intended outcome

<Describe the future state or value the project is expected to provide. Focus on outcomes rather than implementation.>

### Success indicators

Use measurable indicators where possible.

| Indicator | Target or expectation | Source |
|---|---|---|
| <indicator> | <target> | <source of measurement> |
| <indicator> | <target> | <source of measurement> |

When no formal metrics exist, state the observable signals that indicate the project is working as intended.

## Users and stakeholders

### Primary users

| User group | Need | Typical interaction |
|---|---|---|
| <user group> | <need> | <interaction> |

### Secondary users

| User group | Need | Typical interaction |
|---|---|---|
| <user group> | <need> | <interaction> |

### Stakeholders and owners

| Stakeholder or role | Responsibility | Decision authority |
|---|---|---|
| <role or team> | <responsibility> | <scope of authority> |

### Operators and support

| Role or team | Operational responsibility | Escalation path |
|---|---|---|
| <role or team> | <responsibility> | <path> |

## Core capabilities

List the stable capabilities the project provides.

### Capability 1 — <name>

- **Purpose:** <what this capability enables>
- **Primary users:** <users>
- **Inputs:** <inputs>
- **Outputs:** <outputs>
- **Important constraints:** <constraints>

### Capability 2 — <name>

- **Purpose:** <what this capability enables>
- **Primary users:** <users>
- **Inputs:** <inputs>
- **Outputs:** <outputs>
- **Important constraints:** <constraints>

Add or remove capability sections as needed.

## User journeys and business processes

Describe the most important end-to-end journeys in business terms.

### Journey 1 — <name>

1. <actor initiates action>
2. <system or process responds>
3. <decision or validation occurs>
4. <outcome is produced>

- **Successful outcome:** <outcome>
- **Important failure outcome:** <failure behavior>
- **Systems involved:** <systems>

### Journey 2 — <name>

1. <step>
2. <step>
3. <step>

- **Successful outcome:** <outcome>
- **Important failure outcome:** <failure behavior>
- **Systems involved:** <systems>

## Domain terminology

Use this glossary to keep language consistent across requirements, code, tests, documentation, and user interfaces.

| Term | Meaning | Avoid or distinguish from |
|---|---|---|
| <term> | <definition> | <confusing alternative> |
| <term> | <definition> | <confusing alternative> |

Rules:

- Prefer the terms defined here in requirements and documentation.
- Preserve legal, regulatory, contractual, or customer-facing terminology where required.
- Add new domain terms when they become stable and broadly relevant.
- Do not use internal implementation names as business terminology unless they are intentionally shared.

## System boundaries

### In scope

The project is responsible for:

- <responsibility>
- <responsibility>
- <responsibility>

### Out of scope

The project is not responsible for:

- <responsibility owned elsewhere>
- <business process outside this system>
- <integration behavior controlled by another system>

### Boundary principles

- <principle governing what belongs in this project>
- <principle governing what must remain external>
- <principle governing ownership of shared behavior>

When ownership is unclear, document the uncertainty and identify the decision owner.

## Systems and ownership

### Internal components or services

| Component or service | Responsibility | Owner | Source of truth |
|---|---|---|---|
| <component> | <responsibility> | <owner> | This project / Other system |

### External systems

| System | Relationship | Data exchanged | Source of truth | Owner |
|---|---|---|---|---|
| <system> | <integration purpose> | <data> | <system> | <owner> |

### Human or manual processes

| Process | Purpose | Owner | Project dependency |
|---|---|---|---|
| <process> | <purpose> | <owner> | <how the project depends on it> |

## Sources of truth

Document where authoritative information lives.

| Information | Authoritative source | Cached or replicated in this project | Update direction |
|---|---|---|---|
| <information> | <system or dataset> | Yes / No | Inbound / Outbound / Bidirectional |

Rules:

- Do not create a second source of truth without an explicit decision.
- Treat cached, derived, and replicated data as non-authoritative unless stated otherwise.
- Define conflict resolution for bidirectional synchronization.
- Record ownership changes when a source of truth moves.

## Data context

### Main data concepts

| Data concept | Description | Owner | Sensitivity |
|---|---|---|---|
| <concept> | <description> | <owner> | Public / Internal / Confidential / Restricted |

### Personal or sensitive data

The project processes:

- <data category or `No personal data confirmed`>

For each sensitive category, document:

| Data category | Purpose | Legal or business basis | Retention | Access |
|---|---|---|---|---|
| <category> | <purpose> | <basis> | <retention> | <roles> |

### Data lifecycle

- **Created by:** <source>
- **Validated by:** <component or process>
- **Stored in:** <system>
- **Shared with:** <systems or roles>
- **Retained for:** <duration or policy>
- **Deleted or anonymized by:** <process>

Do not place secrets, credentials, personal records, production payloads, or restricted operational details in this document.

## Critical invariants

These rules must remain true across implementation changes.

### Business invariants

- <business rule that must always hold>
- <business rule that must always hold>

### Data invariants

- <integrity rule>
- <uniqueness, ordering, lifecycle, or ownership rule>

### Security invariants

- <authorization or trust rule>
- <sensitive-data rule>

### Compatibility invariants

- <API, event, file-format, or migration guarantee>
- <backwards-compatibility expectation>

### Operational invariants

- <availability, audit, recoverability, or support rule>

Any change that would violate or redefine an invariant requires explicit review and an updated decision record.

## Constraints

### Business constraints

- <constraint>
- <constraint>

### Technical constraints

- <runtime, platform, protocol, dependency, or integration constraint>
- <constraint>

### Regulatory, legal, or contractual constraints

- <constraint or `None confirmed`>

### Organizational and process constraints

- <ownership, review, release, or operational constraint>
- <constraint>

### Time or lifecycle constraints

- <deadline, deprecation, support window, or `None confirmed`>

Clearly distinguish mandatory constraints from preferences.

## Quality expectations

Describe project-specific expectations. Detailed test procedures belong in `TESTING.md`.

| Quality attribute | Expectation | Evidence or measure |
|---|---|---|
| Reliability | <expectation> | <measure> |
| Performance | <expectation> | <measure> |
| Security | <expectation> | <measure> |
| Privacy | <expectation> | <measure> |
| Accessibility | <expectation> | <measure> |
| Maintainability | <expectation> | <measure> |
| Observability | <expectation> | <measure> |

Use `Not applicable` only after considering the attribute.

## Operational context

### Environments

| Environment | Purpose | Data classification | Change authority |
|---|---|---|---|
| Local | Development | <classification> | Developer |
| Test | <purpose> | <classification> | <authority> |
| Staging | <purpose> | <classification> | <authority> |
| Production | Live operation | <classification> | <authority> |

Remove environments that do not exist.

### Operational ownership

- **Service owner:** <team or role>
- **Technical owner:** <team or role>
- **Support owner:** <team or role>
- **Security contact:** <team or role>
- **Data owner:** <team or role>

### Support expectations

- **Support hours:** <expectation>
- **Incident channel:** <channel or process>
- **Escalation path:** <path>
- **Recovery objective:** <expectation>
- **Data recovery objective:** <expectation>

### Observability expectations

The project should provide enough evidence to answer:

- Is the system available?
- Are core journeys succeeding?
- Are integrations healthy?
- Are data flows delayed or failing?
- Are authorization or validation failures abnormal?
- Can an operator diagnose a failure without accessing sensitive data?

List project-specific dashboards, logs, metrics, traces, or alerts in operational documentation rather than embedding sensitive links here.

## Security and privacy context

### Trust boundaries

- <boundary>
- <boundary>

### Authentication

<Describe who or what authenticates and where authentication is established.>

### Authorization

<Describe the high-level authorization model and ownership of policy decisions.>

### Sensitive operations

- <operation requiring additional protection>
- <operation requiring audit or approval>

### Security review triggers

A security review is required for changes involving:

- authentication or authorization
- trust-boundary changes
- new external integrations
- new sensitive-data processing
- cryptography
- secrets or credentials
- privilege changes
- new network exposure
- data export, deletion, or retention changes

Adapt this list to project and organizational requirements.

## Dependencies and assumptions

### Critical dependencies

| Dependency | Why it matters | Failure impact | Owner |
|---|---|---|---|
| <dependency> | <reason> | <impact> | <owner> |

### Stable assumptions

- <assumption considered stable>
- <assumption considered stable>

### Assumptions requiring periodic validation

| Assumption | Validation owner | Review trigger |
|---|---|---|
| <assumption> | <owner> | <trigger> |

Do not treat an assumption as an invariant.

## Known limitations

- <limitation>
  - **Impact:** <impact>
  - **Current mitigation:** <mitigation>
  - **Owner:** <owner>
  - **Tracking reference:** <reference or `Not tracked`>

Do not use this section as a substitute for an issue tracker. Record only limitations that materially affect project understanding or planning.

## Current risks

| Risk | Likelihood | Impact | Mitigation | Owner |
|---|---|---|---|---|
| <risk> | Low / Medium / High | Low / Medium / High | <mitigation> | <owner> |

Keep detailed delivery risks in the relevant implementation plan. This section is for persistent project-level risks.

## Non-goals

The project intentionally does not aim to:

- <non-goal>
- <non-goal>

Non-goals help prevent accidental scope expansion. Review them when the product direction changes.

## Decision-making and governance

### Decision ownership

| Decision type | Owner or approver |
|---|---|
| Product behavior | <role or team> |
| Architecture | <role or team> |
| Security and privacy | <role or team> |
| Data ownership | <role or team> |
| Deployment and operations | <role or team> |
| Breaking changes | <role or team> |

### Architecture decisions

Material decisions should be recorded under `docs/adr/` when they affect:

- architectural boundaries
- public contracts
- data ownership or persistence
- security or privacy
- significant dependencies
- deployment or operational model
- long-term compatibility

### Change review triggers

Require explicit review when a change:

- alters a critical invariant
- crosses a system boundary
- introduces a breaking contract
- changes a source of truth
- adds sensitive data
- changes retention or deletion
- introduces a major dependency
- changes deployment or recovery behavior
- changes ownership or support responsibility

## Project lifecycle

- **Current lifecycle stage:** Discovery | Development | Active | Maintenance | Migration | Deprecation
- **Supported versions:** <versions or policy>
- **Compatibility window:** <policy>
- **Deprecation policy:** <policy>
- **End-of-life expectations:** <expectation>

## Documentation map

| Topic | Document |
|---|---|
| Repository overview | `README.md` |
| Project context | `docs/PROJECT_CONTEXT.md` |
| Current architecture | `docs/ARCHITECTURE.md` |
| Development workflow | `docs/DEVELOPMENT.md` |
| Testing strategy and commands | `docs/TESTING.md` |
| Security guidance | `docs/SECURITY.md` |
| Completion checklist | `docs/DEFINITION_OF_DONE.md` |
| Architecture decisions | `docs/adr/` |
| Contribution process | `CONTRIBUTING.md` |
| Agent workflow | `AGENTS.md` |
| Copilot project instructions | `.github/copilot-instructions.md` |

Remove entries that do not apply.

## Open context questions

Use this section only for unresolved project-level questions.

- **CTX-Q-001:** <question>
  - **Why it matters:** <impact>
  - **Owner:** <role or team>
  - **Target decision point:** <date, milestone, or trigger>

Do not leave resolved questions here. Convert important answers into the appropriate section.

## Maintenance checklist

Review this document when:

- the project purpose or primary users change
- a capability is added or retired
- ownership changes
- a source of truth changes
- a system boundary changes
- critical data categories change
- a new regulation or contractual constraint applies
- a critical invariant changes
- the operational model changes
- a major architectural decision is accepted
- agents repeatedly misunderstand the same project concept

During review:

- remove stale statements
- verify ownership
- verify sources of truth
- verify invariants and constraints
- resolve or update open questions
- update the last-reviewed date
- avoid adding low-level implementation detail

## Context summary for agents

Before planning or implementation, an agent should be able to answer:

- What problem does this project solve?
- Who uses and owns it?
- What capabilities does it provide?
- What is inside and outside its boundary?
- Which systems are authoritative?
- Which data is sensitive?
- Which invariants must not be violated?
- Which constraints are mandatory?
- Which project-level risks and limitations matter?
- Who can approve material changes?

If this document does not provide reliable answers, surface the gap rather than guessing.
