# Agent Operating Guide

This file defines how coding agents should work in this repository.

It complements `.github/copilot-instructions.md` and project documentation. Keep this file focused on agent workflow, decision boundaries, evidence, and handoffs. Store project facts, architecture, commands, and conventions in the appropriate repository documents rather than duplicating them here.

Copilot CLI may combine this file with other applicable instruction files without a guaranteed precedence order. Nested `AGENTS.md` files should extend these rules for a local area and must not contradict them.

## Applicable instructions

Before starting work:

1. Read the user's current request.
2. Locate all instruction files that apply to the working directory and files involved.
3. Read `.github/copilot-instructions.md`.
4. Resolve `agentic-workflow/local-rules.md` through the active Git directory and read every enabled clone-local rule before planning commands, modifying covered files, selecting validation, or performing local or remote operations.
5. Read `.github/agentic-workflow-state.md` before creating, selecting, executing, or reconciling demands, plans, feedback entries, reports, or contextual documentation.
6. Read relevant project documentation and contribution guidance.
7. Read any nested `AGENTS.md` files closer to the affected files.
8. Inspect the repository before forming implementation conclusions.

Useful repository documents may include:

- `.github/copilot-instructions.md`
- `.github/agentic-workflow-state.md` when workflow tracking, artifact naming, branch ownership, or artifact selection matters
- `.github/workflow-profiles.md` when deciding whether work is Direct, Compact, or Extended
- `README.md`
- `CONTRIBUTING.md`
- `docs/PROJECT_CONTEXT.md`
- `docs/ARCHITECTURE.md`
- `docs/DEVELOPMENT.md`
- `docs/TESTING.md`
- `docs/SECURE_DEVELOPMENT.md`
- `docs/DEFINITION_OF_DONE.md`

Remove references to files that do not exist.

These paths are deliberately plain references, not always-loaded includes. Open a document only when the current task actually needs it (see "Cost-aware document loading" below). Loading every large document for every request is a significant source of unnecessary token cost and is not required by this guide.

## Agent macros

When the first standalone token in the user's prompt begins with `m-`:

1. Read `.github/agent-macros.md`.
2. Apply only an exact registered lowercase macro name.
3. Treat the rest of the prompt as the macro argument.
4. Do not infer a macro from ordinary language elsewhere in the prompt.
5. Do not guess unknown macros or bypass the active agent's tools and role boundaries.

Do not load the macro registry for ordinary prompts.

## Cost-aware document loading

Token and credit cost scales with how much is read and produced, not just with how the work is judged. Apply these rules across all agents:

- Read a large reference document (project context, architecture, development, testing, security, Definition of Done) only when the current task depends on the information it contains. A one-line documentation fix does not require reading `docs/ARCHITECTURE.md`.
- Prefer `grep`/targeted search and `view_range` over reading a whole large file when only a section is relevant.
- For Direct work, use the "Quick Definition of Done" summary in `docs/DEFINITION_OF_DONE.md` instead of the full checklist.
- Do not restate large sections of an instruction or template document back into a demand, plan, report, or summary. Reference the source path instead of copying its content.
- Keep generated Markdown proportional to the workflow profile: Direct work needs no demand or plan, Compact work uses concise formats, and Extended work uses only the depth required by its risks.
- Do not re-read a document already read earlier in the same session unless it may have changed.

## Instruction design

Use each instruction mechanism for a distinct purpose:

| File type | Intended content |
|---|---|
| `.github/copilot-instructions.md` | Repository facts, commands, architecture, conventions, and project-wide constraints |
| Root `AGENTS.md` | Agent workflow, safety boundaries, task execution, evidence, and reporting |
| Nested `AGENTS.md` | Local subsystem rules, ownership boundaries, specialized commands, and local risks |
| `.github/instructions/*.instructions.md` | Rules applying only to matching files or paths |
| `.github/agent-macros.md` | Exact short prompt commands loaded only when an `m-` macro is invoked |
| `.github/agentic-workflow-state.md` | Stable tracking mode, base branch, artifact naming, cross-branch retention, and selection policy |
| `<git-dir>/agentic-workflow/local-rules.md` | Enabled clone- or worktree-specific restrictions, requirements, confirmations, preferences, and warnings |
| `.github/template-help.md` | Static topic-based source for the `m-help` macro |
| `.github/workflow-profiles.md` | Direct, Compact, and Extended classification, inheritance, escalation, and density rules |
| Custom `.agent.md` profiles | Specialized roles such as intake, planning, execution, review, or documentation |
| `docs/*.md` | Human-readable authoritative project knowledge |

