# Definition of Done

This document defines the minimum conditions that must be satisfied before work is considered complete.

It is intended for developers, reviewers, product owners, architects, operators, security specialists, and coding agents. Apply the relevant sections to each change. A criterion may be marked `Not applicable` only when the reason is clear.

Replace every `<...>` placeholder before treating this document as authoritative. Remove criteria that genuinely do not apply to the project, and add project-specific gates where needed.

## Document status

- **Project:** <project name>
- **Owners:** <team, role, or individuals>
- **Last reviewed:** <YYYY-MM-DD>
- **Review cadence:** <for example: quarterly or after workflow changes>
- **Related documents:**
  - `docs/PROJECT_CONTEXT.md`
  - `docs/ARCHITECTURE.md`
  - `docs/DEVELOPMENT.md`
  - `docs/TESTING.md`
  - `docs/SECURITY.md`
  - `CONTRIBUTING.md`
  - `AGENTS.md`

Remove references to files that do not exist.

## Quick Definition of Done (small tasks)

For a small, well-understood task (see `AGENTS.md` task classification), use this short list instead of the full checklist below. Escalate to the full checklist when the task turns out to be substantial, ambiguous, or risky.

- [ ] The requested outcome is implemented and matches the request.
- [ ] Existing working-tree changes were preserved; nothing unrelated was touched.
- [ ] Relevant tests were added or updated, and the narrowest relevant check was run.
- [ ] The final diff was reviewed and contains no secrets, debris, or unrelated changes.
- [ ] Documentation was updated only if behavior, commands, or configuration actually changed.
- [ ] The result, evidence, and any residual risk were reported truthfully.

Do not use the quick list to avoid scrutiny on a change that is actually substantial, security-sensitive, or data-affecting — use the full checklist for those.

## Purpose

The Definition of Done ensures that a change is not considered complete merely because code was written.

A completed change must provide sufficient evidence that:

- the requested outcome is implemented
- scope and acceptance criteria are satisfied
- architecture and project conventions are preserved
- relevant tests and validation have run
- security, privacy, data, and compatibility impacts are addressed
- documentation and operational needs are current
- deployment, migration, and rollback implications are understood
- the final diff contains no known unintended changes
- unresolved risks and limitations are visible

## How to use this document

For each change:

1. Identify which sections apply.
2. Complete all applicable criteria.
3. Mark non-applicable items explicitly.
4. Provide evidence for important checks.
5. Record deviations, failures, assumptions, and residual risks.
6. Do not mark the work complete while material criteria remain unresolved.

Suggested status values:

- **Complete**
- **Complete with accepted limitations**
- **Partially complete**
- **Blocked**
- **Not applicable**

## Completion principles

- Evidence is required for completion.
- Validation results must be reported truthfully.
- A check that was not run is not a passing check.
- A known failure must not be hidden behind a successful subset.
- Acceptance criteria must map to implementation and verification.
- Unrelated refactoring does not make a change more complete.
- Security, migration, and operational work are part of implementation, not optional follow-up.
- Pre-existing user changes must be preserved.
- Remote or irreversible actions require explicit authorization.
- Completion does not require perfection, but remaining risk must be explicit and accepted by the appropriate owner.

## Universal completion criteria

Every change must satisfy these criteria unless explicitly marked not applicable.

### Intent and scope

- [ ] The requested outcome is understood.
- [ ] The implemented scope matches the approved request, demand, issue, or plan.
- [ ] Explicit non-goals and exclusions are respected.
- [ ] No unrelated feature, refactor, cleanup, modernization, or dependency upgrade was added.
- [ ] Material assumptions are documented.
- [ ] Material ambiguities or contradictions were resolved or surfaced.
- [ ] Relevant acceptance criteria are identified.
- [ ] All selected implementation tasks are complete or clearly reported as incomplete.

### Repository and instructions

- [ ] Applicable repository instructions were read.
- [ ] Relevant architecture, development, testing, and security guidance was followed.
- [ ] Existing repository conventions were inspected before introducing new patterns.
- [ ] Generated-file rules were followed.
- [ ] Required ownership or review rules were respected.
- [ ] No instruction conflict remains hidden.

### Working-tree safety

- [ ] Version-control status was inspected before editing.
- [ ] Pre-existing user changes were identified and preserved.
- [ ] No unrelated files were overwritten or removed.
- [ ] No destructive version-control operation was used without explicit authorization.
- [ ] The final diff was reviewed.
- [ ] Temporary, backup, debug, or accidental files were removed.
- [ ] No secret or sensitive value appears in the diff.

