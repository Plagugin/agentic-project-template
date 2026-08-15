# Subagent: Evidence Gathering

Use this module first, before any document is customized: determining the git-tracking mode for the agentic-workflow files, determining the approved target set, reading applicable instructions, building the evidence inventory, and detecting template residue in existing files.

## Step 0: Determine the git-tracking mode for the agentic-workflow files

Do this before touching any document, and before Step 1.

Check `.git/info/exclude` for entries matching the candidate list below. If matching entries already exist, the decision was already made in a prior run; skip the question and proceed silently under that mode.

Otherwise, ask the user whether the files this template adds (agent profiles, `AGENTS.md`, `demands/`, `plans/`, `feedback/`, `dev-notes/`, and the `docs/` set) should ever be committed to this repository's shared Git history, or must stay local to the current user only and never be shared through Git or any other channel. This matters most when the template is being dropped into an already-existing project rather than used to start a new one.

When the answer is local-only:

- Identify which of the candidate paths were actually introduced by the template on top of the existing project. Do not exclude a path the project already tracked before the template arrived (for example, a pre-existing `AGENTS.md` you are extending); keep that tracked and instead steer any content that must stay private into an excluded path such as `dev-notes/`.
- Append the applicable paths to `.git/info/exclude` — a per-clone file that Git never commits, tracks, or shares with collaborators — not the project's own `.gitignore`, which is shared and would itself leak the decision. This is a plain local text-file edit, not an application or Git-history change, so it is within this agent's edit scope.
- Candidate paths:
  ```
  .github/agents/
  .github/copilot-instructions.md
  AGENTS.md
  demands/
  plans/
  feedback/
  dev-notes/
  docs/adr/
  docs/templates/
  docs/PROJECT_CONTEXT.md
  docs/ARCHITECTURE.md
  docs/DEVELOPMENT.md
  docs/TESTING.md
  docs/SECURITY.md
  docs/DEFINITION_OF_DONE.md
  ```
- If any candidate path is already tracked or staged, tell the user to run `git rm -r --cached <path>` themselves before continuing — this agent has no execute tool and must not run Git commands, only edit files.
- Do not proceed to customize a document whose tracking status is still unresolved; deciding up front is far cheaper than untangling an accidental commit later.

When the answer is shared/tracked (the default for a project freshly created from the template with no prior history), make no `.git/info/exclude` changes and proceed as normal.

## Evidence model

Classify information as one of:

- **Confirmed** — directly supported by repository content or explicit user input
- **Inferred** — strongly suggested by multiple repository signals but not explicitly documented
- **Unknown** — cannot be determined reliably from available evidence
- **Potentially stale** — documented information conflicts with newer repository evidence
- **Not applicable** — the topic was considered and does not apply

Use confirmed information in authoritative prose.

For inferred information:

- phrase it carefully
- identify the supporting evidence
- mark it for review when material

For unknown information:

- use `Not yet confirmed`
- add a focused open question when the gap matters
- do not fill the gap with generic assumptions

## Repository evidence sources

Inspect the highest-value sources first.

### Existing instructions and documentation

- `.github/copilot-instructions.md`
- `AGENTS.md` and nested `AGENTS.md` files
- `CLAUDE.md` or `GEMINI.md`, when present
- `README.md`
- `CONTRIBUTING.md`
- `docs/`
- architecture decision records
- runbooks and operational documentation

### Project and dependency manifests

Examples include:

- `package.json`
- workspace configuration
- lockfiles
- `pyproject.toml`
- `requirements*.txt`
- `Pipfile`
- `poetry.lock`
- `go.mod`
- `Cargo.toml`
- `.csproj`, `.sln`, and `global.json`
- `pom.xml`
- Gradle files
- build-system manifests
- container definitions
- infrastructure manifests

Use the actual repository formats. Do not assume a language or build system.

### Scripts and task definitions

Inspect:

- package scripts
- `Makefile`
- task runners
- shell or PowerShell scripts
- build files
- development-container configuration
- compose files
- generator definitions
- migration tooling

Document commands exactly as defined. Do not synthesize commands merely because they are conventional.

### Continuous integration and delivery

Inspect:

- `.github/workflows/`
- other CI configuration
- build pipelines
- quality gates
- release workflows
- deployment definitions
- required checks
- artifact creation

Use CI as evidence for supported validation commands, but distinguish CI-only operations from safe local workflows.

### Source and tests

Inspect enough source and test code to identify:

- entry points
- major modules and responsibilities
- dependency direction
- public and internal interfaces
- data ownership and persistence
- integrations
- error-handling patterns
- authentication and authorization boundaries
- logging and observability conventions
- test levels, locations, naming, fixtures, and frameworks
- generated files

Do not perform an exhaustive code review when targeted inspection is sufficient.

### Configuration and environment examples

Inspect:

- committed example environment files
- configuration schemas
- default configuration
- secret-management references
- feature-flag configuration
- local service definitions

Never copy actual secret values into documentation.

## Step 1: Determine the approved target set

Use this precedence:

1. explicit files named by the user
2. files containing obvious template placeholders
3. the standard approved documentation scope
4. existing related documentation that the user asked to refresh

List the selected files internally before editing.

When a requested target file does not exist:

- create it only when its purpose is clear
- use an available matching template when possible
- do not create a large documentation tree merely because the standard set lists it
- report files deliberately not created

## Step 2: Read applicable instructions

Before editing:

- locate instruction files from the repository root to each target path
- read existing Copilot and agent instructions
- identify project-specific documentation conventions
- identify generated or managed documentation that must not be edited manually

Do not create instructions that contradict already applicable instructions.

## Step 3: Build an evidence inventory

Create an internal inventory covering:

- project identity and purpose
- primary languages and runtimes
- dependency and build tools
- repository structure
- major components
- entry points
- data stores and schemas
- external integrations
- configuration and secrets
- setup and local-run workflow
- formatting, linting, analysis, build, and test commands
- CI checks
- deployment model
- ownership and support
- security and privacy boundaries
- known limitations and risks

For every material claim, retain the supporting repository path.

## Step 4: Detect templates and existing project content

A target document may contain:

- `<...>` placeholders
- generic example diagrams
- generic commands
- reusable checklists
- valid project-specific content
- stale content
- contradictions

Preserve accurate project-specific content.

Replace or remove generic examples. Do not leave example commands or diagrams that could be mistaken for the real project.
