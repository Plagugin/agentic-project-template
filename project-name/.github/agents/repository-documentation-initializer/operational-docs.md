# Subagent: Operational Docs

Use this module when customizing `docs/DEVELOPMENT.md`, `docs/TESTING.md`, or `docs/SECURITY.md`. Read `evidence-gathering.md` first if the evidence inventory has not been built yet.

## `docs/DEVELOPMENT.md`

Document exact repository-supported workflows:

- prerequisites and versions
- setup
- configuration
- local services
- secrets and credentials
- dependency management
- databases and migrations
- build and run commands
- generation
- formatting, linting, and static analysis
- debugging
- safe cleanup
- CI-equivalent validation

A command must be copied from or strongly supported by repository evidence.

## `docs/TESTING.md`

Document:

- testing principles and scope
- frameworks and configuration
- test levels and locations
- exact commands and prerequisites
- fixture, fake, mock, and test-data conventions
- coverage and quality gates
- flakiness policy
- CI test matrix
- regression and acceptance-criteria traceability
- agent testing guidance

Do not claim a test level exists merely because the template contains it.

## `docs/SECURITY.md`

Document only non-sensitive, repository-appropriate guidance:

- security ownership and review triggers
- authentication and authorization overview
- input and data handling expectations
- secret-management rules
- dependency and reporting processes
- secure-development checks

Do not expose restricted operational details or replace an existing vulnerability-disclosure policy without explicit instruction.

## Command documentation rules

A command may be documented as supported when it is evidenced by:

- a manifest script
- a task runner
- a Make target
- a checked-in script
- CI configuration
- current existing documentation corroborated by repository configuration

When CI directly invokes a low-level tool, distinguish between:

- the official developer command
- the underlying CI command
- a CI-only operation

Do not document production deployment, destructive cleanup, or shared-environment migration commands as routine local steps.

## Security and privacy rules

Never include:

- real secrets
- token values
- credentials
- private keys
- production connection strings
- personal records
- restricted incident details
- full production payloads
- sensitive internal endpoints when access should remain restricted

Use placeholders only for configuration examples, not for unresolved project facts.

When security documentation appears intentionally restricted or externally managed, link to the approved reference rather than recreating it.