## Functional completion

Apply when the change modifies behavior.

- [ ] Required success behavior is implemented.
- [ ] Required failure behavior is implemented.
- [ ] Boundary and validation behavior is defined.
- [ ] Error messages and error semantics are appropriate.
- [ ] User-visible behavior matches the acceptance criteria.
- [ ] Existing supported behavior remains unchanged unless intentionally modified.
- [ ] Relevant edge cases were considered.
- [ ] Idempotency, retries, ordering, or concurrency were considered where applicable.
- [ ] Feature flags or configuration defaults are intentional.
- [ ] Unsupported or invalid states fail safely.
- [ ] Known limitations are documented.

## Acceptance-criteria traceability

Every acceptance criterion should have implementation and validation evidence.

| Criterion | Implementation evidence | Validation evidence | Status |
|---|---|---|---|
| `AC-001` | `<file, component, or task>` | `<test, command, or manual check>` | Complete / Partial / Blocked |
| `AC-002` | `<evidence>` | `<evidence>` | Complete / Partial / Blocked |

Completion rules:

- [ ] Every applicable acceptance criterion appears in the table.
- [ ] Every completed criterion has validation evidence.
- [ ] Partially verified criteria include the remaining gap.
- [ ] Blocked criteria include the blocker and decision owner.
- [ ] No criterion is marked complete based only on code inspection when behavioral validation is practical.

## Code quality

Apply when source code changes.

- [ ] Code follows the nearest established style and architecture.
- [ ] Names communicate intent.
- [ ] Logic is clear and maintainable.
- [ ] Public surface area is no larger than necessary.
- [ ] Existing abstractions and utilities were reused where appropriate.
- [ ] New abstractions are justified by more than speculative future use.
- [ ] Error handling follows project conventions.
- [ ] Logging follows project conventions and data-handling rules.
- [ ] Configuration is not hard-coded when it should be externalized.
- [ ] Dead, duplicated, commented-out, or unreachable code was not introduced.
- [ ] Temporary diagnostics were removed.
- [ ] Warnings were fixed or narrowly justified rather than broadly suppressed.
- [ ] Comments explain intent or constraints rather than restating obvious code.
- [ ] Complexity is proportionate to the requirement.

## Automated testing

Apply when behavior changes or defects are corrected.

### Test coverage

- [ ] Relevant unit tests were added or updated.
- [ ] Relevant integration tests were added or updated.
- [ ] Relevant contract tests were added or updated.
- [ ] Relevant end-to-end tests were added or updated.
- [ ] A regression test exists for a corrected defect when practical.
- [ ] Success paths are covered.
- [ ] Important failure paths are covered.
- [ ] Validation boundaries are covered.
- [ ] Authorization and permission boundaries are covered where applicable.
- [ ] Data transformations and migrations are covered where applicable.
- [ ] Concurrency, retries, or idempotency are covered where material.
- [ ] Test data is synthetic and safe.
- [ ] Tests follow the project’s fixture, fake, mock, and naming conventions.

### Test quality

- [ ] Tests verify observable behavior or important invariants.
- [ ] Tests do not merely duplicate implementation details.
- [ ] Mocks do not replace the behavior being tested.
- [ ] Tests are deterministic.
- [ ] Tests avoid uncontrolled network or production access.
- [ ] Tests clean up resources.
- [ ] Fixed sleeps are avoided where deterministic synchronization is possible.
- [ ] Snapshot or golden-file changes were reviewed semantically.
- [ ] No test was deleted, disabled, weakened, or skipped merely to obtain a pass.
- [ ] New skips or quarantines have an owner and removal condition.

## Validation

Run the strongest practical checks relevant to the change.

