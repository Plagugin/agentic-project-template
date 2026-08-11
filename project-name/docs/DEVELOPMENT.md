# Development Guide

This document explains how to set up, run, modify, validate, and troubleshoot the project in a local development environment.

It is intended for developers, reviewers, maintainers, and coding agents. Keep every command executable and aligned with the current repository. Architecture belongs in `ARCHITECTURE.md`; detailed testing strategy belongs in `TESTING.md`; production operations belong in runbooks or deployment documentation.

Replace every `<...>` placeholder before treating this document as authoritative. Remove sections that do not apply.

## Document status

- **Project:** <project name>
- **Owners:** <team, role, or individuals>
- **Last reviewed:** <YYYY-MM-DD>
- **Supported development platforms:** <operating systems or environments>
- **Primary development environment:** <local host, container, dev container, virtual machine, or remote workspace>
- **Related documents:**
  - `README.md`
  - `docs/PROJECT_CONTEXT.md`
  - `docs/ARCHITECTURE.md`
  - `docs/TESTING.md`
  - `docs/SECURITY.md`
  - `CONTRIBUTING.md`
  - `AGENTS.md`

Remove references to files that do not exist.

## Quick start

A new contributor should be able to use this section without reading the entire guide.

### Prerequisites

- <runtime and version>
- <package manager and version>
- <required development tool>
- <required local service>
- <supported operating system or shell>

### Setup

```sh
<clone or initial setup command>
<dependency installation command>
<configuration initialization command>
```

### Run locally

```sh
<local run command>
```

### Run the fastest relevant checks

```sh
<format check command>
<lint command>
<type-check command>
<targeted or unit-test command>
```

### Run CI-equivalent validation

```sh
<CI-equivalent validation command>
```

### Expected local addresses

| Service | Address | Purpose |
|---|---|---|
| <service> | `<address>` | <purpose> |

## Supported environments

### Operating systems

| Platform | Status | Notes |
|---|---|---|
| <platform> | Supported / Best effort / Unsupported | <notes> |

### Runtime and tool versions

| Tool | Required version | Source of truth | Verification command |
|---|---|---|---|
| <runtime> | <version or range> | `<file>` | `<command>` |
| <package manager> | <version> | `<file>` | `<command>` |
| <build tool> | <version> | `<file>` | `<command>` |

Prefer repository-managed version files such as:

- `.tool-versions`
- `.nvmrc`
- `.node-version`
- `.python-version`
- `global.json`
- `gradle-wrapper.properties`
- `go.mod`
- `rust-toolchain.toml`
- container or dev-container definitions

Do not duplicate versions here unless the repository has a clear source of truth.

## Repository setup

### Obtain the source

```sh
git clone <repository URL>
cd <repository directory>
```

Document any required submodules, large-file storage, sparse checkout, or authentication.

### Initialize repository dependencies

```sh
<dependency installation command>
```

State whether the command:

- is deterministic
- uses a lockfile
- modifies generated files
- requires network access
- requires private registries
- requires authentication

### Optional bootstrap command

When the repository provides a single bootstrap script, prefer it:

```sh
<bootstrap command>
```

Describe what it changes and whether it is safe to rerun.

### Verify setup

```sh
<version verification command>
<basic project health command>
```

Expected result:

```text
<concise expected output or success condition>
```

## Development environment options

### Native local setup

Use this option when:

- <condition>
- <condition>

Setup:

```sh
<native setup commands>
```

Limitations:

- <limitation>
- <limitation>

### Development container

Use this section only when a dev container exists.

- **Configuration:** `<path>`
- **Required host tools:** <tools>
- **Startup method:** <method>

```sh
<dev-container startup command, if applicable>
```

Document:

- mounted directories
- forwarded ports
- persisted volumes
- user permissions
- container rebuild triggers
- credentials handling

### Container-based local stack

Use this section when local dependencies are started with containers.

- **Configuration:** `<compose or orchestration path>`

```sh
<container stack start command>
```

To stop:

```sh
<container stack stop command>
```

To remove disposable local state:

```sh
<safe local cleanup command>
```

Clearly label destructive cleanup commands and specify exactly which local data they remove.

### Remote development

Use this section only when supported.

Document:

- supported service
- authentication
- workspace creation
- repository access
- port forwarding
- secret injection
- resource limits
- cleanup
- differences from local development

## Project structure

Provide a concise orientation map.

| Path | Purpose | Edit manually |
|---|---|---|
| `<path>` | <purpose> | Yes / No |
| `<path>` | <purpose> | Yes / No |
| `docs/` | Project documentation | Yes |
| `<generated path>` | Generated code or assets | No |

For monorepositories:

| Package or service | Path | Local command | Dependencies |
|---|---|---|---|
| <name> | `<path>` | `<command>` | <dependencies> |

