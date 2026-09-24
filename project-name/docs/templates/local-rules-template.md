# Clone-Local Agent Rules

These rules apply only to this clone or worktree. Agents must read every enabled rule before planning commands, modifying covered files, selecting validation, or performing local or remote operations.

- **Registry status:** Active
- **Rule location:** `<git-dir>/agentic-workflow/local-rules.md`
- **Next rule ID:** `LOCAL-RULE-001`
- **Last reviewed:** Not yet confirmed

## Effects

| Effect | Required behavior |
|---|---|
| `Prohibit` | Do not perform the covered action. |
| `Require` | Satisfy or verify the rule before proceeding. |
| `Confirm` | Obtain explicit user confirmation before the covered action. |
| `Prefer` | Use this behavior by default unless stronger evidence requires another choice. |
| `Warn` | The action is allowed, but report the stated risk before proceeding. |

## Rule lifecycle

- **Enabled** — applies to agent work.
- **Disabled** — retained but does not apply.
- **Retired** — historical rule that must not be re-enabled; create a new rule instead.

## Rules

No rules configured.

Remove `No rules configured.` when adding the first rule.

Use this entry format:

```markdown
## LOCAL-RULE-NNN — <short title>

- **Status:** Enabled | Disabled | Retired
- **Effect:** Prohibit | Require | Confirm | Prefer | Warn
- **Scope:** Command execution | File modification | Validation | Remote action | Environment | General
- **Applies to:**
  - <exact command, path, task type, environment, or condition>
- **Rule:** <direct instruction>
- **Alternative:** <safe alternative, human action, remote workflow, or `None`>
- **Reason:** <why this clone needs the rule>
- **Created:** <YYYY-MM-DD>
- **Updated:** <YYYY-MM-DD>
- **Source:** User
```

## Enforcement

- Enabled rules may make local behavior stricter but cannot grant permissions, weaken safety or security, authorize destructive or remote actions, or suppress truthful reporting.
- Do not broaden an exact command, path, or test restriction beyond what the user stated.
- A normal prompt that conflicts with an enabled rule does not silently override it. Report the conflict and require the user to update or disable the rule through `m-rule`.
- When a prohibited or unavailable validation is still required by a demand or plan, preserve it as remote or human validation and report it as not run locally.
- Never report a skipped, prohibited, remote, or human-run check as locally passed.
- Do not store secrets, credentials, tokens, sensitive production values, or personal data in this registry.
- Do not copy rule content or IDs into tracked repository artifacts unless the user explicitly converts the rule into shared project policy.