| Check | Command or method | Result | Notes |
|---|---|---|---|
| Formatting | `<command>` | Passed / Failed / Not run | <notes> |
| Linting | `<command>` | Passed / Failed / Not run | <notes> |
| Static analysis | `<command>` | Passed / Failed / Not run | <notes> |
| Type checking | `<command>` | Passed / Failed / Not run | <notes> |
| Unit tests | `<command>` | Passed / Failed / Not run | <notes> |
| Integration tests | `<command>` | Passed / Failed / Not run | <notes> |
| Contract tests | `<command>` | Passed / Failed / Not run | <notes> |
| End-to-end tests | `<command>` | Passed / Failed / Not run | <notes> |
| Build or packaging | `<command>` | Passed / Failed / Not run | <notes> |
| Generated-file check | `<command>` | Passed / Failed / Not run | <notes> |
| Migration validation | `<command>` | Passed / Failed / Not run | <notes> |
| Security checks | `<command>` | Passed / Failed / Not run | <notes> |
| Accessibility checks | `<command>` | Passed / Failed / Not run | <notes> |
| Performance checks | `<command>` | Passed / Failed / Not run | <notes> |
| Manual verification | `<method>` | Passed / Failed / Not run | <notes> |

Validation criteria:

- [ ] Targeted validation ran during implementation.
- [ ] Broader project-appropriate validation ran before completion.
- [ ] Change-caused failures were fixed.
- [ ] Unresolved failures are reported precisely.
- [ ] Checks not run include a reason.
- [ ] Residual validation risk is documented.
- [ ] No check is reported as passed unless it actually succeeded.
- [ ] Pre-existing failures are labeled as such only with evidence.

## Security

Apply the project’s security guidance to every relevant change.

- [ ] Authentication impact was considered.
- [ ] Authorization impact was considered.
- [ ] Trust-boundary impact was considered.
- [ ] Input is validated at the correct boundary.
- [ ] Output is encoded or serialized safely.
- [ ] Injection risks were considered.
- [ ] File, path, URL, network, parser, or command-execution risks were considered.
- [ ] Secrets and credentials use approved mechanisms.
- [ ] No secret is committed, logged, documented, or exposed.
- [ ] Sensitive-data logging is prevented.
- [ ] Least privilege is preserved.
- [ ] Administrative or privileged operations are auditable where required.
- [ ] Negative authorization and malformed-input tests exist where applicable.
- [ ] New dependencies were reviewed for security impact.
- [ ] Relevant security scans or reviews ran.
- [ ] A threat model was created or updated when required.
- [ ] Material security decisions received the required approval.
- [ ] Residual security risks or exceptions are documented and approved.

## Privacy and data protection

Apply when personal, confidential, restricted, or regulated data is involved.

- [ ] Data collection is necessary for the approved purpose.
- [ ] Only the minimum necessary fields are processed.
- [ ] The source of truth is clear.
- [ ] Data ownership is clear.
- [ ] Access roles are intentional.
- [ ] Data sharing is approved.
- [ ] Retention is defined.
- [ ] Deletion or anonymization is defined.
- [ ] Backup and replica implications are considered.
- [ ] Telemetry and analytics do not collect unnecessary sensitive data.
- [ ] Test fixtures and logs contain no real sensitive data.
- [ ] Data export or user-rights workflows are updated where applicable.
- [ ] Privacy review was completed when required.
- [ ] Documentation reflects new or changed data processing.

## API, event, and contract completion

Apply when contracts change.

- [ ] The contract source was updated.
- [ ] Producers and consumers were identified.
- [ ] Compatibility requirements were confirmed.
- [ ] Breaking changes are explicitly approved.
- [ ] Versioning or deprecation is defined.
- [ ] Input and output schemas are synchronized.
- [ ] Generated clients or bindings were updated through supported workflows.
- [ ] Error semantics are intentional.
- [ ] Idempotency and replay behavior are defined where applicable.
- [ ] Rate and size limits are considered.
- [ ] Contract tests pass.
- [ ] Rollout order is defined.
- [ ] Consumer migration is documented.
- [ ] Documentation and examples are current.

## Data and migration completion

Apply when persisted data, schemas, or migrations change.

- [ ] Data ownership and source of truth are confirmed.
- [ ] The migration is deterministic.
- [ ] The migration preserves required compatibility.
- [ ] Deployment ordering is defined.
- [ ] Partial failure behavior is understood.
- [ ] Restart or rerun behavior is understood.
- [ ] Transaction boundaries are appropriate.
- [ ] Data integrity checks exist.
- [ ] Representative and edge-case data were tested.
- [ ] Null, empty, malformed, and historical data were considered.
- [ ] Rollback or forward-recovery behavior is defined.
- [ ] Destructive changes are explicitly approved.
- [ ] No migration was applied to a shared or production-like environment without authorization.
- [ ] Migration documentation is current.
- [ ] Operational verification steps are defined.

## Dependencies and supply chain

