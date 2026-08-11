# Testing Guide

This document defines how the project verifies correctness, compatibility, quality, and operational readiness.

It is intended for developers, reviewers, maintainers, release owners, and coding agents. Keep commands and paths aligned with the repository. General setup belongs in `DEVELOPMENT.md`; system structure belongs in `ARCHITECTURE.md`; security policy belongs in `SECURITY.md`.

Replace every `<...>` placeholder before treating this document as authoritative. Remove sections and test levels that do not apply.

## Document status

- **Project:** <project name>
- **Owners:** <team, role, or individuals>
- **Last reviewed:** <YYYY-MM-DD>
- **Primary test configuration:** `<path>`
- **CI test workflows:** `<paths>`
- **Related documents:**
  - `docs/PROJECT_CONTEXT.md`
  - `docs/ARCHITECTURE.md`
  - `docs/DEVELOPMENT.md`
  - `docs/SECURITY.md`
  - `docs/DEFINITION_OF_DONE.md`

Remove references to files that do not exist.

## Testing objectives

The test strategy should provide evidence that:

- required behavior works
- important failure behavior is controlled
- regressions are detected
- public contracts remain compatible where required
- data transformations preserve integrity
- authentication and authorization rules hold
- integrations fail predictably
- the application can be built and operated
- acceptance criteria can be traced to validation
- failures are diagnosable

Project-specific priorities:

1. <priority>
2. <priority>
3. <priority>

## Testing principles

- Test observable behavior and important invariants.
- Use the lowest test level that gives reliable evidence.
- Add regression coverage for corrected defects when practical.
- Keep tests deterministic, isolated, and readable.
- Prefer real project components over mocks when the boundary can be exercised cheaply and reliably.
- Use mocks, fakes, or stubs deliberately at external or expensive boundaries.
- Do not delete, disable, or weaken tests merely to make a change pass.
- Do not update snapshots or expected output without inspecting the semantic change.
- Keep test data synthetic and free of secrets or sensitive production information.
- Treat test code as maintained production-quality code.
- Report tests that were not run and explain why.
- Never claim a test passed unless it was actually run successfully.

## Testing scope

### In scope

Testing covers:

- <application or library>
- <services or packages>
- <public interfaces>
- <data migrations>
- <supported platforms or runtimes>
- <integrations or local fakes>

### Out of scope

Testing does not cover:

- <system owned elsewhere>
- <unsupported platform>
- <external provider behavior beyond the local contract>
- <manual process>

Document ownership for out-of-scope validation.

## Test stack

| Purpose | Framework or tool | Version source | Configuration |
|---|---|---|---|
| Unit testing | <tool> | `<path>` | `<path>` |
| Integration testing | <tool> | `<path>` | `<path>` |
| End-to-end testing | <tool or not applicable> | `<path>` | `<path>` |
| Mocking or fakes | <tool> | `<path>` | `<path>` |
| Coverage | <tool> | `<path>` | `<path>` |
| Performance | <tool or not applicable> | `<path>` | `<path>` |
| Accessibility | <tool or not applicable> | `<path>` | `<path>` |
| Security analysis | <tool or not applicable> | `<path>` | `<path>` |

Do not list a tool merely because it appears transitively in a lockfile. Confirm that the project uses it.

## Test locations and naming

| Test level | Location | Naming convention | Primary responsibility |
|---|---|---|---|
| Unit | `<path>` | <pattern> | <responsibility> |
| Component/module | `<path or not applicable>` | <pattern> | <responsibility> |
| Integration | `<path or not applicable>` | <pattern> | <responsibility> |
| Contract | `<path or not applicable>` | <pattern> | <responsibility> |
| End-to-end | `<path or not applicable>` | <pattern> | <responsibility> |
| Migration | `<path or not applicable>` | <pattern> | <responsibility> |
| Performance | `<path or not applicable>` | <pattern> | <responsibility> |

