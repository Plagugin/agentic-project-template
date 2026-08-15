# Human action required: <short title>

- **Kind:** Human action request
- **Status:** Open | Resolved | Superseded
- **Raised by:** demand-intake | technical-planner | plan-executor | solution-discovery-consultant
- **Date:** <YYYY-MM-DD>
- **Related demand:** `demands/<slug>.md` (or `None yet`)
- **Related plan:** `plans/<slug>-implementation-plan.md` (or `None yet`)
- **Affected task(s):** `TASK-00X` (or `Not applicable`)

## What needs a human

<Describe the exact action a person must take, and why an agent cannot do it. Examples: manual exploratory or hardware-in-the-loop testing, granting repository/cloud/service access, approving a cost or vendor, running a destructive or production-affecting command, physically inspecting equipment, obtaining a credential or secret, making a business or legal decision.>

## Why an agent cannot do this

<State the actual constraint: missing credentials, no safe rollback, requires human judgment or authority, requires physical presence, prohibited destructive/remote action, outside agent tooling.>

## Exact steps for the human

1. <step>
2. <step>

## What happens after it is done

<What the agent will do next once the action is completed, and how the human should signal completion (for example: update this file's status, or tell the agent directly).>

## Blocking?

- **Blocks further work:** Yes | No
- **If yes, which task(s) are paused:** `TASK-00X`
- **If no, what can continue in the meantime:** <description>

## Resolution

<Filled in when status changes to Resolved: what the human did, when, and any follow-up it revealed.>