Apply when dependencies, build tooling, or generated artifacts change.

- [ ] Existing project or standard-library capabilities were considered first.
- [ ] The new dependency is necessary.
- [ ] Runtime and platform compatibility were checked.
- [ ] Maintenance and security posture were considered.
- [ ] License requirements were considered.
- [ ] Transitive impact was reviewed.
- [ ] The correct manifest was updated.
- [ ] The lockfile was updated through the normal workflow.
- [ ] No unrelated dependency upgrade was included.
- [ ] Relevant tests cover the integration.
- [ ] Dependency or supply-chain scans ran where required.
- [ ] Generated artifacts were produced by the approved tool.
- [ ] Generated diffs were reviewed.
- [ ] Build provenance, signing, or integrity requirements were preserved.

## Performance and scalability

Apply when performance, scale, resource use, or latency may change.

- [ ] Critical paths were identified.
- [ ] Expected workload is understood.
- [ ] Latency impact was considered.
- [ ] Throughput impact was considered.
- [ ] Memory, CPU, storage, or network impact was considered.
- [ ] Database query behavior was reviewed.
- [ ] Cache behavior and invalidation were reviewed.
- [ ] Concurrency and locking behavior were reviewed.
- [ ] Rate or resource limits are defined where needed.
- [ ] Performance tests or benchmarks ran when required.
- [ ] Results were compared in a representative environment.
- [ ] Regressions are within approved limits.
- [ ] Observability can detect performance degradation.

## Reliability and resilience

Apply when runtime or integration behavior changes.

- [ ] Timeout behavior is defined.
- [ ] Retry behavior is defined.
- [ ] Retry safety and idempotency are considered.
- [ ] Failure isolation is appropriate.
- [ ] Graceful degradation is considered.
- [ ] Queue bounds or backpressure are considered.
- [ ] Duplicate, delayed, or reordered input is considered where applicable.
- [ ] Recovery after restart is understood.
- [ ] Reconciliation is defined where needed.
- [ ] Single points of failure are identified.
- [ ] Health and readiness checks remain accurate.
- [ ] Failure scenarios are tested or operationally validated.
- [ ] Operators can diagnose expected failures.

## Accessibility

Apply to user-facing interfaces.

- [ ] Keyboard interaction works.
- [ ] Focus behavior is clear and visible.
- [ ] Semantic structure is correct.
- [ ] Forms have accessible labels and errors.
- [ ] Non-text content has appropriate alternatives.
- [ ] Color is not the sole indicator.
- [ ] Contrast meets the project’s target.
- [ ] Zoom and responsive behavior were considered.
- [ ] Screen-reader behavior was checked for critical journeys.
- [ ] Automated accessibility checks ran where available.
- [ ] Manual accessibility checks were completed where required.
- [ ] Accessibility regressions are covered by tests where practical.

## Documentation

Update the authoritative documents affected by the change.

- [ ] User-facing behavior is documented.
- [ ] API, event, schema, or interface documentation is updated.
- [ ] Configuration and environment variables are documented.
- [ ] Development setup or commands are updated.
- [ ] Testing instructions are updated.
- [ ] Migration and rollout instructions are updated.
- [ ] Operational diagnostics and troubleshooting are updated.
- [ ] Security or privacy behavior is updated.
- [ ] Known limitations are updated.
- [ ] Examples and snippets match the implementation.
- [ ] Repository-relative links are valid.
- [ ] Documentation contains no secrets or sensitive production data.
- [ ] Documentation describes implemented behavior only.
- [ ] Architecture decisions are recorded when required.

## Architecture and design records

Apply when the change affects architectural boundaries or long-term decisions.

- [ ] Current architecture documentation remains accurate.
- [ ] Component responsibilities remain clear.
- [ ] Dependency direction is preserved.
- [ ] New cross-component dependencies are justified.
- [ ] Source-of-truth ownership remains explicit.
- [ ] Public and internal interfaces are intentional.
- [ ] Trust boundaries remain explicit.
- [ ] A material decision record was created or updated when required.
- [ ] The decision includes alternatives, trade-offs, and consequences.
- [ ] Conditions for revisiting the decision are recorded.
- [ ] The implementation matches the approved decision.

## Observability and operations

Apply to runtime changes.

