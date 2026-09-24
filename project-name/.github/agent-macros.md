# Agent Macros

Agent macros are short, deterministic prompt commands for recurring repository workflows.

## Invocation protocol

- A macro is invoked only when the first standalone token in the user's prompt exactly matches a registered lowercase `m-` name.
- Everything after the macro token is its argument.
- Ordinary mentions of HTML, text, reports, or a macro name elsewhere in a prompt do not invoke a macro.
- Apply at most one macro per prompt. Do not recursively expand macros.
- Explicit arguments override the macro's defaults when they do not conflict with safety or repository instructions.
- Unknown or misspelled `m-` tokens must not be guessed, partially matched, or treated as another macro.
- A macro is an explicit user request, but it does not override safety, privacy, role boundaries, or repository-protection rules.
- When the active agent does not own a macro and cannot perform it within its tools and role, identify the required owner instead of approximating the macro.

## `m-help`

- **Owner:** Any agent.
- **Purpose:** Explain this template's agents, workflows, macros, setup choices, Git boundaries, report locations, and cost controls.
- **Arguments:** Optional topic: `agents`, `workflows`, `macros`, `setup`, `git`, `branches`, `rules`, `reports`, `costs`, or `all`.
- **Source:** `.github/template-help.md`
- **Output:** Concise response in the conversation.
- **File output:** None.
- **Repository inspection:** None unless the user explicitly asks whether the current repository differs from the template.

Behavior:

1. With no argument, return the `Overview` section and the valid topic list.
2. With a valid topic, return only the matching section.
3. With `all`, return the complete help document.
4. For an unknown topic, list valid topics without guessing.
5. Do not regenerate the guide from repository inspection or load unrelated contextual documentation.
6. Distinguish native Copilot CLI commands such as `/help` from template macros.

Examples:

```text
m-help
m-help agents
m-help git
m-help branches
m-help rules
m-help costs
m-help all
```

## `m-html`

- **Owner:** `plan-executor`; the default assistant may also execute it when completed implementation evidence is available.
- **Purpose:** Create a conversational, non-technical HTML summary of completed implementation work for a product owner, project manager, or similar stakeholder.
- **Arguments:** Optional audience, emphasis, title, or output path.
- **Evidence:** The current or most recent completed execution, its plan or direct instructions, changed files, validation evidence, and open feedback items.
- **Template:** `docs/templates/stakeholder-summary-template.html`
- **Default output:** `reports/stakeholder/<plan-file-stem>-summary.html`; when no plan exists, derive a short kebab-case stem from the completed work.
- **Tracking:** Tracked project deliverable in Shared mode; local-only when `.github/agentic-workflow-state.md` says `Local-only` or `Local-only requested`. An explicit `reports/local/` destination is always local-only.

Behavior:

1. Follow `.github/agent-modules/plan-executor/stakeholder-summary.md`.
2. Explain the problem, delivered outcome, stakeholder impact, verification, remaining risk, and next steps in plain language.
3. Avoid implementation-heavy prose, raw command output, and unsupported claims.
4. Do not replace or omit the normal technical completion response.
5. If no completed implementation can be identified, do not invent one. State which execution, plan, report, or change scope is needed.

Examples:

```text
m-html
m-html focus on customer impact and remaining rollout work
m-html save to reports/stakeholder/release-2-summary.html
```

The following does not invoke this macro:

```text
Create an HTML diagram of the authentication flow.
```

## `m-rule`

- **Owner:** The default assistant or `repository-documentation-maintainer`.
- **Purpose:** Manage structured rules that apply only to the current clone or worktree.
- **Arguments:** One exact operation:
  - `add <rule>`
  - `list`
  - `show <LOCAL-RULE-NNN>`
  - `update <LOCAL-RULE-NNN> <replacement rule>`
  - `enable <LOCAL-RULE-NNN>`
  - `disable <LOCAL-RULE-NNN>`
  - `retire <LOCAL-RULE-NNN>`
- **Template:** `docs/templates/local-rules-template.md`
- **Default output:** `<git-dir>/agentic-workflow/local-rules.md`
- **Tracking:** Clone-local and never committed.

Behavior:

1. Resolve the destination with `git rev-parse --path-format=absolute --git-path agentic-workflow/local-rules.md`.
2. Create the registry from the template when it does not exist.
3. For `add`, preserve the user's exact restriction, ask only when effect, scope, covered action, or safe alternative is materially ambiguous, assign the next stable `LOCAL-RULE-NNN` identifier, and default the status to `Enabled`.
4. For `list`, return a concise table of ID, status, effect, scope, and title. Do not dump full rule prose.
5. For `show`, return the exact matching entry.
6. For `update`, preserve the ID and created date, replace only the intended rule fields, and update the date.
7. For `enable` or `disable`, change only status and updated date.
8. For `retire`, set status to `Retired`. Retired rules cannot be updated or re-enabled; add a replacement rule instead.
9. Reject unknown operations, invalid lifecycle transitions, malformed IDs, duplicate active rules, empty rule text, secrets or sensitive values, and rules that attempt to weaken safety, grant permissions, conceal failures, or authorize prohibited actions.
10. Report the rule ID and registry path after a successful change.
11. When the active agent does not own this macro, identify the default assistant or documentation maintainer rather than editing another file.

Examples:

```text
m-rule add Never run tests tagged remote-only on this machine; request execution on the remote test PC instead.
m-rule list
m-rule show LOCAL-RULE-001
m-rule disable LOCAL-RULE-001
m-rule update LOCAL-RULE-001 Never run system or hardware integration tests locally; use the remote test PC.
m-rule retire LOCAL-RULE-001
```

The following does not invoke this macro:

```text
Add a project rule explaining our API naming convention.
```

## `m-text`

- **Owner:** The default assistant or any active agent with file-edit capability.
- **Purpose:** Write concise, copy-ready plain text for the current developer.
- **Arguments:** A required description of the requested content and an optional output path.
- **Evidence:** Current conversation and repository evidence available to the active agent.
- **Default output:** `reports/local/<derived-topic>.txt`
- **Tracking:** Local-only and ignored by Git.

Behavior:

1. Produce UTF-8 plain text without Markdown formatting unless the user explicitly requests otherwise.
2. Keep the content focused on the requested material; do not add a completion report, preamble, or conversational framing to the file.
3. Derive a short kebab-case filename from the request when no path is supplied.
4. Use `reports/local/` unless the user explicitly supplies another safe path.
5. Never include secrets, credentials, sensitive production data, or unsupported claims.
6. Report the created path briefly in the response.

Examples:

```text
m-text list the files changed during the last execution
m-text give me the deployment commands in execution order
m-text save to reports/local/release-message.txt and summarize the user-visible changes
```

## Adding macros

Every new macro must define:

| Field | Requirement |
|---|---|
| Name | Exact lowercase `m-` token |
| Owner | Agent or agents allowed to execute it |
| Purpose | Stable semantic meaning, not only a file format |
| Arguments | Required and optional prompt remainder |
| Evidence | Sources the macro may rely on |
| Output | Content and format contract |
| Default path | Deterministic destination |
| Tracking | Tracked deliverable or local-only output |
| Failure behavior | What happens when required context is unavailable |

Prefer a small registry of durable intents. Do not add aliases or near-duplicate macros merely to save a few characters.