### Test structure

Use the repository's established pattern:

```text
<example test naming or arrange-act-assert structure>
```

Guidelines:

- Make test names describe behavior and conditions.
- Keep setup focused on the behavior under test.
- Use helper abstractions only when they improve clarity.
- Avoid large shared fixtures that hide important state.
- Include the failure message or assertion context needed to diagnose failures.

## Quick commands

Use repository-provided commands. Do not substitute undocumented commands when an official script exists.

### Fast local test suite

```sh
<fast test command>
```

### Run one test file or test target

```sh
<single-file or target command>
```

### Run one test by name

```sh
<single-test command>
```

### Unit tests

```sh
<unit-test command>
```

### Integration tests

```sh
<integration-test command>
```

### Contract tests

```sh
<contract-test command>
```

### End-to-end tests

```sh
<end-to-end command>
```

### Coverage

```sh
<coverage command>
```

### CI-equivalent validation

```sh
<CI-equivalent command>
```

### Watch mode

```sh
<watch command>
```

Use `Not applicable` for unsupported commands rather than inventing them.

## Test prerequisites

| Test group | Required runtime or service | Setup command | Cleanup |
|---|---|---|---|
| <group> | <requirement> | `<command>` | `<command>` |

Possible prerequisites include:

- database
- message broker
- cache
- container runtime
- browser
- local service
- sandbox credentials
- generated code
- test certificates
- platform-specific tooling

### Environment variables

| Variable | Required for | Default | Sensitive |
|---|---|---|---|
| `<NAME>` | <test group> | <default or none> | Yes / No |

Do not include actual secret values.

### Local test configuration

| File | Purpose | Committed | Safe to share |
|---|---|---|---|
| `<path>` | <purpose> | Yes / No | Yes / No |

## Test levels

## Unit tests

Unit tests verify a small behavior in isolation from expensive or unreliable boundaries.

Use unit tests for:

- domain rules
- validation
- pure transformations
- state transitions
- error mapping
- local branching logic
- small utility behavior

Unit-test conventions:

- <convention>
- <convention>
- <convention>

Avoid mocking the unit's own internal implementation merely to reproduce its call sequence.

## Component or module tests

Use this section only when the project has a distinct component-test level.

Component tests verify a complete module through its public interface while replacing external boundaries.

They should cover:

- module orchestration
- persistence or transport adapters through local test implementations
- error translation
- configuration
- important module invariants

Configuration:

- **Location:** `<path>`
- **Command:** `<command>`
- **External boundaries replaced by:** <fakes or containers>

## Integration tests

Integration tests verify behavior across real project boundaries.

Use integration tests for:

- database queries and transactions
- serialization and schemas
- framework wiring
- dependency injection
- filesystem behavior
- internal service communication
- external-client adapters against fakes or sandboxes
- authentication and authorization enforcement points

Integration-test environment:

- **Configuration:** `<path>`
- **Services:** <services>
- **Isolation approach:** <transactions, disposable databases, containers, namespaces>
- **Cleanup:** <approach>

Integration tests must not depend on mutable production data.

## Contract tests

Use this section when the project publishes or consumes contracts.

Contracts may include:

- HTTP or RPC APIs
- events and messages
- schemas
- file formats
- library APIs
- generated clients
- command-line output relied upon by automation

Document:

- **Contract source:** `<path>`
- **Compatibility policy:** <policy>
- **Provider verification:** `<command>`
- **Consumer verification:** `<command>`
- **Schema generation:** `<command>`
- **Breaking-change detection:** `<command or process>`

Contract tests should verify required semantics, not only syntax.

## End-to-end tests

End-to-end tests verify critical journeys through the deployed or fully assembled system.

Use them selectively for:

- highest-value user journeys
- cross-component integration
- authentication flow
- deployment configuration
- browser or client behavior
- release smoke tests

Environment:

