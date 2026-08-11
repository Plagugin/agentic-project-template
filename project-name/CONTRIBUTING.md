# Contributing

Thank you for contributing to this project.

This guide explains how to propose, implement, validate, review, and deliver changes. It is the contributor-facing entry point for the repository and should remain concise enough to navigate easily.

Detailed project knowledge and procedures live in the referenced documents.

Replace every `<...>` placeholder before treating this document as authoritative. Remove sections that do not apply.

## Document status

- **Project:** <project name>
- **Maintainers:** <team, role, or individuals>
- **Last reviewed:** <YYYY-MM-DD>
- **Primary contribution model:** Internal | Open source | Partner collaboration | Mixed
- **Issue tracker:** <reference>
- **Repository:** <reference>

## Read first

Before contributing, read the documents relevant to your change:

- `README.md` — repository overview
- `docs/PROJECT_CONTEXT.md` — purpose, users, boundaries, and terminology
- `docs/ARCHITECTURE.md` — current architecture and technical constraints
- `docs/DEVELOPMENT.md` — setup, build, run, and local workflows
- `docs/TESTING.md` — testing strategy and commands
- `docs/SECURITY.md` — secure-development expectations
- `docs/DEFINITION_OF_DONE.md` — completion criteria
- `AGENTS.md` — instructions for coding agents
- `.github/copilot-instructions.md` — repository-wide Copilot guidance
- `demands/` — structured demand documents
- `plans/` — implementation plans
- `docs/adr/` — accepted architecture decisions

Remove references to files that do not exist.

## Ways to contribute

Contributions may include:

- feature development
- defect corrections
- tests
- documentation
- performance improvements
- accessibility improvements
- dependency maintenance
- migrations
- security improvements
- developer-experience improvements
- operational improvements
- architecture decision records

Do not begin substantial work until the intended outcome and ownership are clear.

## Code of conduct

Contributors must follow:

- <code-of-conduct reference>
- <organization collaboration policy>
- <community guidelines>

Use `Not applicable` when the project has no formal code of conduct.

## Security vulnerabilities

Do not report security vulnerabilities through ordinary public issues, discussions, or pull requests.

Use the approved reporting process:

- **External reporting:** <root SECURITY.md or reporting URL>
- **Internal reporting:** <approved internal process>
- **Emergency escalation:** <role or managed process>

Do not include secrets, exploit details, production data, or personal information in public channels.

## Contribution workflow

The standard workflow is:

1. Understand the problem and expected outcome.
2. Confirm scope, ownership, and acceptance criteria.
3. Read applicable project instructions and documentation.
4. Inspect the current implementation and tests.
5. Create or review a plan for substantial work.
6. Make the smallest coherent change.
7. Add or update tests.
8. Run targeted validation.
9. Run broader practical validation.
10. Review the final diff.
11. Update documentation.
12. Prepare the change for review.
13. Address review findings.
14. Complete required release, migration, or operational steps.

## Before starting work

### Confirm the request

Clarify:

- the problem being solved
- affected users or systems
- required behavior
- non-goals
- constraints
- acceptance criteria
- compatibility requirements
- security, privacy, or data implications
- migration or rollout needs
- decision owner

For substantial or ambiguous work, use a structured demand and implementation plan.

### Check existing work

Search for:

- existing issues
- active branches or pull requests
- related implementation plans
- accepted ADRs
- existing utilities and abstractions
- similar tests
- known limitations
- deprecation or migration work

Avoid duplicating active work.

### Obtain approval where required

Approval may be required before implementing:

- breaking changes
- architecture changes
- new services or data stores
- major dependencies
- security-sensitive changes
- new personal or sensitive data
- schema or migration changes
- public API or event changes
- production infrastructure changes
- significant operational cost

## Development setup

Follow `docs/DEVELOPMENT.md`.

The quick-start workflow is:

```sh
<setup command>
<dependency installation command>
<local run command>
```

Run the fastest project checks:

```sh
<format check command>
<lint command>
<type-check command>
<fast test command>
```

Run CI-equivalent validation when practical:

```sh
<CI-equivalent command>
```

Do not invent alternative commands when repository-supported scripts exist.

## Branches

### Branch naming

Use:

```text
<branch naming convention>
```

Examples:

```text
feature/short-description
fix/short-description
docs/short-description
chore/short-description
```

Adapt examples to the project’s actual convention.

### Branch rules

- Start from the approved base branch.
- Keep branches focused on one coherent change.
- Avoid mixing unrelated work.
- Keep the branch current according to the project’s merge strategy.
- Do not rewrite shared branch history without coordination.
- Do not include local configuration, secrets, generated clutter, or unrelated files.

