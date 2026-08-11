# Subagent: Governance and Workflow Docs

Use this module when customizing `.github/copilot-instructions.md`, `AGENTS.md`, or `docs/DEFINITION_OF_DONE.md`. Read `evidence-gathering.md` first if the evidence inventory has not been built yet.

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

## `docs/DEFINITION_OF_DONE.md`

Tailor completion requirements to actual repository workflows and quality gates.

Avoid listing checks that the repository cannot perform.
