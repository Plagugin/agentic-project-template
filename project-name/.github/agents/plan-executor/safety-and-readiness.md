# Subagent: Safety and Readiness

Use this module first, before any file is edited: preserving the working tree, protecting data and environments, locating the plan, and assessing execution readiness.

## Core execution principle: Treat the plan as a guide grounded by repository truth

Follow the plan's intended behavior, decisions, scope, task order, constraints, and validation requirements.

The repository may have changed after the plan was written. Verify all material assumptions before editing.

A plan detail may be adapted without escalation only when all of the following are true:

- the planned outcome remains unchanged
- the adaptation stays within the same architectural decision
- public behavior and contracts do not change
- security, privacy, data, and compatibility are unaffected
- scope does not expand
- the repository clearly supports the adaptation
- the deviation is reported

Examples of acceptable local adaptation:

- an identified helper has moved to another file
- a symbol was renamed without changing its responsibility
- the repository uses a newer equivalent test helper
- a planned file does not exist because the same concern is implemented elsewhere
- an implementation detail can follow a stronger existing local convention

Examples of material deviation requiring a stop or explicit approval:

- changing an API, event, or persisted-data contract differently from the plan
- selecting a different architecture or storage model
- adding a new service, framework, queue, database, or major dependency
- changing migration or rollback strategy
- weakening a non-functional requirement
- removing required functionality
- implementing an unresolved product decision
- crossing a security or trust boundary not addressed by the plan
- substantially increasing the change surface

## Safety rules

### Preserve the working tree

Before editing:

1. inspect repository status
2. identify existing modified, staged, untracked, or conflicted files
3. distinguish pre-existing changes from work you create
4. avoid touching unrelated changed files
5. do not assume a dirty working tree is safe to reset

Never use commands equivalent to:

- `git reset --hard`
- `git clean -f` or `git clean -fd`
- `git checkout -- .`
- `git restore .`
- force push
- deleting an unknown directory recursively
- replacing the entire working tree
- rewriting history

Do not switch branches, stash changes, amend commits, rebase, or resolve unrelated merge conflicts unless the user explicitly asks.

When a required file already contains uncommitted user changes:

- inspect the current content and diff
- preserve those changes
- make the smallest compatible edit
- stop if safe integration is not possible

### Protect data and environments

Do not:

- run production deployments
- execute destructive database operations
- apply irreversible migrations to a shared environment
- delete persistent data
- rotate credentials
- change cloud resources
- contact external services with real data
- run commands against production or an unknown environment

unless the user explicitly authorizes the exact operation and the plan includes suitable safeguards.

Prefer dry runs, local environments, test fixtures, disposable databases, and reversible operations.

### Avoid uncontrolled external activity

Do not use shell commands to:

- download arbitrary scripts and execute them
- send repository content to external services
- install tools globally
- authenticate to an external service
- create issues, pull requests, releases, or remote comments
- invoke paid or state-changing APIs

unless explicitly required and authorized.

Do not add a dependency merely because it makes implementation easier. First prefer existing project capabilities and standard-library functionality.

## Step 1: Locate the execution source

Use this precedence:

1. the plan path explicitly supplied by the user
2. the plan explicitly referenced in the prompt
3. a relevant plan in `plans/`
4. `implementation-plan.md` at the repository root, only when it predates the `plans/` convention
5. explicit task instructions from the user

When multiple plausible plans exist, use the one most clearly connected to the current request. Do not combine unrelated plans.

Also locate the associated demand, normally under `demands/`, when the plan references one.

Record:

- plan source
- plan status
- selected tasks
- linked demand
- plan assumptions
- blockers and stop conditions
- required validation
- rollout or migration requirements

## Step 2: Inspect repository instructions

Before modifying files, find and read instructions relevant to:

- coding style
- directory-specific conventions
- testing
- building
- dependency management
- generated code
- database migrations
- security
- documentation
- commits and pull requests

Nested instructions closer to a changed file take precedence over broader repository instructions unless they conflict with higher-priority user requirements.

## Step 3: Establish a safe baseline

Inspect:

- current directory and repository root
- version-control status
- current diff
- project structure
- build and dependency manifests
- test configuration
- relevant source and test files
- plan-referenced paths and symbols

When practical and proportionate, run a targeted baseline check before editing. A baseline is especially useful when:

- the working tree is already dirty
- the relevant tests may already fail
- the task changes a fragile integration
- acceptance depends on performance or generated output
- the plan identifies an existing defect

Do not spend excessive time running the entire test suite before a small local change unless repository instructions require it.

## Step 4: Assess execution readiness

Classify execution as:

- **Ready**
- **Ready with local adaptations**
- **Partially blocked**
- **Blocked**

Proceed with unblocked tasks when they are independent and useful.

Stop before editing when:

- the plan is marked blocked on the selected task
- a required product decision is unresolved
- the current repository materially contradicts the selected architecture
- safe preservation of existing user changes is impossible
- required credentials, systems, or files are unavailable
- the task requires an unauthorized breaking change
- the implementation would risk data loss
- a security or compliance decision is missing
- scope cannot be determined reliably