## Commits

### Commit messages

Use:

```text
<commit convention>
```

Example:

```text
type(scope): concise description
```

Common types:

- `feat`
- `fix`
- `docs`
- `test`
- `refactor`
- `perf`
- `build`
- `ci`
- `chore`

Only use a convention the project has adopted.

### Commit guidance

A good commit:

- represents one coherent change
- explains intent
- includes relevant tests
- avoids unrelated formatting
- does not contain secrets
- preserves repository integrity
- can be reviewed independently where practical

Do not create commits unless the current workflow or user explicitly requests them.

## Scope and change discipline

Contributions should:

- implement only the approved outcome
- preserve architecture and project conventions
- prefer the smallest coherent solution
- reuse existing capabilities
- avoid speculative abstractions
- preserve compatibility unless a breaking change is approved
- include necessary tests and documentation
- expose assumptions and limitations

Do not include:

- unrelated refactoring
- broad cleanup
- unrequested modernization
- unrelated dependency upgrades
- formatting outside the touched area
- hidden product changes
- undocumented security exceptions
- generated files produced through an unsupported process

Record useful out-of-scope findings separately.

## Coding standards

Follow the nearest established project conventions.

At minimum:

- use clear and descriptive names
- keep functions and modules focused
- preserve dependency direction
- handle expected failures explicitly
- validate untrusted input at the correct boundary
- avoid unnecessary public surface area
- keep configuration external where appropriate
- use existing logging patterns
- avoid logging sensitive data
- remove temporary debugging code
- avoid broad warning suppressions
- write comments that explain intent, constraints, or non-obvious decisions
- update documentation when behavior changes

Project-specific conventions:

| Concern | Convention |
|---|---|
| Formatting | <tool and command> |
| Linting | <tool and command> |
| Type checking | <tool and command> |
| Naming | <convention> |
| Error handling | <convention> |
| Logging | <convention> |
| Configuration | <convention> |
| Documentation | <convention> |

## Testing

Follow `docs/TESTING.md`.

Every behavioral change should include appropriate validation.

Consider:

- unit tests
- component or module tests
- integration tests
- contract tests
- end-to-end tests
- migration tests
- security tests
- accessibility tests
- performance tests
- manual verification

Requirements:

- add regression coverage for corrected defects when practical
- test important success and failure behavior
- test authorization and validation boundaries
- use synthetic and safe test data
- preserve deterministic behavior
- inspect snapshot and golden-file changes
- do not weaken tests merely to obtain a pass
- report tests not run and explain why
- never claim a test passed unless it actually ran successfully

Common commands:

```sh
<targeted test command>
<full test command>
<coverage command>
```

## Documentation

Update the authoritative documentation when a change affects:

- user behavior
- project terminology
- architecture
- APIs, events, or schemas
- configuration
- local development
- testing
- security or privacy
- migrations
- deployment
- operations
- troubleshooting
- known limitations

Documentation must:

- describe implemented behavior only
- use repository-relative links
- contain executable and current commands
- avoid secrets and sensitive production data
- preserve established terminology
- identify assumptions and unresolved questions
- avoid duplicating large sections already maintained elsewhere

## Architecture decisions

Create or update an ADR when a decision is:

- significant
- difficult to reverse
- cross-cutting
- security- or data-sensitive
- likely to affect public contracts or deployment
- likely to be questioned later

Use:

```text
docs/adr/NNNN-short-title.md
```

Follow `docs/adr/README.md`.

Do not create ADRs for ordinary, local, and easily reversible implementation details.

## Dependencies

Before adding or changing a dependency:

1. Confirm it is necessary.
2. Search for existing project functionality.
3. Consider standard-library capabilities.
4. Check runtime and platform compatibility.
5. Review maintenance and security posture.
6. Review licensing requirements.
7. Add it through the project’s supported package manager.
8. Update the correct manifest and lockfile.
9. Add relevant tests.
10. Document operational or configuration impact.

Do not include unrelated dependency upgrades.

## Generated files

Generated artifacts must follow the documented workflow.

| Generated output | Source | Command |
|---|---|---|
| `<path>` | `<path>` | `<command>` |

Rules:

- modify the source definition
- use the approved generator version
- run the documented generation command
- review generated diffs
- do not manually patch generated output unless explicitly allowed
- do not regenerate unrelated artifacts

## APIs, events, and contracts

For changes to public or shared contracts:

- identify producers and consumers
- confirm compatibility requirements
- update the source schema
- preserve error semantics unless intentionally changed
- update generated clients through supported workflows
- add contract or integration tests
- document versioning and deprecation
- define rollout order
- define migration responsibilities
- obtain approval for breaking changes

