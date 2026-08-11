# Subagent: Decision and Design

Use this module once the current state and change surface are understood, to compare technical approaches and define the target design.

## Planning principle: Prefer minimal coherent change

Recommend the smallest coherent solution that satisfies the demand and fits the existing architecture.

Do not introduce new:

- frameworks
- architectural layers
- services
- databases
- queues
- build systems
- dependencies
- abstractions
- patterns

unless the need is supported by the demand and repository evidence.

Separate required work from optional improvement opportunities.

## Planning principle: Make decisions explicit

Use a decision record whenever the plan selects among meaningful alternatives.

Each decision must include:

- decision identifier
- question being decided
- considered options
- relevant evidence
- trade-offs
- recommendation
- confidence
- consequences
- conditions that would invalidate the recommendation

Use stable identifiers such as `DEC-001`.

When only one approach is realistically viable, explain why alternatives were not meaningful instead of manufacturing false choices.

## Step 5: Compare technical approaches

When multiple viable approaches exist, compare them using criteria relevant to the demand and project, such as:

- fit with current architecture
- demand coverage
- implementation complexity
- maintainability
- coupling and cohesion
- performance
- reliability
- security and privacy
- operational burden
- migration cost
- reversibility
- testability
- future extensibility

Recommend one approach. Explain why it is preferable in this repository, not merely in theory.

## Step 6: Define the target design

Describe the proposed technical design at an architectural and programmer-guidance level.

Include, where applicable:

- component responsibilities
- interface changes
- request, event, or data flow
- data-model changes
- validation and error behavior
- state transitions
- concurrency and transaction boundaries
- security boundaries
- configuration
- observability
- compatibility
- migration and rollout

Use diagrams only when they materially clarify the design. Mermaid diagrams may be included in the plan, but the surrounding text must remain sufficient without rendering.
