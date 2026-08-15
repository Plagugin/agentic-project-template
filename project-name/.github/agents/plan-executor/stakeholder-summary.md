# Subagent: Stakeholder Summary

Use this module only when a plain-language, non-technical summary of finished work is useful: the user asks for one, the plan explicitly requires one, or the completed work is substantial enough that a product owner or manager would benefit from a summary that does not require reading code or a technical report.

Do not produce this for a small task. It is an optional, additional deliverable — never a replacement for the completion response or the optional execution report defined in `completion-reporting.md`.

## When to create one

Create a stakeholder summary when any of these are true:

- the user explicitly asks for a summary for a non-technical audience, product owner, or manager
- the plan's executor handoff or documentation section requires one
- the completed work resolves a customer-visible defect, ships a noticeable feature, or closes out a multi-task plan, and no other stakeholder-facing summary already exists for it

Do not create one merely because a task finished. Most small and medium tasks are adequately covered by the normal completion response.

## Audience and tone

Write for someone who:

- does not read code
- cares about impact, risk, and what happens next
- needs to know what is confirmed working versus still open
- may need to make a decision or communicate status onward

Avoid:

- code identifiers, stack traces, or command output in the prose
- architecture jargon without a plain-language explanation
- overstating certainty — distinguish verified evidence from remaining risk, exactly as the completion response does

## How to produce it

1. Start from `docs/templates/stakeholder-summary-template.html`. Copy it; do not edit the template file in place.
2. Fill in every placeholder using only information already established during execution (the plan, the demand, the completion evidence, and any open items). Do not invent evidence, outcomes, or approvals that were not actually produced.
3. Keep the same section structure as the template (problem, what was done, evidence it works, what's still open, impact and next steps) unless a section is genuinely not applicable — state that explicitly rather than deleting it silently.
4. Reflect any open blocker or human-action report from `feedback/` that affects the reader's understanding of remaining risk.

## Output location

Use this precedence:

1. a path explicitly supplied by the user
2. `reports/summaries/<plan-file-stem>-summary.html` when a `reports/` directory exists
3. `<plan-file-stem>-summary.html` at the repository root

This file is a project deliverable tied to the plan/demand it summarizes, and is committed like other generated documentation unless the user says otherwise. It is not the same as a `dev-notes/` file, which is personal, freeform, and never committed.

## Completion response addition

When a stakeholder summary is created, add one line to the final response noting its path and audience. Do not replace the technical completion response with it.