Do not copy the same large instruction set into several files. Duplication increases context size and creates drift.

## Clone-local rules

Resolve the rule registry with:

```text
git rev-parse --path-format=absolute --git-path agentic-workflow/local-rules.md
```

If the file exists, apply every `Enabled` rule whose scope covers the current work. Disabled and Retired rules do not apply.

Clone-local rules:

- may prohibit commands, protect local files, require confirmation, constrain validation, describe machine limitations, or define safer local alternatives
- may make behavior stricter but cannot grant permissions, weaken safety or security, authorize destructive or remote operations, or suppress truthful reporting
- do not silently disappear when an ordinary prompt conflicts with them; report the conflict and require `m-rule update`, `m-rule disable`, or a new rule
- must not be broadened beyond the commands, paths, test categories, environments, or conditions the user actually recorded
- must not be copied into tracked demands, plans, reports, or documentation unless the user explicitly reclassifies the rule as shared project policy

When a required check is prohibited locally, keep it visible in the demand or plan, use the recorded remote or human alternative, and report it as `Not run locally`. Never report skipped or remote validation as locally passed.

Resolve and read the registry once per session, then reread it only after `m-rule` changes it or when repository context changes.

## Agent responsibilities

An agent working in this repository is responsible for:

- understanding the requested outcome
- identifying the applicable scope
- inspecting relevant existing behavior
- preserving unrelated behavior and user changes
- choosing the smallest coherent solution
- following established project architecture and conventions
- adding or updating appropriate tests
- running practical validation
- reviewing the final diff
- assessing documentation impact and recording qualifying context-revision work
- reporting results truthfully
- surfacing blockers, deviations, assumptions, and residual risks

An agent is not authorized to redefine the product requirement or expand the task without explicit approval.

## Workflow profiles

Classify work as `Direct`, `Compact`, or `Extended` using `.github/workflow-profiles.md`.

- **Direct:** localized, clear, reversible, low-risk work that does not benefit from durable demand and plan files.
- **Compact:** bounded work that benefits from stable requirements, several tasks, explicit validation, or traceability without an Extended trigger.
- **Extended:** work involving material contracts, data, security, architecture, migration, deployment, compatibility, coordinated components, difficult reversibility, or substantial uncertainty.

Extended triggers take precedence. Direct requires every Direct condition. All remaining work is Compact.

Do not force the demand-to-plan pipeline on Direct work. Compact and Extended work should use proportional demand and plan formats. Preserve task granularity and validation even when the documents are concise.

## Local-only branch awareness

When `.github/agentic-workflow-state.md` says `Local-only` or `Local-only requested`:

- treat ignored demands, plans, feedback entries, reports, and contextual documents as one local history shared across ordinary branch switches
- use work-item-prefixed demand and plan names
- record the work item, source branch, base branch, artifact scope, and lifecycle in new demands and plans
- prefer an explicit artifact path; otherwise select only an `Active` artifact matching the current work item or branch
- never automatically select `Completed`, `Abandoned`, or `Superseded` artifacts
- stop for confirmation when several active artifacts match
- treat a cross-branch plan as historical evidence until its assumptions are revalidated and the user confirms execution
- process a pending context revision only on its source branch or on its base branch after the change is confirmed merged

The workflow-state file records stable policy, not the currently checked-out branch. Determine current branch identity from repository evidence when the active agent permits read-only Git inspection. If it cannot be determined, ask rather than inventing it.

`Local-only requested` is not equivalent to verified protection. Agents must keep the tracking conflict visible until the documentation maintainer records `Confirmed excluded` or `Confirmed with protected overrides`.

## Clone-local commit and remote-update policy

Resolve the active Git directory with `git rev-parse --git-dir`. When `<git-dir>/agentic-workflow/commit-policy.md` exists, read it before staging, committing, switching branches, rebasing, or integrating remote changes. Treat `<git-dir>/agentic-workflow/protected-paths.txt` as the authoritative path list.

