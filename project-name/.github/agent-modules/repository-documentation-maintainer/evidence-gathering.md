# Subagent: Evidence Gathering and Mode Selection

Use this module first, before any document is maintained: select the operating mode, determine the git-tracking mode when applicable, determine the approved target set, read pending context-revision entries and applicable instructions, build the evidence inventory, and detect template residue or documentation drift.

## Select the operating mode

Use exactly one primary mode:

- `Bootstrap` when project intent exists but implementation evidence is still sparse.
- `Initialize` when copied templates must be replaced using an implemented repository.
- `Revise` when `feedback/context-revisions.md` contains pending entries or the user names specific implementation changes to incorporate.
- `Audit` when the user requests a broader drift review without relying on pending ledger entries.

In `Revise` mode, read all pending ledger entries before choosing target documents. Follow referenced plans, demands, commits, diffs, and paths only as leads; verify every material claim against the current repository.

When the workflow state is local-only, compare each pending entry's work item, source branch, base branch, and merge status with the current branch:

- process it on the matching source branch
- process it on the recorded base branch only when repository evidence confirms the source change is present; update merge status to `Merged`
- otherwise leave it `Pending` and record the branch mismatch in the completion response

## Step 0: Determine the git-tracking mode for the agentic-workflow files

Do this before touching any document, and before Step 1.

Read `.github/agentic-workflow-state.md` first. When it records `Shared`, `Local-only`, or `Local-only requested`, preserve that decision unless the user explicitly changes it. Use `.git/info/exclude`, `git ls-files`, and `git check-ignore` to verify the recorded state rather than inferring policy from ignore entries alone.

When the state is absent or says `Not decided`, ask the user whether the files this template adds (agent profiles, `AGENTS.md`, `.github/agentic-workflow-state.md`, `.github/agent-macros.md`, `.github/template-help.md`, `.github/workflow-profiles.md`, `demands/`, `plans/`, `feedback/`, `reports/`, and the `docs/` set) should ever be committed to this repository's shared Git history, or must stay local to the current user only and never be shared through Git or any other channel. This matters most when the template is being dropped into an already-existing project rather than used to start a new one.

When the answer is local-only:

- Classify each applicable path as:
  - **Template-added untracked** — add it to `.git/info/exclude` and the protected-path list.
  - **Tracked and retained shared** — preserve the repository version; do not protect or replace it.
  - **Tracked with an intentional local replacement** — do not add it to `.git/info/exclude` and do not untrack it. Register it as a protected tracked override.
- Ask the user before treating an already tracked path as a protected override. This may apply to files such as `AGENTS.md`, `.github/copilot-instructions.md`, `docs/ARCHITECTURE.md`, or another contextual document whose local content must differ from the shared repository.
- Append the applicable paths to `.git/info/exclude` — a per-clone file that Git never commits, tracks, or shares with collaborators — not the project's own `.gitignore`, which is shared and would itself leak the decision. This is a plain local text-file edit, not an application or Git-history change, so it is within this agent's edit scope.
- Resolve the Git directory with `git rev-parse --git-dir`. Create `<git-dir>/agentic-workflow/commit-policy.md` from `docs/templates/local-commit-policy-template.md`, `<git-dir>/agentic-workflow/protected-paths.txt` from `docs/templates/local-protected-paths-template.txt`, and `<git-dir>/agentic-workflow/local-rules.md` from `docs/templates/local-rules-template.md` when it does not exist.
- Put every template-added local-only path and every protected tracked override in `protected-paths.txt`. Remove template examples that do not apply.
- For each protected tracked override, record the current shared blob with `git rev-parse HEAD:<path>` when available, plus the user-confirmed reason.
- Tell the user to run `git update-index --skip-worktree <path>` for each protected tracked override. This agent must not run it.
- Verify the flag afterward with `git ls-files -v <path>`; uppercase `S` confirms `skip-worktree`.
- If `.git/hooks/pre-commit` does not exist and the user wants hard local enforcement, instruct them to copy `docs/templates/local-pre-commit-hook.sh` there and make it executable. Never overwrite or replace an existing hook; require manual integration instead.
- Determine the base branch from repository evidence when possible. If it cannot be confirmed, record `Not yet confirmed`; do not guess.
- Candidate paths:
  ```
  .github/agents/
  .github/agent-modules/
  .github/agentic-workflow-state.md
  .github/agent-macros.md
  .github/template-help.md
  .github/workflow-profiles.md
  .github/copilot-instructions.md
  AGENTS.md
  demands/
  plans/
  feedback/
  reports/
  docs/templates/
  docs/PROJECT_CONTEXT.md
  docs/ARCHITECTURE.md
  docs/DEVELOPMENT.md
  docs/TESTING.md
  docs/SECURE_DEVELOPMENT.md
  docs/DEFINITION_OF_DONE.md
  ```
