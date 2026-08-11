# Subagent: Task and Validation Sequencing

Use this module once the target design is decided, to break work into an executor-ready sequence with an integrated test strategy.

## Planning principle: Plan outcomes, not keystrokes

Tasks should describe coherent implementation units with enough context for an executor to act.

Do not produce a brittle sequence of mechanical edit instructions.

Each task must state:

- purpose
- linked demand identifiers
- dependencies
- affected components or likely files
- required behavioral change
- important implementation constraints
- validation expectations
- risks or cautions
- completion criteria

Use stable identifiers such as `TASK-001`.

## Planning principle: Preserve traceability

Every confirmed demand requirement must map to one or more:

- decisions
- tasks
- tests
- validation steps

Every planned task must be justified by at least one demand requirement, constraint, architectural necessity, or risk-control need.

Do not add untraceable work.

## Planning principle: Design validation with implementation

Testing is part of the plan, not a final afterthought.

Cover the relevant levels:

- unit tests
- component or module tests
- integration tests
- contract tests
- end-to-end tests
- migration verification
- security validation
- performance validation
- accessibility validation
- operational checks
- manual validation

Prefer the repository's existing testing patterns. Do not propose a new testing framework unless necessary and justified.

## Planning principle: Treat operational impact as first-class

Where applicable, plan for:

- backwards compatibility
- API or event compatibility
- data migration
- feature flags
- staged rollout
- observability
- alerting
- auditability
- configuration changes
- deployment order
- rollback
- failure recovery
- documentation
- support and operations readiness

Write `Not applicable` only after considering the topic.

## Step 7: Create the implementation sequence

Break the work into dependency-aware phases and executor-sized tasks.

Prefer vertical, verifiable increments when practical.

Common phase categories include:

1. preparation and safeguards
2. contracts or data foundations
3. core behavior
4. integration
5. compatibility or migration
6. verification
7. rollout and documentation

Adapt the phases to the actual project. Do not force irrelevant phases.

Each task should be executable in one coherent agent session where feasible. Split `XL` tasks.

## Step 8: Build the test and validation strategy

Map acceptance criteria and requirements to concrete validation activities.

State:

- what must be tested
- where tests likely belong
- which existing patterns to follow
- fixtures or test data needed
- failure and edge cases
- regression areas
- manual or operational checks
- evidence the executor must report

## Task-writing standards

A good task:

- produces a coherent, testable outcome
- has clear boundaries
- names likely affected areas
- links to demand identifiers
- states dependencies
- includes validation and completion evidence
- preserves architectural constraints
- identifies stop conditions

A poor task:

- says only "update backend" or "add tests"
- mixes unrelated changes
- prescribes unverified file edits
- lacks demand traceability
- hides uncertainty
- includes optional cleanup without justification
- is too large for one coherent execution cycle

Split a task when:

- it has independent acceptance criteria
- it crosses unrelated architectural boundaries
- it can be validated separately
- it has different risk or rollout characteristics
- its complexity would otherwise be `XL`
