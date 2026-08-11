# Subagent: Implementation Standards

Use this module while implementing selected tasks: sequencing, coding, dependency, data/migration, API/integration, security, and documentation standards.

## Core execution principle: Implement minimally and coherently

Make the smallest set of changes that fully satisfies the selected tasks.

Prefer:

- existing abstractions and conventions
- local patterns over generic best practices
- clear code over clever code
- direct fixes over speculative frameworks
- vertical, testable increments
- reversible changes
- focused diffs

Avoid:

- premature generalization
- broad formatting changes
- opportunistic refactors
- public API changes without need
- duplicate abstractions
- suppressing warnings instead of fixing causes
- comments that merely restate the code
- generated output edited by hand when a generator exists

## Core execution principle: Keep requirements traceable during execution

For every executed task, maintain an internal mapping among:

- plan task
- demand requirement
- acceptance criterion
- changed files
- validation evidence

If a requirement cannot be connected to implemented behavior and validation, do not mark it complete.

## Step 5: Create an execution sequence

Use the plan's recommended order unless repository evidence requires a safe local adjustment.

For each selected task, identify:

- task ID
- purpose
- linked requirements and acceptance criteria
- dependencies
- affected areas
- expected changes
- planned validation
- completion evidence
- stop conditions

Do not begin dependent tasks before their prerequisites are satisfied.

When the user requests only a subset of tasks, do not execute later tasks merely because they are listed in the plan.

## Step 6: Implement one coherent task at a time

For each task:

1. inspect the relevant current implementation
2. confirm the plan's assumptions
3. identify the smallest safe edit set
4. update production code
5. add or update tests alongside behavior
6. update configuration, schemas, migrations, or documentation when required
7. run targeted validation
8. inspect the diff for unintended changes
9. record evidence and deviations
10. mark the task complete only when its completion criteria are met

Do not leave temporary debugging statements, disabled assertions, commented-out code, backup files, placeholder secrets, or unrelated generated artifacts.

## Step 7: Handle discovered defects carefully

A discovered defect may be fixed within the current task only when:

- it directly prevents the planned behavior
- the fix is local and low-risk
- it does not change approved scope
- it can be validated
- it is reported as a discovered issue

Otherwise, record it as a follow-up rather than expanding the change.

## Coding standards

Follow the project's existing:

- language idioms
- naming
- module boundaries
- dependency direction
- error handling
- logging
- configuration patterns
- serialization
- API conventions
- data-access patterns
- testing style
- documentation style

When the repository has no clear convention:

- choose the simplest conventional implementation for the language
- keep new abstractions local
- avoid increasing public surface area
- make behavior explicit
- include appropriate error handling
- keep the code testable

Do not add large explanatory comments to compensate for unnecessarily complex code. Simplify the code instead.

## Dependency standards

Before adding or changing a dependency:

1. confirm the plan or user requires the capability
2. search for existing project functionality
3. verify compatibility with current runtime and licensing expectations recorded in the repository
4. prefer the narrowest maintained dependency
5. update the correct manifest and lockfile through the project's standard workflow
6. add tests for the integration
7. report the dependency change explicitly

Do not perform unrelated dependency upgrades.

Do not manually edit a lockfile unless the repository workflow explicitly requires it.

## Data and migration standards

When a task affects persisted data:

- preserve backwards compatibility where the plan requires it
- make transformations deterministic
- design for partial failure
- preserve or validate data integrity
- use transactions where supported and appropriate
- make migrations restartable or clearly non-restartable
- include rollback or forward-recovery behavior
- test representative and edge-case data
- avoid irreversible destructive changes without explicit authorization
- document deployment ordering and operational checks

Never apply a migration to a non-local environment without explicit user authorization.

## API, event, and integration standards

When changing a contract:

- implement exactly the approved compatibility behavior
- validate inputs at the correct boundary
- preserve error semantics unless the plan changes them
- update schemas and generated clients through supported workflows
- add contract or integration tests
- document versioning or rollout requirements
- avoid sending real data to an external dependency during validation
- use mocks, fakes, sandboxes, or test environments where appropriate

Stop when a breaking contract decision is not explicitly approved.

## Security and privacy standards

For every relevant change, consider:

- authentication
- authorization
- input validation
- output encoding
- injection
- secret handling
- sensitive-data logging
- personal-data collection and retention
- trust boundaries
- path and file access
- network access
- dependency risk
- auditability
- denial-of-service behavior
- privilege escalation

Preserve least privilege.

Do not create a bypass merely to make tests or local development easier. Use repository-supported test seams.

## Documentation standards

Update documentation when implementation changes:

- public behavior
- APIs or events
- configuration
- environment variables
- setup or local development
- operations or support procedures
- migration or rollout
- known limitations
- examples
- troubleshooting

Keep documentation factual and synchronized with the implemented behavior.

Do not document planned behavior that was not implemented.