Reference `docs/ARCHITECTURE.md` for component responsibilities and dependency boundaries.

## Configuration

### Configuration sources

Document precedence from highest to lowest:

1. <command-line arguments or runtime override>
2. <environment variables>
3. <local configuration file>
4. <shared default configuration>
5. <compiled defaults>

### Local configuration files

| File | Purpose | Committed | Contains secrets |
|---|---|---|---|
| `<file>` | <purpose> | Yes / No | Yes / No |

Provide a safe initialization command:

```sh
<copy example configuration command>
```

Do not instruct contributors to commit secrets.

### Environment variables

| Variable | Required | Default | Purpose | Sensitive |
|---|---|---|---|---|
| `<NAME>` | Yes / No | `<default or none>` | <purpose> | Yes / No |

For sensitive variables, document only their purpose and source. Do not include real values.

### Configuration validation

```sh
<configuration validation command>
```

Describe startup behavior when configuration is missing or invalid.

### Feature flags

| Flag | Default locally | Purpose | Source |
|---|---|---|---|
| `<flag>` | On / Off | <purpose> | <source> |

Document how to reset flags and which combinations are supported.

Use `Not applicable` if the project has no feature flags.

## Secrets and credentials

### Approved sources

Use:

- <local secret manager>
- <environment injection mechanism>
- <credential helper>
- <development-only token process>

Never store secrets in:

- committed configuration
- source files
- tests or snapshots
- documentation
- shell history where avoidable
- prompt or agent instruction files
- shared logs

### Authentication setup

```sh
<authentication command>
```

Document:

- required account or role
- scope of access
- expiry
- renewal
- logout or cleanup
- safe verification

### Private package registries

| Registry | Purpose | Authentication method | Configuration |
|---|---|---|---|
| <registry> | <purpose> | <method> | `<path>` |

Avoid placing credentials directly in package-manager configuration committed to the repository.

## Dependencies

### Install dependencies

```sh
<dependency installation command>
```

### Update dependencies

```sh
<dependency update command>
```

State the project's policy:

- whether dependency updates require a separate change
- whether lockfiles must be committed
- whether transitive updates are acceptable
- required security or license checks
- supported runtime compatibility
- prohibited dependency categories

### Add a dependency

Before adding one:

1. Confirm existing project or standard-library functionality is insufficient.
2. Check compatibility with supported runtimes and platforms.
3. Review maintenance, security, and license requirements.
4. Add it through the project's package manager.
5. Update the correct manifest and lockfile.
6. Add relevant tests.
7. Document configuration or operational impact.

Command:

```sh
<add dependency command>
```

### Remove a dependency

```sh
<remove dependency command>
```

Verify that unused imports, configuration, build steps, generated artifacts, and documentation are also removed.

### Dependency checks

```sh
<outdated dependency command>
<security audit command>
<license check command>
```

Label checks that require network access or private registry credentials.

## Local services and infrastructure

### Required services

| Service | Purpose | Required for | Local implementation |
|---|---|---|---|
| <service> | <purpose> | <workflow> | Native / Container / Remote / Fake |

### Start services

```sh
<service startup command>
```

### Verify services

```sh
<service health command>
```

### Stop services

```sh
<service stop command>
```

### Reset local service state

```sh
<safe reset command>
```

State exactly what is deleted. Never present a destructive reset as a routine command without warning.

### External integrations

For each integration used during development, document:

- whether a sandbox exists
- required credentials
- local fake or mock option
- test-data restrictions
- rate limits
- state-changing behavior
- cleanup procedure
- prohibited use of production data

Prefer local fakes and sandbox environments.

## Database and persisted local state

Use this section only when applicable.

### Local database

- **Technology:** <database>
- **Startup:** `<command>`
- **Connection configuration:** `<source>`
- **Local data classification:** <classification>

### Create or initialize

```sh
<database initialization command>
```

### Apply migrations

```sh
<migration command>
```

### Create a migration

```sh
<create migration command>
```

### Seed development data

```sh
<seed command>
```

Describe whether seed data is synthetic and safe to share.

### Reset local data

```sh
<local-only reset command>
```

Warning:

> This command removes <exact local data>. It must not be used against shared, staging, or production environments.

### Inspect migration status

```sh
<migration status command>
```

### Migration development rules

- Keep migrations deterministic.
- Preserve compatibility required by the deployment process.
- Consider partial failure and restart behavior.
- Do not edit an already-released migration unless repository policy explicitly permits it.
- Add migration tests or validation where supported.
- Document rollback or forward-recovery behavior.
- Never run migrations against shared or production-like environments without explicit authorization.

## Build

### Development build

```sh
<development build command>
```

### Production or release build

```sh
<release build command>
```

### Build outputs