Protected paths may include:

- untracked local-only files excluded through `.git/info/exclude`
- tracked shared files with intentional local replacements, such as `AGENTS.md` or `docs/ARCHITECTURE.md`

Before every commit:

1. stage intended shared files explicitly; do not use `git add .`, `git add -A`, or force-add while protected paths exist
2. inspect `git diff --cached --name-only`
3. stop when any staged file equals or is nested under a protected path
4. never bypass the local pre-commit guard with `--no-verify`

When the user requests a pull or equivalent remote integration and protected paths exist:

1. do not run direct `git pull`
2. fetch the configured upstream first without modifying the working tree
3. compare `HEAD..@{upstream}` for every protected path
4. stop before merge, rebase, checkout, or reset when the upstream changed, added, renamed, or deleted any protected path
5. report the affected paths and require explicit reconciliation
6. integrate only when no protected path changed; follow the repository strategy or use fast-forward-only integration when no strategy is defined

A fetch updates remote references only. It does not authorize accepting protected-path changes into the working tree.

## Feedback loops, human actions, context revisions, and summaries

The demand → plan → execution pipeline is not strictly one-directional. When reality discovered during planning or execution contradicts the demand or plan, or requires a person to act, close the loop instead of stopping silently or quietly working around it:

- **Blockers.** When a demand or plan cannot be completed as specified, create a blocker report under `feedback/` (`feedback/blocker-template.md`). `demand-intake` and `technical-planner` check `feedback/` for open reports before producing a new or revised document, so the blocker turns into an updated requirement or decision rather than staying stuck. See `feedback/README.md`.
- **Human actions.** When agents are not blocked on a decision but a person must do something agents cannot (manual testing, granting access, an irreversible or production-affecting step, and so on), any agent may create a human action request under `feedback/` (`feedback/human-action-template.md`) and continue independent work in the meantime.
- **Stakeholder summaries.** After finishing substantial, approved work, `plan-executor` may produce a plain-language HTML summary under `reports/stakeholder/`, starting from `docs/templates/stakeholder-summary-template.html`. This is an additional deliverable, not a replacement for the technical completion response. The exact `m-html` macro requests this workflow directly.
- **Developer-specific output.** An agent with file-edit capability may write an explicitly requested local text, Markdown, or HTML artifact under `reports/local/`. These files are personal, not part of tracked project history, and are excluded from version control — see `reports/local/README.md`. The exact `m-text` macro requests copy-ready plain text.
- **Context revisions.** After every execution, `plan-executor` assesses whether implementation changed broader repository context. It must update directly affected behavioral and operational documentation immediately, then record material or structural cross-document impact in `feedback/context-revisions.md`. The user can run `repository-documentation-maintainer` in `Revise` mode to process pending entries and reconcile contextual documentation.

## Start-of-task procedure

Before making changes:

- identify the repository root
- inspect version-control status
- inspect relevant existing diffs
- identify modified, staged, untracked, or conflicted files
- determine which changes predate the current task
- locate relevant source files, tests, documentation, and configuration
- search for existing implementations and established patterns
- identify generated files and their source
- identify applicable build, test, formatting, linting, and type-check commands
- confirm whether credentials, external services, containers, databases, or special environments are required
- check the task for unresolved decisions or destructive effects

Do not edit first and investigate afterward.

## Scope control

Work only on changes required to satisfy the current task.

Allowed supporting changes may include:

- tests protecting the new or corrected behavior
- documentation necessary to explain implemented behavior
- configuration required by the change
- migrations required by an approved data change
- narrowly related fixes discovered while implementing the task

Do not add:

- unrelated refactoring
- broad cleanup
- speculative abstractions
- unrequested modernization
- unrelated dependency upgrades
- formatting changes outside touched code
- product changes not supported by the request
- additional features merely because they are convenient

Record useful out-of-scope findings as follow-up items instead of silently adding them.

## Decision boundaries

Proceed without further approval for local implementation details when:

- the requested behavior remains unchanged
- the solution follows existing project architecture
- public contracts remain compatible
- security, privacy, and data handling remain within existing boundaries
- the change is reversible
- no new major dependency or infrastructure is introduced
- the choice can be validated using existing project practices

Stop and surface the decision when work would require:

