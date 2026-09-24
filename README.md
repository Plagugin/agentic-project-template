# Agentic Project Template

This guide explains the first steps for creating a new project from this template and preparing it for use with GitHub Copilot CLI.

This is the README for the **template itself**, not the README for the project created from it. Keep this file in the template repository or template package. The generated project should have its own root `README.md` describing the actual product or codebase.

## What this template provides

The template includes:

- repository-wide Copilot instructions
- reusable custom agents for demand intake, planning, execution, and documentation maintenance
- agent workflow guidance
- project context and architecture templates
- development and testing guides
- secure-development guidance
- a Definition of Done
- contribution guidance
- a Markdown-based feedback loop for blockers and required human actions
- deterministic prompt macros for recurring output workflows
- a standard `reports/` hierarchy for tracked deliverables and ignored developer-specific output

The intended workflow is:

```text
Idea or request
    ↓
Demand Intake Agent  <───────────────┐
    ↓                                │
Structured demand document           │  feedback/ (blocker or
    ↓                                │  human-action report)
Technical Planner Agent  <───────────┤
    ↓                                │
Implementation plan                  │
    ↓                                │
Plan Executor Agent  ─────────────────┘
    ↓
Implementation, validation, documentation-impact assessment
    ↓                                      │
Context revision ledger (when warranted)  │
    ↓                                      │
Repository Documentation Maintainer ──────┘
```

When a demand or plan cannot be completed as written, or a task depends on a person, the responsible agent records that under `feedback/` instead of stalling silently, so the next pass through demand intake or planning can turn it into an updated requirement or decision. Completed implementation also produces a documentation-impact assessment. Material or structural context changes are recorded in `feedback/context-revisions.md` for the documentation maintainer to reconcile.

## Template structure

```text
project-name/
├── README.md
├── AGENTS.md
├── CONTRIBUTING.md
│
├── .github/
│   ├── agent-macros.md
│   ├── agentic-workflow-state.md
│   ├── copilot-instructions.md
│   ├── template-help.md
│   ├── workflow-profiles.md
│   └── agents/
│       ├── demand-intake.agent.md
│       ├── plan-executor.agent.md
│       ├── repository-documentation-maintainer.agent.md
│       └── technical-planner.agent.md
│
├── demands/
│   ├── README.md
│   └── <demand-slug>.md
│
├── plans/
│   ├── README.md
│   └── <demand-slug>-implementation-plan.md
│
├── feedback/
│   ├── README.md
│   ├── blocker-template.md
│   ├── context-revisions.md
│   ├── human-action-template.md
│   └── <demand-or-plan-slug>-blocker.md / -human-action.md
│
├── reports/
│   ├── README.md
│   ├── execution/
│   │   └── README.md
│   ├── stakeholder/
│   │   └── README.md
│   └── local/
│       └── README.md   (everything else here is developer-local and gitignored)
│
└── docs/
    ├── PROJECT_CONTEXT.md
    ├── ARCHITECTURE.md
    ├── DEVELOPMENT.md
    ├── TESTING.md
    ├── SECURE_DEVELOPMENT.md
    ├── DEFINITION_OF_DONE.md
    └── templates/
        ├── README.md
        ├── stakeholder-summary-template.html
        ├── local-commit-policy-template.md
        ├── local-protected-paths-template.txt
        ├── local-pre-commit-hook.sh
        └── local-rules-template.md
```