| Output | Path | Committed | Purpose |
|---|---|---|---|
| <output> | `<path>` | Yes / No | <purpose> |

### Clean build outputs

```sh
<safe clean command>
```

State whether this removes caches, downloaded dependencies, generated files, or local state.

### Build profiles

| Profile | Purpose | Command |
|---|---|---|
| <profile> | <purpose> | `<command>` |

### Build troubleshooting

| Symptom | Likely cause | Resolution |
|---|---|---|
| <symptom> | <cause> | <resolution> |

## Run locally

### Main application or service

```sh
<run command>
```

Expected:

- **Address:** `<address>`
- **Health check:** `<address or command>`
- **Startup indicator:** <log line or behavior>

### Run with development reload

```sh
<watch or reload command>
```

### Run a specific package or service

```sh
<package-specific command>
```

### Run a background worker

```sh
<worker command>
```

### Run a scheduled job manually

```sh
<job command>
```

Document required inputs and whether it changes state.

### Run a command-line interface

```sh
<CLI command>
```

### Stop the application

```sh
<stop command or process>
```

## Code generation

Use this section when generated code, schemas, clients, assets, or documentation exist.

### Generated artifacts

| Artifact | Source | Command | Output path |
|---|---|---|---|
| <artifact> | `<source>` | `<command>` | `<path>` |

### Generate

```sh
<generation command>
```

### Verify generated content

```sh
<generation consistency command>
```

Rules:

- Modify the source definition, not generated output.
- Use the documented generator version.
- Review generated diffs.
- Commit generated output only when repository policy requires it.
- Do not regenerate unrelated artifacts.
- Do not manually patch generated files unless explicitly documented.

## Formatting

### Apply formatting

```sh
<format command>
```

### Check formatting without changing files

```sh
<format check command>
```

### Scope formatting to changed files

```sh
<targeted format command>
```

Avoid formatting unrelated files.

## Linting and static analysis

### Lint

```sh
<lint command>
```

### Lint a specific file or package

```sh
<targeted lint command>
```

### Type checking

```sh
<type-check command>
```

### Additional static analysis

```sh
<static analysis command>
```

Document configuration paths and whether warnings fail CI.

Do not suppress warnings globally to make a change pass. Fix the cause or document a narrowly justified exception.

## Testing

Detailed strategy belongs in `docs/TESTING.md`.

### Fast local tests

```sh
<fast test command>
```

### Targeted test

```sh
<targeted test command>
```

### Full test suite

```sh
<full test command>
```

### Integration tests

```sh
<integration test command>
```

### End-to-end tests

```sh
<end-to-end command>
```

### Test prerequisites

| Test type | Required service or setup | Command |
|---|---|---|
| <type> | <prerequisite> | `<command>` |

### Coverage

```sh
<coverage command>
```

State how coverage is interpreted and whether thresholds exist.

### CI-equivalent validation

```sh
<CI-equivalent command>
```

A contributor should run this before requesting review when practical.

## Debugging

### Recommended debugger

- **Tool:** <debugger>
- **Configuration:** `<path>`
- **Launch method:** <method>

### Debug the main process

```sh
<debug command>
```

### Debug tests

```sh
<test debug command>
```

### Useful local diagnostics

```sh
<diagnostic command>
```

### Log configuration

- **Framework:** <framework>
- **Local level:** <level>
- **Configuration:** `<path>`
- **Correlation identifier:** <field>
- **Sensitive-data restrictions:** <rules>

### Common debugging workflows

#### Request or command failure

1. <step>
2. <step>
3. <step>

#### Integration failure

1. <step>
2. <step>
3. <step>

#### Data inconsistency

1. <step>
2. <step>
3. <step>

Do not recommend bypassing security, validation, or authorization as a debugging shortcut.

## Development workflows

### Implement a feature

1. Confirm the demand and acceptance criteria.
2. Read relevant project context and architecture.
3. Inspect existing implementation and tests.
4. Prepare or review an implementation plan for substantial work.
5. Make the smallest coherent change.
6. Add or update tests.
7. Run targeted validation.
8. Run broader practical checks.
9. Review the final diff.
10. Update documentation.

### Correct a defect

1. Reproduce the issue.
2. Identify the cause.
3. Add a regression test that demonstrates the failure when practical.
4. Implement the narrowest safe correction.
5. Run targeted and regression checks.
6. Review adjacent behavior for risk.
7. Document user-visible or operational changes.

### Modify an API or event

1. Identify all producers and consumers.
2. Confirm compatibility requirements.
3. Update the source schema or contract.
4. Regenerate derived artifacts through supported commands.
5. Update implementation and tests.
6. Validate compatibility.
7. Document versioning, rollout, and migration.

### Modify persisted data