- changing scope or acceptance criteria
- selecting a materially different architecture
- adding a new framework, service, database, queue, or major dependency
- introducing a breaking API, event, or data contract
- choosing a migration with data-loss risk
- changing authentication, authorization, trust, or privacy boundaries
- performing an irreversible or remote operation
- overriding a documented project invariant
- resolving contradictory stakeholder requirements
- proceeding without required credentials, files, or authoritative information

When blocked, continue only with independent work that remains safe and useful.

## Working-tree protection

Preserve all existing work.

- Inspect the current diff before editing a modified file.
- Make compatible, minimal edits.
- Never assume uncommitted changes are disposable.
- Do not overwrite unrelated files.
- Do not remove or replace user changes merely because they complicate implementation.
- Do not edit generated output manually when a supported generation workflow exists.
- Do not create backup, temporary, or duplicate files inside the repository unless required by its workflow.

Do not use destructive operations equivalent to:

- `git reset --hard`
- `git clean -f` or `git clean -fd`
- `git checkout -- .`
- `git restore .`
- force pushing
- deleting unknown directories recursively
- rewriting repository history

Do not switch branches, stash changes, rebase, amend commits, or resolve unrelated conflicts without explicit authorization.

## Implementation loop

For each coherent task or increment:

1. Inspect the relevant current implementation.
2. Confirm assumptions against repository evidence.
3. Identify the smallest safe set of changes.
4. Modify production code where required.
5. Add or update tests alongside behavior.
6. Update configuration, schemas, migrations, and documentation where required.
7. Run the narrowest relevant validation.
8. Inspect failures and fix those caused by the change.
9. Review the task-level diff.
10. Confirm completion criteria before starting dependent work.

Prefer vertical, verifiable increments over a large untested batch.

## Code changes

When modifying code:

- follow the nearest established conventions
- preserve module and dependency boundaries
- reuse existing utilities and abstractions
- prefer direct, readable code
- keep public surface area as small as practical
- handle expected failures explicitly
- preserve backwards compatibility unless approved otherwise
- avoid comments that merely restate the implementation
- remove temporary diagnostics before completion
- avoid suppressing warnings or errors without addressing the cause
- do not weaken validation or security controls

When no clear local convention exists, use conventional practices for the language and keep the design simple and local.

## Tests

Behavioral changes require appropriate test consideration.

Add or update tests for relevant:

- success paths
- failure paths
- boundary and validation behavior
- regression scenarios
- authorization and permissions
- compatibility behavior
- data transformations and migrations
- concurrency, retries, or idempotency
- acceptance criteria that can be automated

Testing rules:

- test observable behavior rather than unnecessary private details
- use existing fixtures, helpers, fakes, and test structure
- inspect snapshot changes semantically
- do not delete or weaken tests to make a change pass
- do not label a failure pre-existing without evidence
- do not claim a test passed unless it was run successfully

When a check fails:

1. inspect the actual output
2. determine whether the change caused the failure
3. fix change-caused failures
4. rerun the relevant check
5. report any unresolved failure precisely

## Dependencies

Before adding or changing a dependency:

- verify that the requested behavior requires it
- search for existing project functionality first
- consider standard-library functionality
- choose a narrow dependency compatible with the project
- follow the repository's dependency and lockfile workflow
- add relevant tests
- document the reason in the completion report
- avoid unrelated upgrades

Do not install global tooling or execute arbitrary downloaded scripts without explicit permission.

## Data and migrations

For changes involving persisted data:

- preserve integrity
- make transformations deterministic
- consider partial failure and restart behavior
- use transactions where appropriate
- consider concurrency and deployment ordering
- make rollback or forward-recovery expectations explicit
- validate representative and edge-case data
- avoid irreversible destructive changes without authorization
- never run migrations against a shared or production-like environment without explicit permission

Stop when data ownership, loss tolerance, compatibility, or migration direction is unresolved.

## APIs, events, and integrations

For contract changes:

- implement only the approved compatibility behavior
- validate untrusted inputs at the correct boundary
- preserve established error semantics unless intentionally changed
- update schemas or generated clients using supported workflows
- add contract or integration coverage
- document versioning, rollout, and migration requirements
- use test doubles, sandboxes, or local environments instead of real production data
- stop before making an unapproved breaking change

## Security and privacy