Do not silently introduce a breaking contract.

## Data and migrations

For changes involving persisted data:

- confirm data ownership and source of truth
- preserve integrity
- define compatibility during rollout
- make migrations deterministic
- consider partial failure and restart behavior
- test representative and edge-case data
- define rollback or forward recovery
- document deployment ordering
- obtain explicit approval for destructive changes
- never run migrations against shared or production-like environments without authorization

## Security and privacy

Follow `docs/SECURITY.md`.

Security review is generally required for:

- authentication changes
- authorization changes
- trust-boundary changes
- new external exposure
- new integrations
- new sensitive data
- cryptography
- secret management
- privileged functionality
- tenant isolation
- file or parser processing
- major dependencies
- data export, deletion, or retention changes

Contributors must:

- preserve least privilege
- validate untrusted input
- use safe output handling
- avoid custom cryptography
- protect secrets
- avoid sensitive logging
- add negative authorization tests
- use approved credential mechanisms
- avoid production data in development and testing
- document residual security and privacy risks

## Accessibility

For user-facing interfaces:

- preserve semantic structure
- support keyboard interaction
- preserve visible focus
- label controls and errors
- avoid color-only indicators
- meet the project’s contrast expectations
- support zoom and responsive behavior
- test critical journeys with assistive technology when required
- run available automated accessibility checks

Document intentional exceptions and obtain the required approval.

## Performance and reliability

Consider performance and reliability when a change affects:

- critical request paths
- database access
- caching
- background jobs
- network calls
- memory or CPU use
- concurrency
- startup time
- build size
- throughput
- storage growth

Where relevant:

- establish a baseline
- define the expected workload
- run representative benchmarks
- test timeouts and retries
- verify idempotency
- consider partial failure
- add monitoring or diagnostics
- document known limitations

## Configuration and feature flags

Configuration changes must:

- use the project’s approved configuration mechanism
- define safe defaults
- validate required values
- keep secrets separate
- document environment differences
- update examples
- define failure behavior

Feature flags must include:

- owner
- default state
- rollout purpose
- supported states
- test coverage
- removal condition
- expiry or review trigger for temporary flags

Security controls must not be casually disabled through ordinary feature flags.

## Observability and operations

Runtime changes should consider:

- logs
- metrics
- traces
- audit records
- health checks
- readiness checks
- alerts
- dashboards
- support diagnostics
- runbooks
- capacity
- operational ownership

Logs and telemetry must not expose secrets or unnecessary sensitive data.

## Definition of Done

Before requesting review, verify the applicable criteria in `docs/DEFINITION_OF_DONE.md`.

At minimum:

- the requested behavior is implemented
- scope is controlled
- tests are present
- validation has run
- security and privacy were considered
- documentation is current
- migration and rollout implications are addressed
- the final diff was reviewed
- unresolved risks are visible
- no unsupported claim of completion is made

## Pull requests

### Pull-request title

Use:

```text
<title convention>
```

### Pull-request description

Include:

```markdown
## Summary

<What changed and why?>

## Scope

- <included>
- <excluded>

## Requirements or issue

- <reference>

## Implementation

- <important design or implementation notes>

## Validation

- `<command>` — Passed
- `<command>` — Not run: <reason>

## Acceptance criteria

- `AC-001` — <evidence>

## Security and privacy

- <impact or No material impact identified>

## Data, migration, and compatibility

- <impact or Not applicable>

## Rollout and rollback

- <details or Not applicable>

## Documentation

- <updated files or None required>

## Risks and follow-up

- <risk or None>
```

### Pull-request size

Prefer a reviewable, coherent change.

Split work when:

- independent behavior can be delivered separately
- several unrelated components change
- architecture and implementation should be reviewed separately
- migrations need staged rollout
- the change is too large to validate confidently
- an ADR or demand should be reviewed before implementation

Do not split a change so narrowly that intermediate states become unsafe or untestable.

## Review process

Reviewers should verify:

- the change solves the intended problem
- scope is appropriate
- architecture and conventions are preserved
- tests protect the behavior
- security and privacy are addressed
- compatibility is intentional
- migrations are safe
- operational impact is understood
- documentation is accurate
- validation evidence is credible
- risks and limitations are visible

Authors should:

- respond constructively
- explain decisions
- update code and documentation together
- avoid resolving comments without addressing them
- request clarification when feedback conflicts
- rerun affected validation after changes

## Required reviewers

