# Subagent: Repository Analysis

Use this module to locate the demand, build a repository map, describe the current state, and identify the change surface, before comparing technical approaches.

Read `.github/workflow-profiles.md` before confirming the planning profile.

## Planning principle: Demand is authoritative for intent

Treat the demand document as the source of requested outcomes, boundaries, and acceptance criteria.

The repository is authoritative for the current implementation, not for the desired future behavior.

When demand and repository evidence conflict:

1. record the conflict
2. identify the affected requirement
3. explain the planning impact
4. mark the relevant task or decision as blocked when necessary
5. do not silently choose one interpretation

## Planning principle: Repository evidence is mandatory

Do not create a generic plan based only on the demand when a repository is available.

Inspect enough of the project to understand:

- project type and language
- repository organization
- application entry points
- major architectural layers and boundaries
- relevant modules and ownership
- public and internal interfaces
- data storage and schemas
- state and data flow
- integrations and external dependencies
- error-handling conventions
- logging, telemetry, and observability
- test structure and test conventions
- build and dependency management
- deployment and runtime configuration
- security and authorization boundaries
- existing documentation and architectural decisions
- local conventions that the executor must preserve

Cite repository evidence with relative file paths and, where useful, symbols, sections, classes, functions, routes, or configuration keys.

Do not claim that a file or behavior exists unless you inspected evidence for it.

## Step 1: Locate and assess the demand

Read `.github/agentic-workflow-state.md` when it exists. When it says `Local-only` or `Local-only requested`, identify the current branch with the approved read-only Git command and apply this demand-selection precedence:

1. a demand path explicitly named by the user
2. a document explicitly referenced in the prompt
3. an `Active` demand matching both current work item and source branch
4. an `Active` demand matching the current work item
5. the direct user prompt when no unambiguous demand exists

Never automatically select a demand whose lifecycle is `Completed`, `Abandoned`, or `Superseded`. If several active demands match, ask the user to choose. Treat a demand from another branch as historical evidence unless the user explicitly selects it and its assumptions are revalidated.

Otherwise, use the following precedence:

1. a demand path explicitly named by the user
2. a document explicitly referenced in the prompt
3. a relevant demand document in `demands/`
4. `demand.md` at the project root, only when it predates the `demands/` convention
5. the direct user prompt when no demand document exists

Record:

- demand source
- demand status and readiness
- provisional workflow profile, classification basis, and whether the user selected it
- confirmed requirements
- constraints
- assumptions
- unresolved questions
- acceptance criteria
- explicit non-goals
- work item, source branch, base branch, artifact scope, and lifecycle when local-only mode applies

Also check `feedback/` for an open blocker report or human action request referencing this demand or an earlier plan for it. Fold the underlying problem into the current planning pass — either by addressing it in a decision or task, or by explicitly carrying it forward as a documented risk or unresolved question. Do not silently ignore an open report.

Determine whether planning is:

- **Ready**
- **Ready with assumptions**
- **Partially blocked**
- **Blocked**

Do not stop merely because some minor details are missing. Produce the useful, unblocked portion of the plan and label uncertainty.

## Step 2: Build a repository map

Inspect the repository from broad structure to demand-relevant detail.

Start with likely high-signal files:

- README and project documentation
- dependency and build manifests
- workspace or monorepo configuration
- application entry points
- architecture documentation and recorded constraints
- CI/CD workflows
- container and deployment definitions
- environment or configuration templates
- primary test configuration
- code ownership information

Then inspect the modules, interfaces, schemas, and tests directly related to the demand.

Avoid reading the entire repository without purpose. Expand inspection only when evidence suggests a dependency or cross-cutting effect.

## Step 3: Describe the current state

Create a concise evidence-based model of:

- relevant components
- responsibilities
- dependencies
- runtime interactions
- data flow
- extension points
- existing behavior
- known limitations

Clearly distinguish:

- directly verified facts
- inferred relationships
- unknowns requiring executor verification

## Step 4: Identify the change surface

Determine what the demand could affect:

- user-facing behavior
- domain logic
- API contracts
- persisted data
- events and messages
- integrations
- authentication and authorization
- configuration
- deployment
- observability
- tests
- documentation
- compatibility guarantees

Identify likely files or directories, but do not pretend that the list is exhaustive when uncertainty remains.

## Confirm or adjust the workflow profile

After demand-relevant inspection:

1. reapply the Extended triggers
2. confirm Direct only when every Direct condition is evidenced
3. otherwise use Compact

Record:

- demand profile
- confirmed planning profile
- `Unchanged`, `Escalated`, or `Reduced`
- evidence-based reason
- Extended triggers found

The planner may always escalate. It may reduce an agent-selected provisional profile when evidence supports the reduction. It must not reduce a user-selected profile without approval.

When Direct is confirmed, recommend skipping the plan and ask whether the user wants a Compact plan for traceability. If the user explicitly invoked planning and does not choose, use Compact.
