# Using This Project Template

This guide explains the first steps for creating a new project from this template and preparing it for use with GitHub Copilot CLI.

This is the README for the **template itself**, not the README for the project created from it. Keep this file in the template repository or template package. The generated project should have its own root `README.md` describing the actual product or codebase.

## What this template provides

The template includes:

- repository-wide Copilot instructions
- reusable custom agents for demand intake, planning, execution, and documentation initialization
- agent workflow guidance
- project context and architecture templates
- development and testing guides
- secure-development guidance
- a Definition of Done
- contribution guidance
- Architecture Decision Record templates
- a Markdown-based feedback loop for blockers and required human actions
- a plain-language HTML stakeholder-summary template and a gitignored space for developer-specific summaries

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
Implementation, validation, completion report,
and (optionally) a stakeholder-facing HTML summary
```

When a demand or plan cannot be completed as written, or a task depends on a person, the responsible agent records that under `feedback/` instead of stalling silently, so the next pass through demand intake or planning can turn it into an updated requirement or decision. See `feedback/README.md` once the template is instantiated.

## Template structure

```text
project-name/
├── README.md
├── AGENTS.md
├── CONTRIBUTING.md
│
├── .github/
│   ├── copilot-instructions.md
│   └── agents/
│       ├── demand-intake.agent.md
│       ├── plan-executor.agent.md
│       ├── repository-documentation-initializer.agent.md
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
│   ├── human-action-template.md
│   └── <demand-or-plan-slug>-blocker.md / -human-action.md
│
├── dev-notes/
│   └── README.md   (everything else here is developer-local and gitignored)
│
└── docs/
    ├── PROJECT_CONTEXT.md
    ├── ARCHITECTURE.md
    ├── DEVELOPMENT.md
    ├── TESTING.md
    ├── SECURE_DEVELOPMENT.md
    ├── DEFINITION_OF_DONE.md
    ├── templates/
    │   ├── README.md
    │   └── stakeholder-summary-template.html
    └── adr/
        ├── README.md
        └── 0000-template.md
```

- `demands/` holds structured demand documents produced by the `demand-intake` agent.
- `plans/` holds implementation plans produced by the `technical-planner` agent, one per demand.
- `feedback/` holds short blocker reports and human-action requests that any agent may raise when a demand or plan cannot proceed as written, or when a person must act. `demand-intake` and `technical-planner` check it before producing new or revised documents, closing the loop even when documents are only ever passed between agents by a human copying files around.
- `dev-notes/` holds ad hoc, developer-specific summaries on any topic. It is excluded from version control (`.gitignore`) except for its `README.md`.
- `docs/templates/` holds the reusable stakeholder-summary HTML template the `plan-executor` agent uses to produce a plain-language, non-technical completion summary.
- `docs/adr/` holds durable architectural decision records, distinct from demands and plans.

A personal Copilot instruction file may also be installed outside the repository:

```text
~/.copilot/copilot-instructions.md
```

On Windows, this normally corresponds to:

```text
%USERPROFILE%\.copilot\copilot-instructions.md
```

## Prerequisites

Before using the template, confirm that you have:

- Git
- GitHub Copilot CLI
- access to the GitHub account or organization that will own the repository
- the language runtimes and development tools required by the new project
- permission to create or modify the target repository

The documentation initializer can inspect a repository and customize Markdown files, but it cannot determine business ownership, security policy, or project intent when those facts are not present. Be prepared to review and complete those areas manually.

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
EOF
```

On PowerShell:

```powershell
Add-Content .git\info\exclude @"
# Local-only: agentic workflow files (Copilot CLI template), never shared
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
"@
```

Trim the list to only the paths this template actually added on top of the existing project — do not exclude a file the project already tracked before the template was introduced (for example, an existing `AGENTS.md` or `docs/ARCHITECTURE.md` that you extended rather than created). Where the template's file replaced or merged into an existing tracked file, keep it tracked and instead move any content that must stay private into `dev-notes/` or another excluded path.

Confirm the result:

```sh
git status
```

None of the excluded paths should appear, even as untracked. If any already got staged or committed before you set this up, remove them from Git's index without deleting the working files:

```sh
git rm -r --cached <path>
```

`.git/info/exclude` lives inside the local `.git` directory, so it is never cloned, pushed, or seen by anyone else — each collaborator who wants the same behavior must add their own entries locally. This only controls whether Copilot's own workflow files are tracked; if the underlying project also needs product-code changes ignored, handle that through the project's normal `.gitignore` instead.

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