Consider security and privacy throughout implementation, especially for:

- authentication
- authorization
- input and output handling
- injection and path traversal
- secrets and credentials
- personal or sensitive data
- logs and audit trails
- network and filesystem access
- privilege changes
- dependency risk
- denial-of-service behavior

Preserve least privilege.

Never:

- place real secrets in code, tests, documentation, or prompts
- log credentials, tokens, personal data, or sensitive payloads
- bypass authorization for convenience
- send repository or user data to external services without authorization
- lower security controls merely to make validation easier

## Commands and environments

Use repository-supported commands and scripts.

Before running a command, consider:

- whether it changes local or remote state
- whether it requires credentials
- whether it targets the correct environment
- whether it may delete or migrate data
- whether a dry run is available
- whether its output may expose secrets
- whether a narrower command is sufficient

Do not deploy, release, publish, push, merge, commit, open pull requests, create remote issues, modify cloud resources, or invoke production services unless explicitly requested.

## Validation strategy

Use the strongest practical combination relevant to the change:

- formatting
- linting
- static analysis
- type checking
- unit tests
- integration tests
- contract tests
- end-to-end tests
- builds and packaging
- generated-file consistency
- migration checks
- security checks
- accessibility checks
- performance checks
- manual behavioral verification
- final diff inspection

Validate incrementally during work, then run a broader project-appropriate check before completion.

When full validation cannot run:

- run the strongest relevant subset
- state which checks were omitted
- explain the reason
- identify the residual risk
- never report omitted checks as successful

## Final-diff review

Before completing work, inspect the aggregate diff for:

- files outside scope
- accidental deletions
- unrelated formatting
- temporary or backup files
- secrets or sensitive information
- generated files edited incorrectly
- missing tests
- missing documentation
- unintended public-contract changes
- incomplete migrations
- requirements not represented in implementation
- pre-existing user changes accidentally altered

Remove accidental changes without discarding legitimate work that predates the task.

## Completion standard

A task is complete only when:

- the requested behavior is implemented
- applicable requirements and constraints are satisfied
- relevant tests have been added or updated
- practical validation has run
- failures are resolved or clearly reported
- necessary documentation is current
- the final diff has been reviewed
- no known unintended changes remain
- deviations and assumptions are visible
- remaining risks and blockers are explicit

Do not use “complete” when material work remains unimplemented or unverified.

## Completion report

Report:

- overall status
- tasks completed and tasks not completed
- important behavior delivered
- files changed and their purpose
- commands and checks actually run
- validation results
- acceptance criteria satisfied
- plan deviations or local adaptations
- discovered defects
- assumptions
- preserved pre-existing changes where relevant
- blockers, failures, residual risks, and follow-up items

Keep the report concise and evidence-based.

## Nested `AGENTS.md` guidance

Create a nested `AGENTS.md` only when a directory has meaningful local rules that differ from or extend the repository-wide workflow.

Appropriate local content includes:

- subsystem purpose and ownership
- local architecture or dependency boundaries
- specialized setup and validation commands
- generated-code rules
- migration procedures
- security or privacy considerations
- platform-specific constraints
- files that must change together
- local definition-of-done additions

A nested file should:

- apply only to its directory tree
- be shorter than the root file
- avoid repeating universal rules
- reference authoritative local documentation
- extend rather than contradict broader instructions
- state material local risks and stop conditions

Suggested nested structure:

```markdown
# <Subsystem> Agent Instructions

## Scope

These instructions apply to `<path>`.

## Responsibility

<What this subsystem owns.>

## Read first

- `<relative documentation path>` (read on demand, not an always-loaded include)

## Boundaries

- <allowed dependency direction>
- <public contract or invariant>

## Local workflow

- Setup: `<command>`
- Targeted tests: `<command>`
- Validation: `<command>`

## Special rules

- <generated files, migrations, security, platform constraints>

## Stop conditions

- <decision requiring subsystem owner or architect>
```

## Maintenance

Review this file when:

- repository workflow changes
- new agent profiles are introduced
- repeated agent mistakes reveal a missing universal rule
- instructions become duplicated or contradictory
- project-specific details have leaked into this general workflow

Keep it concise enough to remain useful. Move project facts and specialist rules into their proper files instead of continually expanding this document.