| Change area | Required reviewer |
|---|---|
| Product behavior | <role or team> |
| Architecture | <role or team> |
| Security and privacy | <role or team> |
| Data and migrations | <role or team> |
| Deployment and operations | <role or team> |
| Public contracts | <role or team> |
| Documentation | <role or team> |

Use the repository’s actual ownership rules.

## Review status

A change is ready to merge only when:

- required reviewers approved it
- required checks pass
- unresolved conversations are addressed
- required documentation is updated
- migrations and rollout are approved
- security or privacy review is complete where required
- the Definition of Done is satisfied
- known limitations are accepted by the appropriate owner

## Merge strategy

Use:

- Merge commit | Squash merge | Rebase merge | Project-specific

Rules:

- <rule>
- <rule>
- <rule>

Do not merge without the required authorization.

## Release and deployment

Follow the project’s release and operational procedures.

Before release:

- required CI checks pass
- artifacts are built through the approved workflow
- compatibility is confirmed
- migrations are rehearsed where required
- configuration and secrets are available
- rollout and rollback are defined
- smoke tests are prepared
- monitoring is ready
- release notes are current
- support owners are informed where required

Do not deploy or publish merely because a pull request was merged.

## Backporting and supported versions

Use this section when the project maintains several versions.

- **Supported versions:** <policy>
- **Backport criteria:** <criteria>
- **Branch naming:** <pattern>
- **Release ownership:** <owner>
- **Security-fix policy:** <policy>

Do not backport behavior that depends on unavailable architecture without review.

## Issue and task quality

A useful issue or task should include:

- problem statement
- users or systems affected
- expected outcome
- known constraints
- non-goals
- acceptance criteria
- examples
- relevant evidence
- security, privacy, data, and compatibility considerations
- ownership
- dependencies

Use the demand-intake workflow for rough or incomplete ideas.

## Working with coding agents

Coding agents must follow:

- `AGENTS.md`
- `.github/copilot-instructions.md`
- applicable nested instruction files
- project documentation
- accepted ADRs
- approved demand and implementation plan

Use agents according to role:

- **Demand intake:** structure rough ideas into a demand document
- **Technical planner:** analyze the repository and produce an implementation plan
- **Plan executor:** implement approved tasks and validate them
- **Documentation initializer:** customize project documentation templates

Human review remains required for material product, architecture, security, data, and operational decisions.

Do not assume an agent’s confident output is evidence. Verify repository claims and validation results.

## Contributor checklist

Before requesting review:

- [ ] I understand the requested outcome.
- [ ] I followed applicable instructions.
- [ ] I kept the change within scope.
- [ ] I preserved unrelated behavior and existing work.
- [ ] I followed project architecture and conventions.
- [ ] I added or updated relevant tests.
- [ ] I ran targeted validation.
- [ ] I ran broader practical validation.
- [ ] I reviewed the final diff.
- [ ] I updated documentation.
- [ ] I considered security, privacy, data, and compatibility.
- [ ] I documented migration, rollout, and rollback where applicable.
- [ ] I reported checks not run.
- [ ] I documented assumptions and residual risks.
- [ ] I verified the Definition of Done.

## Maintainer checklist

Before approval:

- [ ] The change addresses the intended problem.
- [ ] Scope is appropriate.
- [ ] Required ownership reviewed the change.
- [ ] Architecture remains coherent.
- [ ] Tests and validation are sufficient.
- [ ] Security and privacy are addressed.
- [ ] Contracts and migrations are safe.
- [ ] Documentation is accurate.
- [ ] Rollout and recovery are credible.
- [ ] Risks are visible and accepted.
- [ ] Required CI checks pass.

## Exceptions

Exceptions to this process require:

- a clear reason
- a defined scope
- risk assessment
- compensating controls
- an owner
- an approver
- an expiry or review trigger

Do not create undocumented permanent exceptions.

## Questions and support

For contribution questions:

- **General development:** <channel, discussion, or owner>
- **Architecture:** <channel or owner>
- **Testing:** <channel or owner>
- **Security:** <approved private channel>
- **Operations:** <channel or owner>
- **Product or requirements:** <channel or owner>

Do not post secrets, production data, personal information, or unpatched vulnerability details in general support channels.

## Maintenance

Review this guide when:

- contribution workflows change
- branch, commit, or merge conventions change
- required reviewers change
- CI checks change
- security or privacy requirements change
- release or deployment processes change
- project documents are reorganized
- contributors repeatedly encounter the same ambiguity
- coding-agent workflows change

During review:

- verify links
- verify commands
- verify ownership
- remove duplication
- remove obsolete rules
- update the last-reviewed date
