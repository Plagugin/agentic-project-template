# Repository Copilot Instructions

These instructions apply to all Copilot work performed in this repository.

Use the repository's actual files, documentation, tests, and configuration as evidence. Do not infer project-specific facts from this template. Replace every `<...>` placeholder before relying on this file, and remove sections that do not apply.

## Repository overview

- **Project:** <project name>
- **Purpose:** <one or two sentences describing what the project does>
- **Primary users:** <users, operators, services, or stakeholders>
- **Primary languages:** <languages>
- **Frameworks and runtimes:** <frameworks and supported versions>
- **Package/build tools:** <package managers and build systems>
- **Deployment target:** <runtime or hosting environment>
- **Repository type:** <single application, library, service, monorepo, infrastructure, or other>

## Authoritative project documentation

Read only the documents relevant to the current task:

- Read `docs/PROJECT_CONTEXT.md` when requirements, terminology, ownership, or project boundaries matter.
- Read `docs/ARCHITECTURE.md` before architectural or cross-component changes.
- Read `docs/DEVELOPMENT.md` for setup, build, generation, and development commands.
- Read `docs/TESTING.md` before adding or modifying tests.
- Read `docs/SECURE_DEVELOPMENT.md` for security-sensitive changes.
- Read `docs/DEFINITION_OF_DONE.md` before reporting substantial work as complete.
- Read applicable accepted decisions under `docs/adr/` before revisiting architectural choices.

Remove any reference whose file does not exist. When documentation conflicts with the current repository, identify the discrepancy rather than silently choosing one interpretation.

Use the following order of authority for project-specific guidance:

1. explicit instructions in the current request
2. security, privacy, compliance, and data-protection requirements
3. applicable nested `AGENTS.md` or path-specific instruction files
4. this repository-wide instruction file
5. contribution and development documentation
6. established source-code and test conventions
7. reasonable engineering judgment

## Repository map

Use this as an orientation aid. Verify paths before relying on them.

| Area | Path | Responsibility |
|---|---|---|
| Application or library source | `<path>` | <responsibility> |
| Tests | `<path>` | <test scope> |
| Configuration | `<path>` | <responsibility> |
| Database or schemas | `<path>` | <responsibility> |
| Infrastructure or deployment | `<path>` | <responsibility> |
| Documentation | `docs/` | Project documentation |
| Generated code | `<path or none>` | <generator and ownership> |

For monorepositories, also document package or service boundaries:

| Package or service | Path | Responsibility | May depend on |
|---|---|---|---|
| <name> | `<path>` | <responsibility> | <allowed dependencies> |

Do not create dependencies that violate these boundaries.

## Architecture and invariants

Follow the current architecture described in `docs/ARCHITECTURE.md` and verified in the repository.

Preserve these critical invariants:

- <invariant that must remain true>
- <domain or data-integrity rule>
- <security or authorization rule>
- <compatibility guarantee>
- <dependency-direction rule>

Do not introduce a new framework, service, datastore, queue, architectural layer, or cross-cutting abstraction unless the task explicitly requires it and the decision is documented.

When a task requires a material architectural decision, prepare or update an architecture decision record under `docs/adr/` when the repository's process requires one.

## Scope and change discipline

- Implement only the requested behavior and necessary supporting changes.
- Prefer the smallest coherent change that satisfies the acceptance criteria.
- Search for existing implementations, utilities, and patterns before creating new ones.
- Do not include unrelated refactoring, cleanup, formatting, renaming, modernization, or dependency upgrades.
- Preserve public interfaces and persisted-data compatibility unless a breaking change is explicitly approved.
- Treat generated files according to the documented generation workflow.
- Keep changes inside the owning component unless an evidenced cross-component change is necessary.
- Surface contradictions, missing decisions, and material assumptions before making irreversible changes.

## Coding conventions

Follow existing code in the nearest relevant module. In addition:

- **Formatting:** <formatter and command>
- **Linting:** <linter and command>
- **Type checking:** <tool and command>
- **Naming:** <important naming conventions>
- **Error handling:** <project convention>
- **Logging:** <project convention and prohibited data>
- **Configuration:** <configuration convention>
- **Dependency injection or composition:** <project convention>
- **Asynchronous behavior:** <project convention>
- **Comments and documentation:** <project convention>

Prefer clear, direct code. Do not add an abstraction for a single use unless it materially improves correctness, testability, or consistency with established design.

## Commands

Use the repository-provided scripts and documented commands. Do not invent substitute workflows when an official one exists.

### Setup

```sh
<setup command>
```

### Run locally

```sh
<local run command>
```

### Targeted tests

```sh
<targeted test command>
```

### Complete test suite

```sh
<complete test command>
```

### Format

```sh
<format command>
```

### Lint

```sh
<lint command>
```

