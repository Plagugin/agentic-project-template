# ADR-NNNN: <Decision title>

- **Status:** Proposed
- **Date:** <YYYY-MM-DD>
- **Decision owners:** <role, team, or individuals>
- **Reviewers:** <role, team, or individuals>
- **Related requirement or demand:** <reference or Not applicable>
- **Related implementation plan:** <reference or Not applicable>
- **Supersedes:** <ADR reference or None>
- **Superseded by:** <ADR reference or None>

## Summary

<Describe the decision in one or two sentences.>

## Context

<Explain the problem, opportunity, or constraint that requires a decision.>

Include:

- the current situation
- the reason a decision is needed
- affected users, teams, components, or systems
- important business or technical constraints
- relevant security, privacy, data, compatibility, or operational concerns

Do not describe the selected solution as inevitable. The context should make sense before the reader reaches the decision.

## Decision drivers

- <driver>
- <driver>
- <driver>

Examples:

- maintainability
- delivery risk
- backwards compatibility
- performance
- security
- privacy
- data integrity
- operational complexity
- cost
- team expertise
- reversibility
- time constraints
- regulatory or contractual requirements

## Constraints and assumptions

### Constraints

- <mandatory constraint>
- <mandatory constraint>

### Assumptions

- <assumption>
- <assumption>

Clearly separate assumptions from confirmed constraints.

## Options considered

### Option 1 — <name>

#### Description

<Describe the option.>

#### Advantages

- <advantage>
- <advantage>

#### Disadvantages

- <disadvantage>
- <disadvantage>

#### Risks

- <risk>

#### Fit with current architecture

<Explain how well this option fits the existing project.>

### Option 2 — <name>

#### Description

<Describe the option.>

#### Advantages

- <advantage>
- <advantage>

#### Disadvantages

- <disadvantage>
- <disadvantage>

#### Risks

- <risk>

#### Fit with current architecture

<Explain how well this option fits the existing project.>

### Option 3 — <name>

<Remove this section when only two realistic options exist. Do not invent alternatives merely to fill the template.>

## Decision

<Clearly state the selected option and the boundaries of the decision.>

The project will:

- <decision detail>
- <decision detail>

The project will not:

- <explicit exclusion>
- <explicit exclusion>

## Rationale

<Explain why the selected option best satisfies the decision drivers and constraints.>

Address:

- why the selected option is preferable in this project
- why the rejected options were not selected
- which trade-offs are being accepted
- which evidence supports the decision

## Consequences

### Positive consequences

- <positive consequence>
- <positive consequence>

### Negative consequences

- <negative consequence>
- <negative consequence>

### Neutral or operational consequences

- <consequence>
- <consequence>

Consequences should include ongoing maintenance and operational effects, not only implementation effort.

## Security and privacy impact

- **Authentication impact:** <impact or None identified>
- **Authorization impact:** <impact or None identified>
- **Sensitive-data impact:** <impact or None identified>
- **Trust-boundary impact:** <impact or None identified>
- **Required security review:** Yes / No
- **Required privacy review:** Yes / No

Do not include secrets or restricted vulnerability details.

## Data and compatibility impact

- **Data ownership:** <impact or None>
- **Data migration:** <impact or Not applicable>
- **API compatibility:** <impact or Not applicable>
- **Event or schema compatibility:** <impact or Not applicable>
- **Backwards-compatibility window:** <requirement or Not applicable>
- **Rollback or forward-recovery considerations:** <details>

## Operational impact

- **Deployment:** <impact>
- **Configuration:** <impact>
- **Observability:** <impact>
- **Support:** <impact>
- **Reliability:** <impact>
- **Performance:** <impact>
- **Cost:** <impact>

## Implementation implications

<Describe the high-level implementation consequences without turning the ADR into a task plan.>

Likely affected areas:

- `<path or component>`
- `<path or component>`

The detailed work should be documented in an implementation plan or issue.

## Validation

The decision will be validated through:

- <test, review, prototype, benchmark, or operational check>
- <test, review, prototype, benchmark, or operational check>

Success signals:

- <signal>
- <signal>

Failure or reconsideration signals:

- <signal>
- <signal>

## Rollout and migration

<Describe how the decision will be introduced safely.>

Include where relevant:

- sequencing
- feature flags
- compatibility periods
- migration
- monitoring
- rollback
- forward recovery
- consumer coordination

Use `Not applicable` when this decision does not require rollout planning.

## Follow-up actions

| Action | Owner | Target or trigger | Status |
|---|---|---|---|
| <action> | <owner> | <date, milestone, or trigger> | Open |

Do not use this section as a substitute for a detailed implementation plan.

## Risks and mitigations

| Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|
| <risk> | Low / Medium / High | Low / Medium / High | <mitigation> |

## Revisit when

Reconsider this decision when:

- <condition>
- <condition>
- <condition>

Examples:

- a constraint changes
- expected scale is exceeded
- an integration is retired
- a platform capability becomes available
- operational cost exceeds an agreed threshold
- a security or compliance requirement changes

## Alternatives rejected

Summarize why each non-selected option was rejected.

- **<option>:** <reason>
- **<option>:** <reason>

## References

- <requirement, plan, issue, pull request, documentation, benchmark, or related ADR>
- <reference>

## Approval record

| Role | Name or team | Decision | Date |
|---|---|---|---|
| <role> | <name or team> | Approved / Rejected / Changes requested | <YYYY-MM-DD> |

Update the ADR status after the required decision is made.
