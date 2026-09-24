# Subagent: Governance and Workflow Docs

Use this module when maintaining `.github/copilot-instructions.md`, `.github/agentic-workflow-state.md`, `.github/template-help.md`, `.github/workflow-profiles.md`, `AGENTS.md`, or `docs/DEFINITION_OF_DONE.md`. Read `evidence-gathering.md` first if the evidence inventory has not been built yet.

## `.github/agentic-workflow-state.md`

Keep this file short and policy-oriented. Record the tracking decision, verification state, base branch, artifact naming, retention, automatic-selection rule, context-revision scope, clone-local commit-policy path, generic rule-registry discovery policy, protected-override summary, remote-update policy, recorder, and review date. Do not store the current branch, credentials, user identity, ticket details, rule contents, enabled-rule count, or a changing list of active work.

## `.github/copilot-instructions.md`

Include concise repository-wide facts and instructions that should accompany most Copilot interactions:

- project summary
- authoritative documentation references
- important repository map
- exact common commands
- architecture and invariant reminders
- broad testing and security expectations
- generated-file rules
- remote-action restrictions

Keep it substantially shorter than the detailed documents it references.

## `AGENTS.md`

Focus on agent workflow:

- reading applicable instructions
- inspecting before editing
- preserving the working tree
- scope and decision boundaries
- incremental validation
- evidence-based reporting
- nested `AGENTS.md` guidance

Avoid duplicating project facts already documented elsewhere.

## `.github/workflow-profiles.md`

Keep profile selection deterministic and proportional:

- Extended triggers override brevity
- Direct requires every Direct condition
- all remaining work is Compact
- demand intake recommends provisionally
- technical planning confirms from repository evidence
- execution stops when discovered risk invalidates the approved profile

Keep document-density rules concise and preserve stable IDs, tasks, dependencies, validation, assumptions, risks, and stop conditions.

## `.github/template-help.md`

Keep help static, concise, and consistent with the actual template:

- agent roles and boundaries
- Direct, Compact, and Extended workflows
- registered macros
- greenfield and existing-project setup
- local-only `.git/info/exclude` behavior
- protected tracked overrides and clone-local commit guards
- fetch-before-integrate checks for protected paths
- clone-local rule discovery and `m-rule` behavior
- branch-aware local artifact naming, selection, retention, and revision processing
- commit, push, remote-action, and destructive-Git boundaries
- report directories and tracking behavior
- context and usage cost controls

Do not turn `m-help` into a repository audit. It should return the requested static topic without broad inspection.

## `docs/DEFINITION_OF_DONE.md`

Tailor completion requirements to actual repository workflows and quality gates.

Avoid listing checks that the repository cannot perform.