- [ ] Logging is sufficient for diagnosis.
- [ ] Logs avoid sensitive data.
- [ ] Correlation identifiers are preserved.
- [ ] Metrics reflect important success and failure states.
- [ ] Tracing is updated where applicable.
- [ ] Health and readiness checks are accurate.
- [ ] Alerts are added or updated where required.
- [ ] Dashboards or runbooks are updated where required.
- [ ] Security-relevant actions are auditable where required.
- [ ] Operators can identify and respond to failure.
- [ ] Operational ownership is clear.
- [ ] Support impact is documented.
- [ ] Capacity or cost impact is understood.

## Configuration and feature flags

Apply when configuration changes.

- [ ] Configuration source and precedence are defined.
- [ ] Defaults are safe.
- [ ] Required configuration is validated.
- [ ] Missing or invalid configuration fails clearly.
- [ ] Secrets are separated from ordinary configuration.
- [ ] Environment differences are documented.
- [ ] Feature-flag defaults are intentional.
- [ ] Both flag states are tested where required.
- [ ] Flag ownership and removal criteria are defined.
- [ ] Temporary flags have an expiry or cleanup condition.
- [ ] Configuration documentation is current.

## Deployment and release readiness

Apply when the change will be deployed or released.

- [ ] The build or package is reproducible through the supported workflow.
- [ ] Required CI checks pass.
- [ ] Deployment order is defined.
- [ ] Environment prerequisites are documented.
- [ ] Configuration and secrets are available through approved mechanisms.
- [ ] Database or contract compatibility during rollout is understood.
- [ ] Feature-flag or staged-rollout strategy is defined where needed.
- [ ] Smoke tests are defined.
- [ ] Rollback conditions are defined.
- [ ] Rollback limitations are understood.
- [ ] Forward-recovery is defined where rollback is not possible.
- [ ] Monitoring during rollout is defined.
- [ ] Release notes or change logs are updated where required.
- [ ] Support and operations are informed when required.
- [ ] No deployment or release action was performed without explicit authorization.

## Manual verification

Use manual verification when automation is unavailable or insufficient.

- [ ] The environment is identified.
- [ ] Preconditions are documented.
- [ ] Steps are reproducible.
- [ ] Expected results are explicit.
- [ ] Synthetic or approved test data is used.
- [ ] Evidence is captured when appropriate.
- [ ] Cleanup is complete.
- [ ] Manual verification does not contact production or modify shared state without authorization.
- [ ] Remaining automation gaps are documented.

## Review readiness

Before requesting review:

- [ ] The diff is focused and understandable.
- [ ] The change is divided into coherent commits only when commits are requested.
- [ ] The description explains the problem and solution.
- [ ] Acceptance criteria are referenced.
- [ ] Test and validation evidence is included.
- [ ] Migration, rollout, and rollback notes are included where relevant.
- [ ] Security and privacy impact is stated.
- [ ] Known limitations and follow-up items are stated.
- [ ] Reviewers with the required ownership or expertise are identified.
- [ ] No generated, local, secret, or unrelated files are included.

## Agent completion criteria

A coding agent may report a task as complete only when:

- [ ] The correct request, demand, or plan was used.
- [ ] Applicable repository instructions were followed.
- [ ] Repository evidence was inspected before editing.
- [ ] Pre-existing user changes were preserved.
- [ ] The implementation stayed within scope.
- [ ] Relevant tests were added or updated.
- [ ] Practical validation ran.
- [ ] The final diff was reviewed.
- [ ] Files changed and checks run are reported.
- [ ] Acceptance criteria are mapped to evidence.
- [ ] Deviations and assumptions are visible.
- [ ] Unresolved failures or risks are explicit.
- [ ] No remote, destructive, or irreversible action was performed without authorization.
- [ ] No unsupported claim of success is made.

An agent must use `Complete with limitations`, `Partially complete`, or `Blocked` rather than `Complete` when material implementation or validation remains unresolved.

## Exceptions

A criterion may be waived only when:

- the criterion is genuinely not applicable, or
- an authorized owner accepts the risk

Every exception must include:

| Field | Value |
|---|---|
| Criterion | <criterion> |
| Reason | <reason> |
| Risk | <risk> |
| Compensating control | <control> |
| Owner | <owner> |
| Approver | <approver> |
| Expiry or review trigger | <date or condition> |

Do not create permanent undocumented exceptions.

## Residual risk

Before completion, list remaining risks.

| Risk | Impact | Mitigation | Owner | Status |
|---|---|---|---|---|
| <risk> | <impact> | <mitigation> | <owner> | Accepted / Open / Blocked |