## 3. Install the personal Copilot instructions

The template repository contains project-specific instructions under:

```text
.github/copilot-instructions.md
```

Personal instructions that should apply across all projects belong outside the repository:

```text
~/.copilot/copilot-instructions.md
```

Create the directory when needed:

```sh
mkdir -p ~/.copilot
```

On PowerShell:

```powershell
New-Item -ItemType Directory -Force "$HOME\.copilot"
```

Copy your reusable global instruction file into that directory:

```sh
cp <path-to-global-file>/copilot-instructions.md \
  ~/.copilot/copilot-instructions.md
```

On PowerShell:

```powershell
Copy-Item `
  "<path-to-global-file>\copilot-instructions.md" `
  "$HOME\.copilot\copilot-instructions.md"
```

Do not copy the project-specific `.github/copilot-instructions.md` into the global location.

The global file should contain universal behavior such as:

- inspect before editing
- preserve existing user changes
- avoid destructive Git commands
- use supported project commands
- validate work honestly
- do not deploy, publish, commit, or push without explicit instruction

The repository file should contain project-specific facts, conventions, paths, and commands.

## 4. Open the project in Copilot CLI

Start Copilot CLI from the repository root.

Verify that the repository instructions are discovered:

```text
/instructions
```

You should see applicable sources such as:

- the personal Copilot instruction file
- `.github/copilot-instructions.md`
- `AGENTS.md`
- applicable nested instruction files, when added later

The files under `docs/` are not intended to be loaded in full for every interaction. Agents should read them when relevant to the task.

## 5. Customize the template documentation

Before implementing the first feature, customize the copied templates for the actual repository.

Select the documentation initializer:

```text
/agent
```

Choose:

```text
repository-documentation-initializer
```

Then use a prompt similar to:

```text
Initialize the project documentation from the copied templates.

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

The initializer is deliberately restricted to documentation and instruction files. It should not implement project code.

## 6. Review the initialized documentation

Do not accept the generated documentation without review.

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

## 7. Resolve remaining placeholders

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

## 8. Decide which agents belong to the project

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

### `repository-documentation-initializer`

Customizes the template documentation using repository evidence.

Use it during:

- initial project setup
- documentation refreshes
- major architecture or workflow changes

The documentation initializer is configured for manual use only.

## 9. Run the first demand-to-execution workflow

For the first substantial change:

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

## 10. Use ADRs only when appropriate

The ADR directory contains:

```text
docs/adr/
├── README.md
└── 0000-template.md
```

ADRs are distinct from the demand and plan documents in `demands/` and `plans/`: an ADR records a durable architectural decision and its trade-offs, while a demand records requirements and a plan records the executor-facing task breakdown. Link between them where relevant instead of duplicating content.

Create an ADR when a decision is:

- architecturally significant
- difficult to reverse
- cross-cutting
- related to security, data, compatibility, deployment, or operations
- likely to be questioned later

Do not create ADRs for every implementation detail.

A useful rule is:

> Create an ADR when a future developer or agent is likely to ask why the project chose this approach.

## 11. Add path-specific instructions only when needed

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

Avoid duplicating the full global or repository instruction sets.

## 12. Establish the initial baseline

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
- ADR process available
```

Do not claim that project setup is complete when material ownership, security, architecture, or command information remains unverified.

## 13. Recommended daily workflow

For a small and obvious change:

1. Read applicable instructions.
2. Inspect the relevant code and tests.
3. Implement the smallest coherent change.
4. Validate it.
5. Review the diff.
6. Report the result.

For a substantial change:

1. Create or refine the demand.
2. Review the demand.
3. Create the implementation plan.
4. Review material decisions.
5. Execute selected tasks.
6. Validate against the acceptance criteria.
7. Update documentation and ADRs where required.
8. Complete the Definition of Done.

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

### Global and repository instructions conflict

Keep global instructions limited to universal working behavior.

Keep repository instructions limited to project-specific facts and rules.

Do not maintain two different repository-level files with overlapping instructions.

### The initializer invents missing information

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
- [ ] Personal Copilot instructions are installed outside the repository.
- [ ] `.github/copilot-instructions.md` contains project-specific guidance.
- [ ] `/instructions` shows the expected instruction files.
- [ ] `/agent` shows all four project agents.
- [ ] The `demands/`, `plans/`, and `feedback/` directories exist alongside `docs/adr/`.
- [ ] The documentation initializer has customized the templates.
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
