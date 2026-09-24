# Agentic Project Template Help

This file is the static source for the `m-help` macro. Return only the requested topic unless the user invokes `m-help all`.

## Overview

This template provides:

- Direct, Compact, and Extended workflows
- specialized agents for discovery, demand intake, planning, execution, and documentation maintenance
- deterministic `m-` prompt macros
- demands, plans, feedback loops, context-revision tracking, and standardized reports
- repository instructions and contextual documentation

Common entry points:

```text
m-help agents
m-help workflows
m-help macros
m-help setup
m-help git
m-help branches
m-help rules
m-help reports
m-help costs
```

Native Copilot CLI help remains available through `/help`. Template help does not replace or override it.

## Agents

| Agent | Request it when | Primary output | Important boundary |
|---|---|---|---|
| `solution-discovery-consultant` | The problem, outcome, feasibility, or direction is unclear | Consultation in the conversation | Does not edit files or create an implementation plan |
| `demand-intake` | Rough notes need requirements, scope, and acceptance criteria | `demands/<slug>.md` for Compact or Extended work | Runs only approved read-only Git context commands; does not select architecture or implement code |
| `technical-planner` | An approved demand needs repository analysis and executor-ready tasks | `plans/<slug>-implementation-plan.md` | Runs only approved read-only Git context commands; does not modify application code, test, commit, or push |
| `plan-executor` | An approved plan or confirmed Direct task should be implemented | Code, tests, documentation, validation, and completion evidence | Does not silently change requirements or make unauthorized material decisions |
| `repository-documentation-maintainer` | Contextual documentation needs bootstrap, initialization, revision, or audit | Repository documentation and resolved context-revision entries | Does not modify application code or perform state-changing Git actions |

Example requests:

```text
Use solution-discovery-consultant to help me compare these possible product directions.
Use demand-intake to turn these notes into a demand: <notes>.
Use technical-planner to plan demands/example.md.
Use plan-executor to execute TASK-001 through TASK-003 from plans/example-implementation-plan.md.
Use repository-documentation-maintainer in Revise mode to process pending context revisions.
```

Select a custom agent with:

```text
/agent
```

## Workflows

Work is classified using `.github/workflow-profiles.md`.

| Profile | Use | Durable files |
|---|---|---|
| Direct | Localized, clear, reversible, low-risk work | No demand or plan |
| Compact | Bounded work needing traceability, several tasks, or explicit validation | Compact demand and plan |
| Extended | Material contract, data, security, architecture, migration, deployment, compatibility, coordination, reversibility, or uncertainty | Extended demand and plan |

Classification order:

1. Any confirmed Extended trigger selects Extended.
2. Direct is allowed only when every Direct condition is confirmed.
3. Everything else is Compact.

Demand intake recommends the profile provisionally. Technical planning verifies it using repository evidence. Plan execution stops when new evidence invalidates a Direct or Compact profile.

Documentation maintenance uses:

| Mode | Purpose |
|---|---|
| Bootstrap | Record known intent before implementation evidence exists |
| Initialize | Replace templates using evidence from an established repository |
| Revise | Process pending `feedback/context-revisions.md` entries |
| Audit | Review contextual documentation for drift |

## Macros

Macros are invoked only when the exact lowercase macro is the first standalone prompt token.

| Macro | Purpose | Default output |
|---|---|---|
| `m-help [topic]` | Explain this template | Conversation |
| `m-html [focus or path]` | Create a non-technical stakeholder HTML summary | `reports/stakeholder/<stem>-summary.html` |
| `m-rule <operation>` | Manage clone-specific agent rules | `<git-dir>/agentic-workflow/local-rules.md` |
| `m-text <request>` | Create concise, copy-ready plain text | `reports/local/<topic>.txt` |

Examples:

```text
m-help git
m-html focus on customer impact
m-rule add Never run tests tagged remote-only on this machine.
m-text list the files changed during the last execution
```

Ordinary prompts mentioning HTML, text, help, or rules do not invoke macros.

## Setup

### Greenfield project

1. Copy or instantiate the template.
2. Rename the generated project directory and create the project README.
3. Run `repository-documentation-maintainer` in Bootstrap mode for known intent.
4. Create and implement the technical foundation.
5. Run the maintainer in Revise mode using the executor's context-revision entry.
6. Review the documentation baseline before the first Compact or Extended feature.

### Existing project

1. Copy the template files into the repository.
2. Decide whether the workflow files are shared or local-only.
3. Let the documentation maintainer record the decision in `.github/agentic-workflow-state.md`.
4. For local-only use, list only template-added paths in `.git/info/exclude` and verify they are not tracked.
5. Register intentional local replacements of tracked files in the clone-local commit policy instead of trying to ignore or untrack them.
6. Run `repository-documentation-maintainer` in Initialize mode.
7. Review commands, architecture, ownership, security, and remaining unknowns.

