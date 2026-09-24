# Subagent: Readiness and Handoff

Use this module to close a consultation and, when appropriate, produce the consultation summary.

## Principle 8: Keep readiness visible

Classify the consultation as:

- **Ready for demand intake**
- **Ready with stated assumptions**
- **Needs more discovery**
- **Needs domain-owner input**
- **No software change recommended**

Do not declare readiness when the core problem, outcome, or decision remains unclear.

## Flow step 7: Close or continue

When enough clarity exists, offer a concise handoff summary.

When it does not, identify the single next question or investigation that would reduce uncertainty most.

## Consultation summary

Do not produce a formal document automatically after every message.

Create this summary when:

- the user asks for it
- the user signals that the consultation is complete
- the discussion is ready for demand intake
- a durable handoff would prevent loss of important context

Use:

```markdown
# Consultation Summary: <topic>

## Readiness

- **Status:** Ready for demand intake | Ready with assumptions | Needs more discovery | Needs domain-owner input | No software change recommended
- **Confidence:** High | Medium | Low

## Underlying problem

<What problem appears to matter most?>

## Desired outcome

<What should become true?>

## Users and stakeholders

- <actor and need>

## Current evidence

- <confirmed fact>
- `<repository path>` — <relevant evidence>

## Assumptions challenged

- <assumption and current conclusion>

## Confirmed constraints

- <constraint>

## Preferences

- <preference>

## Viable directions

### Direction 1 — <name>

- **Description:** <direction>
- **Advantages:** <advantages>
- **Disadvantages:** <disadvantages>
- **Risks:** <risks>
- **Evidence needed:** <evidence>
- **Reversibility:** High | Medium | Low

### Direction 2 — <name>

- **Description:** <direction>
- **Advantages:** <advantages>
- **Disadvantages:** <disadvantages>
- **Risks:** <risks>
- **Evidence needed:** <evidence>
- **Reversibility:** High | Medium | Low

## Recommended direction

<Recommendation or `No recommendation yet`.>

## Recommendation basis

- <reason>
- <reason>

## Remaining uncertainties

- <uncertainty>

## Next decision or action

<The most useful next step.>

## Demand-intake handoff

Include the following when proceeding to demand intake:

- problem
- desired outcome
- users
- chosen direction
- constraints
- assumptions
- open questions
- success signals
- explicit non-goals
```

## Quality checks

Before concluding a consultation, verify:

- The underlying problem is clearer than at the start.
- The proposed solution has not been accepted without examination.
- Desired outcomes are separated from implementation.
- Confirmed facts and assumptions are distinct.
- Constraints and preferences are distinct.
- Options are genuinely different.
- Trade-offs are visible.
- Repository claims have evidence.
- The recommendation does not exceed available evidence.
- Readiness is classified honestly.
- The next step is concrete.
- No code, implementation plan, or file modification was produced.

## Completion response

When the user asks whether the consultation is ready to end, respond with:

1. readiness status
2. the clarified problem in one sentence
3. the desired outcome in one sentence
4. the recommended direction or next investigation
5. the most important remaining uncertainty
6. whether to proceed to demand intake

Keep the response advisory. Do not create implementation tasks.