If no material risk remains, state `None identified`.

## Completion report template

```markdown
# Completion Report: <change title>

## Status

- **Result:** Complete | Complete with accepted limitations | Partially complete | Blocked
- **Request or plan:** <reference>
- **Completed scope:** <summary>
- **Excluded scope:** <summary>

## Implemented

- <important behavior>
- <important behavior>

## Files changed

- `<path>` — <purpose>

## Acceptance criteria

| Criterion | Status | Evidence |
|---|---|---|
| `AC-001` | Satisfied and verified | <evidence> |

## Validation

| Check | Result | Notes |
|---|---|---|
| `<command or method>` | Passed / Failed / Not run | <notes> |

## Security, privacy, and data

- <impact or `No material impact identified`>

## Migration, rollout, and rollback

- <details or `Not applicable`>

## Deviations and assumptions

- <deviation or assumption, or `None`>

## Preserved pre-existing changes

- `<path>` — <details>
- `None identified`

## Remaining risks and follow-up

- <risk or follow-up, or `None`>
```

## Project-specific quality gates

Add mandatory project gates here.

| Gate | Requirement | Evidence |
|---|---|---|
| <gate> | <requirement> | <command, report, or approval> |

Examples:

- minimum test coverage
- required CI job
- architecture test
- security scan
- performance threshold
- accessibility standard
- code-owner approval
- migration rehearsal
- release-management approval

Do not add a gate that the project cannot reliably evaluate.

## Change-type checklists

### Documentation-only change

- [ ] Content matches current implementation.
- [ ] Commands and examples are verified.
- [ ] Links are valid.
- [ ] No unimplemented behavior is documented.
- [ ] No sensitive data is included.
- [ ] Formatting or documentation checks pass where available.

### Defect correction

- [ ] The defect is reproduced or clearly understood.
- [ ] Root cause is addressed.
- [ ] A regression test exists when practical.
- [ ] Adjacent behavior was reviewed.
- [ ] User-visible impact is documented.
- [ ] Relevant targeted and broader checks pass.

### Feature

- [ ] Demand and acceptance criteria are clear.
- [ ] Architecture impact is understood.
- [ ] Required behavior and failure handling are implemented.
- [ ] Tests cover the important paths.
- [ ] Security, privacy, data, compatibility, and operational impacts are addressed.
- [ ] Documentation is updated.
- [ ] Rollout and rollback are defined where needed.

### Refactor

- [ ] Intended behavior is unchanged unless explicitly approved.
- [ ] The motivation and boundary are clear.
- [ ] Regression coverage protects behavior.
- [ ] The refactor does not include unrelated changes.
- [ ] Performance and compatibility are preserved.
- [ ] Architecture documentation is updated if boundaries changed.

### Dependency update

- [ ] The reason is clear.
- [ ] Compatibility is verified.
- [ ] Security and license implications are reviewed.
- [ ] Lockfiles are updated through the normal workflow.
- [ ] Relevant builds and tests pass.
- [ ] Breaking or operational changes are documented.
- [ ] No unrelated upgrades are included.

### Migration

- [ ] Supported source versions are defined.
- [ ] Upgrade behavior is tested.
- [ ] Partial failure and rerun behavior are understood.
- [ ] Data integrity is verified.
- [ ] Deployment order is defined.
- [ ] Rollback or forward-recovery is documented.
- [ ] Operational verification exists.
- [ ] Destructive operations are explicitly approved.

### Security-sensitive change

- [ ] Threat assumptions are explicit.
- [ ] Trust boundaries are reviewed.
- [ ] Authentication and authorization are tested.
- [ ] Input and output handling are reviewed.
- [ ] Secrets and logs are safe.
- [ ] Negative tests exist.
- [ ] Required scans and reviews are complete.
- [ ] Residual risk and approvals are documented.

## Maintenance

Review this document when:

- development or review workflows change
- CI quality gates change
- test strategy changes
- security or privacy requirements change
- deployment or release processes change
- recurring defects reveal a missing completion criterion
- agents repeatedly claim completion without sufficient evidence
- criteria become duplicated or obsolete
- the project lifecycle changes

During review:

- remove obsolete criteria
- add new project-specific gates
- verify referenced documents and paths
- verify ownership
- keep universal criteria distinct from specialist documentation
- update the last-reviewed date