- **Target:** <local, ephemeral, test, or staging>
- **Data:** <synthetic or isolated>
- **Startup:** `<command>`
- **Test command:** `<command>`
- **Cleanup:** `<command>`

End-to-end tests must not perform uncontrolled state changes in shared environments.

## User-interface tests

Use this section when applicable.

### Component rendering tests

- **Tool:** <tool>
- **Location:** `<path>`
- **Command:** `<command>`

### Browser tests

- **Tool:** <tool>
- **Browsers:** <supported browsers>
- **Viewport strategy:** <strategy>
- **Command:** `<command>`

### Visual regression

- **Tool:** <tool or not applicable>
- **Baseline ownership:** <owner>
- **Update command:** `<command>`
- **Review requirement:** <requirement>

Do not approve visual baseline changes without inspecting the rendered difference.

## Accessibility testing

Use this section for user-facing interfaces.

Automated checks:

```sh
<accessibility command>
```

Manual checks:

- keyboard navigation
- focus order and visibility
- semantic structure
- form labels and error association
- screen-reader behavior
- contrast and non-color indicators
- zoom and responsive layout

Standards or target:

- <standard, version, or organizational expectation>

Automated tools do not replace manual accessibility validation for critical journeys.

## Security testing

Security validation may include:

- authentication tests
- authorization and negative permission tests
- input validation
- injection resistance
- file and path handling
- secret scanning
- dependency analysis
- static analysis
- dynamic analysis
- audit-event verification
- rate-limit or abuse-control testing

Commands:

```sh
<security test or scan command>
```

Security-sensitive test data must remain synthetic.

Record tests requiring specialized review or restricted environments in `docs/SECURITY.md`.

## Data and migration testing

Use this section when the project persists data.

Migration tests should cover:

- clean installation
- upgrade from supported versions
- representative existing data
- null, empty, and boundary data
- invalid or unexpected historical data
- partial failure
- restart or rerun behavior
- data integrity
- compatibility during staged deployment
- rollback or forward recovery

Commands:

```sh
<migration creation or setup command>
<migration validation command>
```

Never run migration tests against production or shared data without explicit authorization.

## Performance and scalability testing

Use this section only when the project has defined performance expectations.

### Objectives

| Scenario | Workload | Target | Environment |
|---|---|---|---|
| <scenario> | <workload> | <latency, throughput, resource, or capacity target> | <environment> |

### Commands

```sh
<benchmark or load-test command>
```

### Result interpretation

Document:

- warm-up
- repetitions
- acceptable variance
- hardware or environment assumptions
- baseline source
- regression threshold
- artifact location

Do not compare performance results from materially different environments without stating the limitation.

## Resilience and failure testing

Consider tests for:

- dependency timeout
- transient failure
- retry behavior
- duplicate requests or events
- idempotency
- partial persistence failure
- unavailable database or broker
- malformed external responses
- rate limits
- overload and backpressure
- restart and recovery
- stale cache
- clock skew or expired credentials

Document which scenarios are automated and which require operational exercises.

## Test data

### Principles

- Use synthetic data by default.
- Do not copy production data into tests.
- Do not include secrets, credentials, tokens, or personal records.
- Keep fixtures minimal and purpose-specific.
- Make test-data ownership and cleanup explicit.
- Use stable identifiers where assertions depend on identity.
- Avoid accidental coupling through global shared data.

### Fixture locations

| Fixture type | Location | Owner | Generation |
|---|---|---|---|
| <fixture> | `<path>` | <owner> | Static / Generated |

### Factories and builders

- **Location:** `<path>`
- **Conventions:** <conventions>

### Seed data

- **Command:** `<command>`
- **Purpose:** <purpose>
- **Classification:** Synthetic / Sanitized
- **Cleanup:** `<command>`

Do not call data sanitized unless the sanitization process is documented and approved.

## Mocks, stubs, fakes, and test doubles

Use each deliberately:

- **Mock:** verifies an expected interaction
- **Stub:** returns controlled values
- **Fake:** implements useful behavior with simplified infrastructure
- **Spy:** records interactions for assertions

Project conventions:

- <which boundaries may be mocked>
- <where local fakes are preferred>
- <prohibited mocking patterns>
- <shared test-double locations>

Avoid mocking:

- the behavior being tested
- stable value objects
- broad internal implementation details
- an external contract when a local protocol-level fake would provide stronger evidence

## Time, randomness, and identifiers

Tests involving time must:

- use an injectable or controllable clock
- avoid depending on wall-clock timing
- account for timezone and daylight-saving behavior where relevant

Tests involving randomness must:

- use deterministic seeds when practical
- report the seed on failure
- avoid flaky probability-based assertions

Tests involving generated identifiers must:

- control or capture identifiers
- avoid ordering assumptions unless ordering is part of the contract

Project utilities:

| Concern | Utility | Location |
|---|---|---|
| Time | <utility> | `<path>` |
| Randomness | <utility> | `<path>` |
| Identifiers | <utility> | `<path>` |

## Concurrency and asynchronous tests

Document:

- synchronization primitives used in tests
- timeout policy
- polling helper
- virtual scheduler or fake timer
- event ordering assumptions
- cleanup of tasks, threads, processes, or subscriptions

Avoid fixed sleeps where a deterministic signal or bounded polling mechanism is available.

A test timeout should fail with enough diagnostic information to identify the awaited condition.

## Filesystem and network tests

### Filesystem

- use temporary directories
- avoid user-specific absolute paths
- clean up created files
- test permission and path-boundary behavior where relevant
- avoid modifying the repository working tree during tests

### Network

- bind only to local or ephemeral ports
- avoid uncontrolled internet access
- use local fakes or approved sandboxes
- set explicit timeouts
- clean up servers and connections
- do not send repository or user data externally

## Snapshots and golden files

Use snapshots or golden files when they improve reviewability for stable structured output.

Rules:

- keep files small enough to review
- normalize unstable values
- inspect semantic differences before updating
- avoid snapshots for behavior better expressed with focused assertions
- document the update command
- do not regenerate unrelated snapshots

| Snapshot type | Location | Update command | Reviewer focus |
|---|---|---|---|
| <type> | `<path>` | `<command>` | <focus> |

## Coverage

### Coverage command

```sh
<coverage command>
```

### Policy

- **Measurement:** line / branch / function / mutation / other
- **Threshold:** <threshold or `No fixed threshold`>
- **Scope:** <scope>
- **Exclusions:** <rules>
- **CI behavior:** <behavior>

Coverage is a signal, not proof of correctness.

Do not add low-value assertions solely to increase a percentage. Focus on important behaviors, boundaries, and risks.

### Coverage artifacts

- **Local output:** `<path>`
- **CI artifact:** <artifact>
- **Retention:** <retention>

## Mutation testing

Use this section only when supported.

- **Tool:** <tool>
- **Command:** `<command>`
- **Scope:** <scope>
- **Threshold:** <threshold>
- **Expected use:** routine / periodic / high-risk changes

## Property-based and fuzz testing

Use this section when supported.

Appropriate targets include:

- parsers
- serializers
- validators
- state machines
- algorithms
- security boundaries
- data transformations

Document:

- tool
- seed handling
- corpus storage
- shrinking behavior
- failure reproduction
- CI frequency

Commands:

```sh
<property or fuzz command>
```

## Regression testing

Every corrected defect should have a regression test when:

- the failure can be reproduced reliably
- the test protects meaningful behavior
- the test is maintainable at an appropriate level

A regression test should:

1. fail against the defective behavior
2. pass after the correction
3. describe the user-visible or contract-level failure
4. avoid depending unnecessarily on the exact implementation

When a regression test is impractical, document the reason and alternative validation.

## Acceptance-criteria traceability