- If every untracked local-only path is excluded and no protected tracked override exists, update the state to:
  - `Tracking mode: Local-only`
  - `Tracking verification: Confirmed excluded`
  - `Artifact naming: Work-item-prefixed`
- If every untracked local-only path is excluded and every protected tracked override is registered with a verified `skip-worktree` flag, update the state to:
  - `Tracking mode: Local-only`
  - `Tracking verification: Confirmed with protected overrides`
  - `Artifact naming: Work-item-prefixed`
- If a template-added path that should be untracked is already tracked or staged, tell the user to run `git rm -r --cached <path>` themselves. Do not give this instruction for a protected tracked override.
- If exclusion, protected-path registration, or a required `skip-worktree` flag is incomplete, record:
  - `Tracking mode: Local-only requested`
  - `Tracking verification: Pending human action`
  - `Artifact naming: Work-item-prefixed`
- Do not claim local-only protection while verification is pending. Do not maintain a file whose tracking conflict could cause private content to be committed.

When the answer is shared/tracked (the default for a project freshly created from the template with no prior history), make no `.git/info/exclude` changes. Record `Tracking mode: Shared`, `Tracking verification: Not required`, `Artifact naming: Standard`, `Local commit policy: Not configured`, `Protected tracked overrides: None`, and `Remote update policy: Standard unless protected paths exist`.

Always preserve these state defaults unless the user explicitly chooses another policy:

- `Cross-branch artifact retention: Keep`
- `Automatic artifact selection: Explicit path or matching active work item`
- `Context revision scope: Matching source branch or confirmed merged base branch`

When local-only mode is selected, also record:

- `Local commit policy: <git-dir>/agentic-workflow/commit-policy.md`
- `Remote update policy: Fetch and inspect protected paths before integration`

Update `Recorded by` and `Last reviewed` when the decision is created or reverified.

Regardless of tracking mode, read enabled clone-local rules before selecting commands, target files, or validation evidence. Do not convert machine-specific restrictions into shared project documentation unless the user explicitly says they are project-wide facts.

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
- recorded architectural decisions and constraints in `docs/ARCHITECTURE.md`
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
5. candidate documents named by pending context-revision entries

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

For `Bootstrap` and `Initialize`, use this evidence ladder:

1. repository structure, manifests, package or build scripts
2. existing README and authoritative project documentation
3. CI workflows and primary test configuration
4. application entry points and top-level component boundaries
5. targeted source, schema, deployment, or security areas only where a selected document has a material evidence gap

Do not inspect every subsystem merely because a template contains an optional section. Stop expanding the inventory when the selected documents can be written accurately at the required level of detail.

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

For `Revise` and `Audit` modes, also inventory:

- pending ledger entry identifiers and scores
- referenced demands and plans
- referenced commits or working-tree diffs, when available
- changed components and contracts
- documents named as candidates
- whether directly affected documentation was already updated during implementation
- discrepancies between the ledger, current repository, and current documentation

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