- `demands/` holds structured demand documents produced by the `demand-intake` agent.
- `plans/` holds implementation plans produced by the `technical-planner` agent, one per demand.
- `feedback/` holds blocker reports, human-action requests, and the context-revision ledger. The first two feed discoveries back into demands and plans; the ledger feeds implementation evidence into repository documentation maintenance.
- `.github/agent-macros.md` defines exact, lowercase `m-` prompt macros that agents load only when the first prompt token invokes one.
- `.github/agentic-workflow-state.md` records whether workflow artifacts are shared or local-only and defines branch-aware naming and selection policy.
- `.github/template-help.md` is the static, topic-filtered source for `m-help`.
- `.github/workflow-profiles.md` defines Direct, Compact, and Extended classification, inheritance, escalation, and document-density rules.
- `reports/execution/` and `reports/stakeholder/` hold project deliverables that are tracked in Shared mode and remain local in local-only mode. `reports/local/` always holds ignored developer-specific output.
- `docs/templates/` holds the stakeholder-summary HTML template and clone-local policy, protection, and rule templates.

## Prerequisites

Before using the template, confirm that you have:

- Git
- GitHub Copilot CLI
- access to the GitHub account or organization that will own the repository
- the language runtimes and development tools required by the new project
- permission to create or modify the target repository

The documentation maintainer can inspect a repository and maintain Markdown files, but it cannot determine business ownership, security policy, or project intent when those facts are not present. Be prepared to review and complete those areas manually.

## 1. Create the project

Create a new repository from this template, or copy the template directory.

After copying, rename the project directory:

```sh
mv project-name my-new-project
cd my-new-project
```

On PowerShell:

```powershell
Rename-Item project-name my-new-project
Set-Location my-new-project
```

When the repository is not already initialized:

```sh
git init
```

Configure the intended remote only when you are ready:

```sh
git remote add origin <repository-url>
```

Do not push the untouched template as the first project version. Customize and review it first.

### Dropping this template into an already-existing project

When you copy this template's files into a project that already has its own Git history (rather than starting a fresh repository), decide up front whether the agentic-workflow files should ever be committed to that project's shared history, or whether they exist purely for your own local use of Copilot CLI and must never be shared through Git (or any other means) with collaborators.

If they must stay local to you only, do not add them to the project's own `.gitignore` — that file is shared and committed, so editing it would itself leak the decision (and the file list) to every collaborator. Instead, use `.git/info/exclude`, a per-clone ignore file that Git never commits, tracks, or transmits:

```sh
cat >> .git/info/exclude <<'EOF'
# Local-only: agentic workflow files (Copilot CLI template), never shared
.github/agents/
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
EOF
```

On PowerShell:

```powershell
Add-Content .git\info\exclude @"
# Local-only: agentic workflow files (Copilot CLI template), never shared
.github/agents/
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
"@
```

Trim the list to only paths the template added as untracked files. Git ignore rules cannot protect a path that the repository already tracks.

Confirm the result:

```sh
git status
```

None of the excluded paths should appear, even as untracked. If any already got staged or committed before you set this up, remove them from Git's index without deleting the working files:

```sh
git rm -r --cached <path>
```

`.git/info/exclude` lives inside the local `.git` directory, so it is never cloned, pushed, or seen by anyone else — each collaborator who wants the same behavior must add their own entries locally. This only controls whether Copilot's own workflow files are tracked; if the underlying project also needs product-code changes ignored, handle that through the project's normal `.gitignore` instead.

The documentation maintainer records the durable decision in `.github/agentic-workflow-state.md`. In local-only mode it also records the base branch, work-item-prefixed naming, cross-branch retention, artifact-selection policy, and whether protection was verified. A template-added path that should be untracked remains `Pending human action` until it is removed from Git's index. An intentional local replacement of an existing tracked path follows the protected-override workflow below instead.

### Protecting local replacements of tracked files

An existing project may already track `AGENTS.md`, `docs/ARCHITECTURE.md`, `.github/copilot-instructions.md`, or another path that you intentionally replace only in your clone. Do not add that path to `.git/info/exclude` and do not remove it from shared history.

The documentation maintainer registers it under the active Git directory:

```text
<git-dir>/agentic-workflow/commit-policy.md
<git-dir>/agentic-workflow/protected-paths.txt
<git-dir>/agentic-workflow/local-rules.md
```

It records the shared blob baseline and tells you to apply:

```powershell
git update-index --skip-worktree AGENTS.md
```

Verify the flag:

```powershell
git ls-files -v AGENTS.md
```

Uppercase `S` indicates `skip-worktree`. This flag reduces routine staging risk, but the protected-path policy remains authoritative because upstream changes and branch switches can still require reconciliation.

Before every commit, agents must inspect staged paths and refuse to commit a protected file. `docs/templates/local-pre-commit-hook.sh` can also be installed as a clone-local hard guard when no existing hook would be overwritten.

### Clone-specific rules

Use `m-rule` for machine-, clone-, or worktree-specific instructions that should never enter shared repository history:

```text
m-rule add Never run tests tagged remote-only on this machine; request execution on the remote test PC instead.
m-rule list
m-rule show LOCAL-RULE-001
m-rule disable LOCAL-RULE-001
```

Rules are stored under:

```text
<git-dir>/agentic-workflow/local-rules.md
```

Agents read enabled rules before covered commands, file changes, validation, and remote operations. Rules can prohibit, require, require confirmation, express a preference, or require a warning.

A local rule cannot grant permissions, weaken safety, authorize destructive or remote activity, or turn skipped validation into success. When a required check cannot run on the current machine, agents retain it as remote or human validation and report it as not run locally.

### Pulling when protected paths exist

Agents must not run direct `git pull` when the protected-path list is present. A requested pull becomes:

1. fetch the configured upstream
2. compare `HEAD..@{upstream}` for every protected path
3. stop before integration if the upstream added, changed, renamed, or deleted a protected path
4. report the affected paths for explicit reconciliation
5. integrate only when no protected path changed

This means a remote change to a locally replaced `AGENTS.md` or `docs/ARCHITECTURE.md` is observed but not accepted into the working tree. The agent also does not silently integrate the rest of that remote update, because those commits may depend on the protected change.

The optional pre-commit hook guards commits only. Git has no standard pre-pull hook, so remote-update protection depends on agents following the fetch-before-integrate protocol. A manual `git pull` outside that workflow can bypass the guard.

Typical inspection commands are:

```powershell
git fetch
git rev-parse --abbrev-ref --symbolic-full-name '@{upstream}'
git diff --name-status 'HEAD..@{upstream}' -- AGENTS.md
git diff --name-status 'HEAD..@{upstream}' -- docs/ARCHITECTURE.md
```

### Switching branches with local-only artifacts

Ignored files are shared across ordinary branch switches in the same working directory. Keep completed demand and plan files as local history, but do not select them merely because they exist.

Local-only demands and plans use ticket-prefixed names and record:

- work item
- source branch
- base branch
- artifact scope
- lifecycle

Agents prefer an explicit artifact path. Otherwise they select only an `Active` artifact matching the current work item or branch, ask when several match, and treat cross-branch plans as history until revalidated and explicitly confirmed.

Use separate Git worktrees for concurrent ticket branches that need isolated local artifacts. Each worktree has its own working directory and must receive its own copy of the local-only template files and tracking verification.

## 2. Create the project README

Replace the generated project’s root `README.md` with a short, project-specific entry point.

At minimum, it should explain:

- the project name
- what the project does
- who it is for
- how to set it up
- how to run it
- the most important validation command
- where to find detailed documentation

Suggested structure:

```markdown
# <Project name>

<One-paragraph project summary.>

## Quick start

<Setup and run commands.>

## Documentation

- Project context: `docs/PROJECT_CONTEXT.md`
- Architecture: `docs/ARCHITECTURE.md`
- Development: `docs/DEVELOPMENT.md`
- Testing: `docs/TESTING.md`
- Secure development: `docs/SECURE_DEVELOPMENT.md`
- Contributing: `CONTRIBUTING.md`
```

Do not use the template-user README as the generated project’s product README.

## 3. Open the project in Copilot CLI

Start Copilot CLI from the repository root.

Verify that the repository instructions are discovered:

```text
/instructions
```

You should see applicable sources such as:

- `.github/copilot-instructions.md`
- `AGENTS.md`
- applicable nested instruction files, when added later

The files under `docs/` are not intended to be loaded in full for every interaction. Agents should read them when relevant to the task.

## 4. Establish and maintain the documentation baseline

Select the documentation maintainer:

```text
/agent
```

Choose:

```text
repository-documentation-maintainer
```

The maintainer supports four modes:

- **Bootstrap** — capture known project purpose, users, constraints, ownership, and intended direction before enough implementation exists to document a real architecture.
- **Initialize** — replace templates using evidence from an established repository or an implemented greenfield foundation.
- **Revise** — process pending entries in `feedback/context-revisions.md` after implementation.
- **Audit** — inspect the repository for documentation drift without relying on a pending ledger entry.

### Existing or established project

Run the maintainer in `Initialize` mode immediately after adding the template files:

```text
Initialize the project documentation from the copied templates in an
established repository.

Inspect the repository before editing. Read the source code, manifests,
scripts, CI workflows, test configuration, existing documentation, and
applicable instruction files.

Customize:

- .github/copilot-instructions.md
- AGENTS.md
- CONTRIBUTING.md
- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- docs/DEVELOPMENT.md
- docs/TESTING.md
- docs/SECURE_DEVELOPMENT.md
- docs/DEFINITION_OF_DONE.md

Requirements:

1. Replace placeholders with verified repository-specific information.
2. Remove sections that do not apply.
3. Preserve useful general rules.
4. Do not invent commands, architecture, ownership, requirements, or behavior.
5. Mark genuinely unknown information as "Not yet confirmed".
6. Use repository-relative paths as evidence where useful.
7. Avoid modifying application code, tests, configuration, or dependencies.
8. Avoid duplicating the same information across several documents.
9. Check commands against manifests, scripts, and CI workflows.
10. Review the complete documentation diff before completing.
```

### Greenfield project

Do not ask the maintainer to invent an implemented architecture before one exists. Use this sequence:

1. Run `repository-documentation-maintainer` in `Bootstrap` mode to record known purpose, users, constraints, ownership, and intended direction. Leave unsupported implementation details as `Not yet confirmed`.
2. Create and execute a foundation demand covering the initial runtime, repository layout, build tooling, test harness, CI, deployment assumptions, and approved architecture decisions.
3. Let `plan-executor` assess the foundation's documentation impact and add a pending context-revision entry.
4. Run `repository-documentation-maintainer` in `Revise` mode. It will use the ledger, plans, changes, and current repository evidence to initialize or revise the contextual documents.
5. Review the resulting baseline before beginning the first Compact or Extended product feature.

This is not a one-time setup step. Every executor run scores documentation impact. When the score is material or structural, the executor records a pending entry and recommends another `Revise` pass.

The maintainer is deliberately restricted to documentation, instruction files, the context-revision ledger lifecycle fields, and the documented `.git/info/exclude` exception. It must not implement project code.

## 5. Review the initialized documentation

Do not accept bootstrapped, initialized, or revised documentation without review.

Check the following files:

### `.github/copilot-instructions.md`

Confirm that it:

- describes the actual repository
- contains correct commands
- references the relevant detailed documents
- remains concise
- does not automatically load every large document
- contains no unresolved template examples

### `AGENTS.md`

Confirm that it:

- describes the intended agent workflow
- does not duplicate all project details
- preserves working-tree safety
- defines appropriate stop conditions

### `docs/PROJECT_CONTEXT.md`

Confirm that it correctly describes:

- project purpose
- users and stakeholders
- system boundaries
- terminology
- sources of truth
- critical invariants
- ownership

Business ownership and stakeholder information often require manual completion.

### `docs/ARCHITECTURE.md`

Confirm that it describes the current implementation rather than a proposed design.

Review:

- component boundaries
- dependency direction
- runtime flow
- data ownership
- external integrations
- security boundaries
- deployment model

This template intentionally keeps material implemented decisions in `docs/ARCHITECTURE.md` instead of providing a separate decision-record system. A project with exceptional scale or governance needs may introduce one explicitly as a project-specific choice.

### `docs/DEVELOPMENT.md`

Execute or independently verify the important commands:

- setup
- run
- format
- lint
- type-check
- build
- generation
- safe cleanup

### `docs/TESTING.md`

Confirm that it lists only test levels and commands the repository actually supports.

### `docs/SECURE_DEVELOPMENT.md`

Review it with the appropriate security or privacy owner when the project handles sensitive functionality or data.

Do not include secrets, restricted operational details, or vulnerability information in a broadly accessible repository document.

### `docs/DEFINITION_OF_DONE.md`

Remove irrelevant requirements and add actual project quality gates.

Examples include:

- required CI jobs
- coverage rules
- security scans
- accessibility targets
- code-owner approval
- migration rehearsal
- release approval

## 6. Resolve remaining placeholders

Search the documentation for template residue.

Examples:

```sh
grep -R "<[^>]*>" \
  .github AGENTS.md CONTRIBUTING.md docs
```

On PowerShell:

```powershell
Get-ChildItem .github, docs -Recurse -File |
  Select-String -Pattern "<[^>]*>"

Select-String `
  -Path AGENTS.md, CONTRIBUTING.md `
  -Pattern "<[^>]*>"
```

Also search for:

```text
TODO
TBD
Not yet confirmed
Not applicable
```

`Not yet confirmed` is acceptable when information is genuinely unknown, but every material unknown should have an owner or review action.

Generic example diagrams, commands, project names, and ownership values should be removed or replaced.

## 7. Decide which agents belong to the project

The project contains these repository-level agents:

### `demand-intake`

Turns rough notes, requests, complaints, and brainstorms into a structured demand document.

Use it when:

- the request is informal
- scope is unclear
- acceptance criteria are missing
- several ideas need to be consolidated

### `technical-planner`

Reads a structured demand and inspects the repository to create an implementation plan.

Use it when:

- the change is substantial
- several files or components are involved
- architectural analysis is needed
- migration, compatibility, security, or rollout matters

### `plan-executor`

Implements selected tasks from an approved implementation plan.

Use it when:

- the plan has been reviewed
- material decisions are resolved
- the repository is ready for code changes

### `repository-documentation-maintainer`

Bootstraps, initializes, revises, or audits repository documentation using current evidence and pending context-revision entries.

Use it during:

- early greenfield intent capture
- established-project initialization
- post-foundation documentation baselining
- documentation refreshes
- major architecture or workflow changes
- periodic drift audits

The documentation maintainer is configured for manual use only. The executor recommends it when the documentation-impact threshold is reached; the user selects it explicitly.

### Prompt macros

The template includes exact, lowercase prompt macros defined in `.github/agent-macros.md`. A macro is invoked only when it is the first standalone prompt token; ordinary requests containing words such as "HTML", "text", or "rule" retain their normal meaning.

Show template help or a specific help topic:

```text
m-help
m-help agents
m-help workflows
m-help setup
m-help git
m-help branches
m-help rules
m-help reports
m-help costs
```

Use `m-help all` only when the complete guide is needed. Native Copilot CLI help remains available through `/help`.

Manage clone-specific rules:

```text
m-rule add Never run hardware integration tests on this machine; use the remote test PC.
m-rule list
```

Create a stakeholder-facing HTML summary of completed implementation work:

```text
m-html
```

Add an optional focus or destination:

```text
m-html focus on customer impact and save to reports/stakeholder/release-summary.html
```

Create a local, copy-ready plain-text artifact:

```text
m-text list the files changed during the last execution
```

The default output paths are:

```text
reports/stakeholder/<plan-file-stem>-summary.html
reports/local/<derived-topic>.txt
```