### Type-check or static analysis

```sh
<type-check command>
```

### Build or package

```sh
<build command>
```

### CI-equivalent validation

```sh
<CI-equivalent command>
```

When a command depends on optional services, credentials, containers, operating systems, or environment variables, document that prerequisite in `docs/DEVELOPMENT.md` or `docs/TESTING.md`.

## Testing expectations

Follow `docs/TESTING.md` and existing test patterns.

- Add or update tests whenever observable behavior changes.
- Add regression coverage for corrected defects.
- Test relevant success, failure, validation, authorization, and boundary cases.
- Prefer behavior-oriented assertions over private implementation details.
- Reuse established fixtures, factories, fakes, and helpers.
- Inspect snapshot and generated-output changes before accepting them.
- Do not delete, disable, weaken, or broadly rewrite tests merely to obtain a passing result.
- Run targeted checks during implementation and the strongest practical broader validation before completion.
- Report commands that were not run and explain why.

Test locations:

| Test type | Path | Naming convention |
|---|---|---|
| Unit | `<path>` | <pattern> |
| Integration | `<path>` | <pattern> |
| Contract | `<path or not applicable>` | <pattern> |
| End-to-end | `<path or not applicable>` | <pattern> |

## Data, APIs, and integrations

When relevant:

- **System of record:** <system or component>
- **Database and migration tool:** <technology>
- **API or schema specification:** `<path>`
- **Event or message contracts:** `<path or not applicable>`
- **External integrations:** <systems>
- **Compatibility policy:** <policy>
- **Migration policy:** <policy>
- **Rollback or recovery policy:** <policy>

Preserve data integrity and compatibility requirements. Do not run migrations or destructive operations against shared, staging, or production environments without explicit authorization.

Validate contract changes with the repository's established schema, contract, integration, or consumer tests.

## Security and privacy

Follow `docs/SECURITY.md` and applicable organizational requirements.

- Preserve authentication and authorization boundaries.
- Enforce authorization on trusted server-side or service boundaries.
- Validate untrusted input at the appropriate boundary.
- Do not log secrets, credentials, tokens, personal data, or sensitive payloads.
- Use the project's approved secret and configuration mechanisms.
- Preserve least privilege.
- Add negative tests for relevant unauthorized and malformed requests.
- Escalate material trust-boundary, cryptographic, personal-data, or privilege changes for review.
- Never place real secrets or sensitive production data in source, tests, fixtures, prompts, or documentation.

Security-sensitive areas:

| Area | Path | Required review or checks |
|---|---|---|
| Authentication | `<path>` | <requirements> |
| Authorization | `<path>` | <requirements> |
| Sensitive data | `<path>` | <requirements> |
| Secrets/configuration | `<path>` | <requirements> |

## Generated files and dependencies

Generated content:

| Generated path | Source | Generation command | Manual editing |
|---|---|---|---|
| `<path>` | `<source>` | `<command>` | Prohibited / Allowed |

Before changing dependencies:

- use existing project or standard-library capabilities where suitable
- add only dependencies required by the task
- avoid unrelated upgrades
- update manifests and lockfiles through the normal package-manager workflow
- verify runtime, licensing, and platform compatibility required by the project
- report the reason for each dependency change

## Documentation

Update documentation when implementation changes:

- public behavior
- APIs, events, or schemas
- configuration or environment variables
- installation or local development
- migration or deployment procedures
- operational diagnostics
- known limitations
- user-facing workflows

Document implemented behavior only. Keep commands executable and links repository-relative.

## Version-control and remote actions

- Inspect the working-tree status and diff before editing.
- Preserve pre-existing user changes.
- Do not use destructive Git commands or rewrite history.
- Do not commit, push, merge, publish, deploy, release, open a pull request, create remote issues, or modify remote systems unless explicitly requested.
- Do not include generated, temporary, secret, local-environment, or unrelated files in the change.
- Follow the repository's commit and pull-request conventions only when those actions are requested.

## Definition of done

A change is complete only when:

- the requested behavior and applicable acceptance criteria are implemented
- repository architecture and invariants are preserved
- relevant tests are added or updated
- applicable formatting, linting, analysis, tests, and builds pass or limitations are reported
- security, privacy, compatibility, migration, and operational effects are addressed
- required documentation is current
- the final diff contains no known unrelated or accidental changes
- validation results, deviations, assumptions, and unresolved risks are reported truthfully

See @../docs/DEFINITION_OF_DONE.md for the detailed project checklist.

## Completion response

At completion, summarize:

- status
- behavior implemented
- important files changed
- tests and validation actually run, with results
- acceptance criteria verified
- deviations or local adaptations
- preserved pre-existing changes when relevant
- remaining blockers, failures, risks, or follow-up work

Do not claim success for work or validation that was not performed.