1. Confirm data ownership and migration requirements.
2. Plan deployment ordering and compatibility.
3. Create a deterministic migration.
4. Test representative and edge-case data.
5. Validate partial failure and recovery.
6. Document rollout and rollback or forward recovery.
7. Do not apply to shared environments without authorization.

### Update documentation only

1. Verify current implementation and commands.
2. Modify the authoritative document.
3. Check links and examples.
4. Avoid documenting unimplemented behavior.

## Branches, commits, and pull requests

Use this section to document repository policy, not to authorize automatic remote actions.

### Branch naming

```text
<pattern>
```

### Commit convention

```text
<convention>
```

### Pull-request expectations

- <required description>
- <linked issue or demand>
- <test evidence>
- <migration or rollout notes>
- <security or privacy review>
- <screenshots or recordings, if applicable>

Coding agents must not commit, push, open pull requests, merge, publish, release, or deploy unless explicitly requested.

## CI/CD

### Workflow locations

| Workflow | Path | Purpose |
|---|---|---|
| <workflow> | `<path>` | <purpose> |

### Required checks

| Check | Local equivalent | Required |
|---|---|---|
| <check> | `<command>` | Yes / No |

### CI-only behavior

Document checks that cannot be reproduced locally and how to interpret failures.

### Artifacts

| Artifact | Produced by | Retention | Purpose |
|---|---|---|---|
| <artifact> | <workflow> | <retention> | <purpose> |

### Release process

Reference release documentation:

- `<path>`

Do not embed credentials, environment identifiers, or sensitive production procedures here when a restricted runbook is more appropriate.

## Troubleshooting

### Setup problems

| Symptom | Cause | Resolution |
|---|---|---|
| <symptom> | <cause> | <resolution> |

### Dependency problems

| Symptom | Cause | Resolution |
|---|---|---|
| <symptom> | <cause> | <resolution> |

### Build problems

| Symptom | Cause | Resolution |
|---|---|---|
| <symptom> | <cause> | <resolution> |

### Test problems

| Symptom | Cause | Resolution |
|---|---|---|
| <symptom> | <cause> | <resolution> |

### Local-service problems

| Symptom | Cause | Resolution |
|---|---|---|
| <symptom> | <cause> | <resolution> |

### Platform-specific problems

| Platform | Symptom | Resolution |
|---|---|---|
| <platform> | <symptom> | <resolution> |

Keep troubleshooting entries reproducible and remove obsolete workarounds.

## Safe cleanup

List only commands that are safe for disposable local development state.

| Command | Removes | Preserves | Warning |
|---|---|---|---|
| `<command>` | <items> | <items> | <warning> |

Never include production or shared-environment cleanup commands in this section.

## Validation checklist

Before considering a development change ready:

- [ ] The project builds or starts as expected.
- [ ] Formatting is correct.
- [ ] Linting and static analysis pass.
- [ ] Type checking passes where applicable.
- [ ] Relevant tests pass.
- [ ] Broader regression checks were run where practical.
- [ ] Generated artifacts are synchronized.
- [ ] Migration behavior is validated where applicable.
- [ ] Security and privacy implications were considered.
- [ ] Documentation is updated.
- [ ] The final diff contains no unintended changes.
- [ ] Commands not run and residual risks are documented.

Use `docs/DEFINITION_OF_DONE.md` as the authoritative completion checklist when present.

## Contributor onboarding verification

A new contributor should be able to:

- identify required tools and versions
- configure the project without receiving secrets in chat
- install dependencies
- start required local services
- run the project
- run a targeted test
- run formatting, linting, and type checking
- generate required artifacts
- understand safe local cleanup
- locate troubleshooting information
- identify which actions require explicit authorization

If any step requires undocumented tribal knowledge, add it to the appropriate section.

## Agent guidance

Before changing files, a coding agent should:

1. Read applicable instructions.
2. Inspect repository status and preserve existing changes.
3. Use this document to select supported commands.
4. Verify commands against manifests or scripts when the document may be stale.
5. Prefer targeted checks during implementation.
6. Run the broadest practical validation before completion.
7. Report actual commands and outcomes.
8. Never claim a command passed when it was not run.
9. Never execute destructive, remote, or production-affecting commands without explicit authorization.

When this document and repository scripts disagree, surface the discrepancy and treat executable repository configuration as evidence of current behavior until the documentation is corrected.

## Maintenance

Review this document when:

- supported tools or runtime versions change
- setup steps change
- new required services are introduced
- configuration or secret handling changes
- build, test, lint, formatting, or generation commands change
- CI workflows change
- migration procedures change
- onboarding repeatedly fails at the same step
- obsolete workarounds remain documented
- coding agents repeatedly guess commands incorrectly

During review:

- execute commands from a clean or representative environment
- verify versions and paths
- remove obsolete instructions
- mark destructive commands clearly
- verify secrets are not included
- update the last-reviewed date