For planned work, map requirements and acceptance criteria to validation.

| Requirement or criterion | Test or check | Level | Evidence |
|---|---|---|---|
| `FR-001` / `AC-001` | <test name or command> | Unit / Integration / E2E / Manual | <result or artifact> |

An acceptance criterion may require several test levels.

Do not mark a criterion verified when only an implementation diff was inspected.

## Manual testing

Use manual testing when automation is impractical or insufficient.

Document:

- exact scenario
- prerequisites
- input data
- expected result
- environment
- evidence to capture
- cleanup

Manual checks should be reproducible and should not use sensitive production data.

### Manual test template

```markdown
### Scenario: <name>

- **Environment:** <environment>
- **Prerequisites:** <prerequisites>
- **Steps:**
  1. <step>
  2. <step>
- **Expected result:** <result>
- **Evidence:** <screenshot, log, or observation>
- **Cleanup:** <cleanup>
```

## CI testing

### Workflow matrix

| Workflow or job | Trigger | Test scope | Environment | Required |
|---|---|---|---|---|
| <job> | Pull request / Push / Schedule / Manual | <scope> | <environment> | Yes / No |

### Required checks

| Check | Local equivalent | Failure owner |
|---|---|---|
| <check> | `<command>` | <owner> |

### Parallelization

Document:

- sharding strategy
- test grouping
- shared-resource isolation
- ordering constraints
- result aggregation

### Retries in CI

Automated retries must not hide instability.

Document:

- which tests may be retried
- retry count
- evidence retained from each attempt
- ownership of repeated failures
- conditions for removal of retries

### Test artifacts

| Artifact | Produced by | Purpose | Retention |
|---|---|---|---|
| <artifact> | <job> | <purpose> | <retention> |

Examples include:

- coverage reports
- test-result XML
- browser traces
- screenshots
- videos
- logs
- performance results
- generated reports

Ensure artifacts do not expose secrets or sensitive data.

## Flaky-test policy

A flaky test is one that produces different outcomes without a relevant code or environment change.

Do not label a test flaky merely because it passes on retry.

When flakiness is suspected:

1. preserve the original failure evidence
2. reproduce under controlled conditions
3. identify time, ordering, data, environment, or resource dependencies
4. create a tracking item
5. assign an owner
6. repair the root cause
7. remove temporary mitigation

### Quarantine

Quarantine is allowed only when:

- the test is confirmed flaky
- the test blocks unrelated work
- risk from removing it from the required suite is understood
- an owner and deadline exist
- the quarantine is visible in CI

| Test | Reason | Owner | Tracking | Removal target |
|---|---|---|---|---|
| <test> | <reason> | <owner> | <reference> | <date or condition> |

Do not silently skip flaky tests.

## Test failure triage

Classify failures as:

- change-caused product defect
- change-caused test defect
- pre-existing failure
- flaky or nondeterministic failure
- environment or dependency failure
- infrastructure failure
- test-data failure
- unknown

Triage procedure:

1. read the complete failure and relevant logs
2. identify the first meaningful failure
3. rerun only when a rerun provides new evidence
4. reproduce locally where practical
5. compare with a known baseline when available
6. fix change-caused failures
7. report unresolved failures precisely

Do not repeatedly rerun an unchanged failing test without investigation.

## Test maintenance

Refactor tests when:

- setup obscures intent
- fixtures are broadly coupled
- tests duplicate a stable helper pattern
- assertions no longer describe behavior
- execution time becomes disproportionate
- diagnostics are insufficient

Do not mix broad test cleanup into an unrelated feature change unless required to make the new tests reliable.

Remove obsolete tests only when:

- the protected behavior was intentionally removed
- replacement coverage exists where required
- the removal is reviewed
- compatibility obligations are satisfied

## Review checklist for tests

Reviewers should verify:

- the test protects required behavior
- the chosen test level is appropriate
- names explain conditions and expected outcomes
- setup is understandable
- assertions are meaningful
- failure paths and boundaries are covered
- authorization and sensitive-data behavior are considered
- test data is safe
- mocks do not merely duplicate implementation
- asynchronous behavior is deterministic
- cleanup is reliable
- snapshots are reviewed
- commands and results are reported accurately

## Release and deployment validation

Before release, perform the project-relevant checks:

- full automated suite
- build or package verification
- contract compatibility
- migration validation
- smoke tests
- security checks
- performance checks
- generated-file consistency
- deployment health checks
- rollback or recovery validation

Release-specific commands:

```sh
<release validation command>
```

Production verification must follow approved operational procedures and explicit authorization.

## Test ownership

| Area | Owner | Escalation |
|---|---|---|
| Unit-test framework | <owner> | <path> |
| Integration environment | <owner> | <path> |
| End-to-end suite | <owner> | <path> |
| CI test infrastructure | <owner> | <path> |
| Performance testing | <owner> | <path> |
| Security testing | <owner> | <path> |

Use `Not yet confirmed` rather than inferring ownership from commit history.

## Troubleshooting

### Tests are not discovered

Check:

- naming and path conventions
- test-runner configuration
- workspace or package selection
- generated test manifests
- ignored paths
- runtime version

### Tests pass locally but fail in CI

Check:

- environment differences
- locale and timezone
- file-path case sensitivity
- test ordering
- CPU or timing assumptions
- missing generated files
- undeclared services
- network restrictions
- permissions
- parallel execution
- uncommitted local files

### Tests hang

Check:

- unresolved asynchronous work
- missing timeout
- deadlock
- open process, server, thread, or connection
- polling without a bound
- external dependency without a timeout

### Snapshot mismatch

- inspect the rendered or semantic difference
- verify unstable values are normalized
- update only when behavior is intentionally changed
- avoid bulk regeneration

### Integration environment fails to start

Check:

- required tools and versions
- port conflicts
- stale containers or local state
- missing environment variables
- service health
- migration status
- filesystem permissions

Add project-specific recurring problems below.

| Symptom | Cause | Resolution |
|---|---|---|
| <symptom> | <cause> | <resolution> |

## Agent testing guidance

Before changing behavior, a coding agent should:

1. read this document and applicable path-specific instructions
2. inspect nearby tests and test helpers
3. identify the appropriate test level
4. determine required services and commands
5. preserve existing test conventions
6. add tests alongside implementation
7. run the narrowest relevant test first
8. inspect failures rather than blindly retrying
9. run broader practical validation before completion
10. report exact commands and results

An agent must not:

- claim tests passed when they were not run
- mark failures pre-existing without evidence
- weaken or remove assertions to obtain a pass
- accept snapshot changes without inspection
- use real secrets or production data
- contact production services
- run destructive migrations
- leave skipped tests without explanation
- conceal residual validation risk

## Definition of tested

A change is adequately tested when:

- required behavior has appropriate automated or reproducible manual coverage
- relevant failure paths and boundaries are covered
- regression risk is addressed
- applicable security and authorization behavior is checked
- relevant integration and contract behavior is verified
- test data is safe and isolated
- targeted tests pass
- broader practical checks pass or limitations are documented
- acceptance criteria have evidence
- unresolved failures and untested areas are visible

This definition complements `docs/DEFINITION_OF_DONE.md`.

## Maintenance

Review this document when:

- test frameworks or configuration change
- commands or scripts change
- test directories or naming conventions change
- new test levels are introduced
- CI jobs or required checks change
- external test services change
- coverage or quality gates change
- flaky tests become recurring
- release validation changes
- agents repeatedly choose the wrong test level or command

During review:

- execute or verify documented commands
- verify paths and configuration
- remove unsupported test levels
- update ownership
- remove stale troubleshooting advice
- verify no secrets or sensitive data are included
- update the last-reviewed date