Technical execution reports use:

```text
reports/execution/<plan-file-stem>-execution-report.md
```

Generated reports must not fall back to the repository root.

### Workflow profiles

Agents classify work using `.github/workflow-profiles.md`:

| Profile | Use |
|---|---|
| Direct | Localized, clear, reversible, low-risk work; no demand or plan file |
| Compact | Bounded work needing traceability, several tasks, or explicit validation |
| Extended | Material contract, data, security, architecture, migration, deployment, compatibility, coordination, reversibility, or uncertainty |

Classification order:

1. Any confirmed Extended trigger selects Extended.
2. Direct is allowed only when every Direct condition is confirmed.
3. Everything else is Compact.

Demand intake makes the provisional recommendation. When it recommends Direct, it asks whether to skip the demand or create a Compact demand for traceability. Technical planning inherits the demand profile, verifies it from repository evidence, and records any escalation or reduction. A user-selected profile is not reduced without approval.

## 8. Run the first demand-to-execution workflow

For Compact or Extended work:

### A. Create the demand

Select:

```text
demand-intake
```

Example prompt:

```text
Turn the following brainstorm into a structured demand document:

<paste notes, requirements, observations, and constraints>
```

Review the resulting demand before planning. It will be created under `demands/`.

Confirm:

- workflow profile and classification basis
- problem statement
- goals
- scope
- non-goals
- requirements
- assumptions
- open questions
- acceptance criteria

### B. Create the technical plan

Select:

```text
technical-planner
```

Example prompt:

```text
Read the approved demand document, inspect the repository, and create an
implementation plan. Identify affected components, technical decisions,
task order, testing, migration, rollout, rollback, risks, and executor
stop conditions.
```

Review material decisions before execution. The plan will be created under `plans/`, named after its source demand.

Confirm that the plan records the demand profile, the confirmed planning profile, and any evidence-based adjustment.

### C. Execute the plan

Select:

```text
plan-executor
```

Example prompt:

```text
Execute the approved implementation plan one task at a time.

Preserve pre-existing changes, stay within scope, validate incrementally,
and report changed files, checks run, acceptance criteria, deviations,
and remaining risks.
```

Do not ask the executor to make unresolved product or architectural decisions silently.

After execution, review its context revision assessment:

- **0–2:** no maintainer pass is normally needed.
- **3–5:** run the maintainer in `Revise` mode when practical.
- **6 or more:** run `Revise` before the next substantial feature.
- **Security or contract uncertainty:** treat revision as required.

## 9. Add path-specific instructions only when needed

The initial template intentionally does not include many path-specific instruction files.

Add them later under:

```text
.github/instructions/
```

Possible examples:

```text
source-code.instructions.md
tests.instructions.md
documentation.instructions.md
migrations.instructions.md
security-sensitive.instructions.md
```

Use them when a category of files needs specialized guidance that should not be loaded for every task.

Avoid duplicating the full repository instruction set.

## 10. Establish the initial baseline

After the documentation has been customized and reviewed:

1. Check the working tree.
2. Review all generated documentation changes.
3. Run any available Markdown or documentation validation.
4. Confirm no secrets or sensitive data were introduced.
5. Confirm project commands and paths are correct.
6. Confirm the custom agents are visible through `/agent`.
7. Confirm the instructions are visible through `/instructions`.
8. Create the initial project commit according to your normal workflow.

Suggested baseline scope:

```text
Project template initialized

- project README created
- Copilot instructions customized
- agent workflow configured
- project context documented
- architecture documented
- development and testing workflows documented
- secure-development guidance reviewed
- Definition of Done configured
- material architectural decisions summarized in `docs/ARCHITECTURE.md`
```

Do not claim that project setup is complete when material ownership, security, architecture, or command information remains unverified.

## 11. Recommended daily workflow

For Direct work:

1. Read applicable instructions.
2. Inspect the relevant code and tests.
3. Implement the smallest coherent change.
4. Validate it.
5. Review the diff.
6. Report the result.

For Compact or Extended work:

1. Create or refine the demand.
2. Review the demand.
3. Create the implementation plan.
4. Review material decisions.
5. Execute selected tasks.
6. Validate against the acceptance criteria.
7. Update directly affected documentation, including `docs/ARCHITECTURE.md` when architectural context changed.
8. Review the executor's context revision assessment.
9. Run `repository-documentation-maintainer` in `Revise` mode when recommended or required.
10. Complete the Definition of Done.

## Troubleshooting

### The agents do not appear in `/agent`

Check that they are stored under:

```text
.github/agents/
```

Confirm that filenames end with:

```text
.agent.md
```

Start a new Copilot CLI session or resume the session after modifying agent files.

### Repository instructions are not discovered

Confirm the filename is exactly:

```text
.github/copilot-instructions.md
```

Use:

```text
/instructions
```

to inspect discovered instruction sources.

### The documentation maintainer invents missing information

Reject unsupported details.

Replace them with:

```text
Not yet confirmed
```

Then assign a human owner to resolve the gap.

### Documentation is too large or repetitive

Keep each topic in one primary document:

| Topic | Primary document |
|---|---|
| Project purpose and boundaries | `docs/PROJECT_CONTEXT.md` |
| Current architecture | `docs/ARCHITECTURE.md` |
| Setup and development commands | `docs/DEVELOPMENT.md` |
| Testing strategy | `docs/TESTING.md` |
| Secure development | `docs/SECURE_DEVELOPMENT.md` |
| Completion criteria | `docs/DEFINITION_OF_DONE.md` |
| Contribution workflow | `CONTRIBUTING.md` |
| Agent workflow | `AGENTS.md` |
| Always-on project Copilot guidance | `.github/copilot-instructions.md` |

Use links and short summaries rather than copying entire sections.

## Initialization checklist

- [ ] The project directory and repository name are correct.
- [ ] The project root `README.md` describes the actual project.
- [ ] `.github/copilot-instructions.md` contains project-specific guidance.
- [ ] `/instructions` shows the expected instruction files.
- [ ] `/agent` shows the expected project agents.
- [ ] The `demands/`, `plans/`, and `feedback/` directories exist.
- [ ] `.github/agent-macros.md` defines the expected macros.
- [ ] `.github/agentic-workflow-state.md` records the intended tracking mode and verification result.
- [ ] Clone-local rules are stored under the active Git directory and contain no shared project facts.
- [ ] `.github/template-help.md` describes the current agents, workflows, setup choices, Git boundaries, reports, and cost controls.
- [ ] `.github/workflow-profiles.md` defines the expected classification and proportional-document rules.
- [ ] `reports/execution/`, `reports/stakeholder/`, and `reports/local/` use the intended tracking rules.
- [ ] The documentation maintainer has bootstrapped or initialized the templates using the appropriate mode.
- [ ] `feedback/context-revisions.md` exists and has no unreviewed structural or required entries before the first Compact or Extended feature.
- [ ] Commands and paths were independently reviewed.
- [ ] Business ownership and stakeholder details were reviewed.
- [ ] Architecture describes the current implementation.
- [ ] Testing documentation matches the actual test setup.
- [ ] Security and privacy guidance was reviewed where required.
- [ ] The Definition of Done contains realistic project gates.
- [ ] Template placeholders and example content were removed.
- [ ] No secrets or sensitive production data were introduced.
- [ ] The initial documentation diff was reviewed.
- [ ] The project baseline is ready for the first real demand.

## Maintaining the template

Update the template when:

- Copilot agent or instruction conventions change
- recurring setup errors reveal missing guidance
- the standard agent workflow changes
- new reusable documentation is introduced
- files become duplicated or obsolete
- security or validation expectations change

Keep the template general. Project-specific facts belong in projects created from it, not in the reusable template itself.
