# Workflow Profiles

This specification keeps demands, plans, and execution ceremony proportional to the work while preserving the evidence agents need.

## Classification order

Apply the rules in this order:

1. If any Extended trigger is confirmed, use `Extended`.
2. Otherwise, use `Direct` only when every Direct condition holds.
3. All remaining work is `Compact`.

File count alone never determines the profile.

## Extended triggers

One confirmed trigger is sufficient:

- breaking API, event, schema, file-format, or persisted-data contract
- data migration, transformation, deletion, recovery, or integrity risk
- authentication, authorization, privacy, cryptography, or trust-boundary change
- new service, datastore, queue, framework, architectural layer, or major dependency
- material component-boundary or dependency-direction change
- deployment topology, rollout, rollback, availability, or operational-model change
- compatibility requirements across versions, consumers, or independently deployed components
- several components with meaningful task dependencies or coordinated rollout
- multiple viable technical approaches with material trade-offs
- unresolved decisions that materially change scope, behavior, architecture, security, or data handling
- substantial uncertainty about current behavior or ownership
- irreversible or difficult-to-reverse effects

## Direct conditions

Use `Direct` only when every condition is true:

- the requested outcome and acceptance condition are clear
- scope is localized and bounded
- implementation follows an established repository pattern
- there is no material product or architecture decision
- there is no contract, migration, security, deployment, dependency, or data risk
- validation is known and practical
- the change is easily reversible
- there are no material unresolved questions
- durable demand and plan files would add little traceability value

Typical Direct work includes a localized documentation correction, a narrow defect with an obvious cause, a focused test addition, or a mechanical change following an established pattern.

## Compact profile

`Compact` is the default middle profile. Use it when the change is bounded but benefits from stable requirements, several tasks, affected-path analysis, explicit validation, manageable assumptions, or durable traceability and no Extended trigger applies.

## User choice and confirmation

- Respect an explicit user-selected profile unless safety or repository evidence requires escalation.
- Do not ask the user to classify every request.
- `demand-intake` makes a provisional recommendation.
- When the recommendation is `Direct`, ask whether to skip the demand document or create a Compact demand for traceability. If the user does not choose after explicitly invoking demand intake, create a Compact demand.
- Proceed with a clearly supported Compact or Extended recommendation without asking solely for confirmation.
- Ask when one unresolved answer determines whether an Extended trigger applies.

## Inheritance and adjustment

- Demand intake records a provisional profile and classification basis.
- Technical planning inherits that profile, re-applies this specification after repository inspection, and records the confirmed profile.
- The planner may escalate whenever repository evidence reveals an Extended trigger.
- The planner may reduce an agent-selected provisional profile when evidence shows the extra structure is unnecessary.
- The planner must not reduce a profile explicitly selected by the user without approval.
- Profile adjustment never changes demand scope or requirements.
- Plan execution follows the approved plan profile. If execution discovers evidence that invalidates Direct or Compact classification, stop the affected work and request the missing demand or plan revision.

## Document density rules

- Use direct sentences and short table cells.
- Keep one fact in one authoritative location.
- Reference requirement IDs instead of rewriting demand text in the plan.
- Reference repository documentation instead of summarizing the whole project.
- Omit irrelevant optional sections instead of filling them with repeated `None` values.
- Keep validation with the task that requires it; add a matrix only when cross-task traceability is materially useful.
- Preserve stable IDs, scope boundaries, assumptions, unknowns, dependencies, validation, risks, and stop conditions.
- Do not reduce task count merely to shorten a document.

Suggested targets:

| Artifact | Compact | Extended |
|---|---:|---:|
| Demand | 250–600 words | As required by risk and scope |
| Plan | 400–1,000 words | As required by risk and scope |

These are density targets, not hard limits. Exceed them only when the additional content changes understanding, execution, validation, or risk management.

## One-fact-one-home map

| Information | Authoritative location |
|---|---|
| Problem, outcome, scope, and acceptance | Demand |
| Current architecture | `docs/ARCHITECTURE.md` |
| Development commands | `docs/DEVELOPMENT.md` |
| Testing commands and strategy | `docs/TESTING.md` |
| Requirement interpretation differences | Plan |
| Technical option analysis | Plan `DEC-*` entries |
| Implementation outcomes and dependencies | Plan tasks |
| Actual validation results | Executor completion report |
| Current implemented context after change | Repository documentation |