`.git/info/exclude` is local to one clone. It is not committed, pushed, or shared with collaborators. Do not add private workflow paths to the project's shared `.gitignore` merely to keep the template local.

Inspect loaded repository instructions with:

```text
/instructions
```

## Git

Agents do not automatically commit or push when work finishes.

| Agent | Git behavior |
|---|---|
| `solution-discovery-consultant` | Does not edit files; may resolve only the clone-local rule path through Git |
| `demand-intake` | Creates demand, feedback, or explicitly requested local text files; may run only approved read-only Git context commands |
| `technical-planner` | Creates plan, feedback, or explicitly requested local text files; may run only approved read-only Git context commands |
| `repository-documentation-maintainer` | May run approved read-only inspection commands such as `git status`, `git diff`, `git show`, and `git log`; does not stage, commit, push, switch branches, or rewrite history |
| `plan-executor` | May inspect Git and modify repository files; committing requires an explicit user request |

Pushes, pull requests, merges, releases, deployments, publishing, and other remote state changes require an explicit user request and applicable authorization.

Destructive Git operations, history rewriting, and discarding unrelated work remain prohibited unless the exact operation and impact are explicitly authorized.

Tracked files cannot be ignored by `.gitignore` or `.git/info/exclude`. When a tracked shared file has an intentional local replacement:

- register it in `<git-dir>/agentic-workflow/protected-paths.txt`
- record its reason and shared baseline in `commit-policy.md`
- apply `skip-worktree` as a convenience after explicit user action
- inspect staged paths before every commit
- optionally install the clone-local pre-commit guard

When protected paths exist, agents must not run direct `git pull`. They fetch first and stop before integration if the upstream changed any protected path, including additions, deletions, or renames.

The optional pre-commit hook blocks commits, not pulls. Remote-update protection is enforced by the agent protocol; a manual pull can bypass it.

## Rules

`m-rule` manages instructions that apply only to the current clone or worktree:

```text
m-rule add <rule>
m-rule list
m-rule show <LOCAL-RULE-NNN>
m-rule update <LOCAL-RULE-NNN> <replacement rule>
m-rule enable <LOCAL-RULE-NNN>
m-rule disable <LOCAL-RULE-NNN>
m-rule retire <LOCAL-RULE-NNN>
```

Rules are stored in:

```text
<git-dir>/agentic-workflow/local-rules.md
```

Supported effects are `Prohibit`, `Require`, `Confirm`, `Prefer`, and `Warn`. Agents read enabled rules before covered commands, file changes, validation, and remote operations.

Local rules can make behavior stricter, but cannot grant permissions, weaken safety, authorize prohibited operations, or hide failures. When a locally prohibited test remains required, agents preserve it as remote or human validation and report it as not run locally.

## Branches

`.git/info/exclude` applies to the whole clone, not one branch. Ignored local demands, plans, feedback entries, and contextual documents remain in the working directory when branches change.

When the workflow state is local-only:

- demand and plan filenames start with the ticket or stable local work-item identifier
- artifacts record work item, source branch, base branch, artifact scope, and lifecycle
- explicit paths take precedence over automatic discovery
- automatic discovery considers only `Active` artifacts matching the current work item or branch
- terminal artifacts are retained as history but are not selected automatically
- cross-branch plans require repository revalidation and explicit confirmation before execution
- context revisions are processed on their source branch or on the base branch after merge

Sequential ticket branches can share this local history safely under these rules. Use separate Git worktrees when several ticket branches must remain active concurrently; each worktree needs its own local-only template files and workflow-state verification.

Protected tracked overrides are worktree-sensitive because `skip-worktree` is an index flag. Verify the policy and flags separately in each worktree.

## Reports

```text
reports/
├── execution/    technical execution reports
├── stakeholder/  non-technical HTML summaries
└── local/        ignored developer-specific output
```

Default paths:

```text
reports/execution/<plan-file-stem>-execution-report.md
reports/stakeholder/<plan-file-stem>-summary.html
reports/local/<derived-topic>.txt
```

In Shared mode, `execution/` and `stakeholder/` are tracked project deliverables. In local-only mode, the workflow state and `.git/info/exclude` keep the whole template-added `reports/` tree local. Generated reports do not fall back to the repository root. `reports/local/` must not contain required project documentation, secrets, credentials, or sensitive production data.

## Costs

Use these controls to reduce credit and context usage:

- use Direct workflow when every Direct condition holds
- prefer Compact demands and plans for bounded work
- load large contextual documents only when the task depends on them
- use targeted searches and evidence instead of exhaustive repository reading
- use specific help topics instead of `m-help all`
- use `/context` to inspect context-window usage
- use `/usage` to inspect session usage
- use `/compact` to summarize unnecessary accumulated conversation context

Model reasoning does not guarantee that repository tests will be discovered or run automatically. Exact commands and expected validation should remain documented in `docs/DEVELOPMENT.md`, `docs/TESTING.md`, plans, or Direct task instructions as appropriate.
