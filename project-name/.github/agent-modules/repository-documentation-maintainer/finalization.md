# Subagent: Finalization

Use this module last, after all target documents have been maintained: cross-check documents, resolve processed context-revision entries, remove template residue, review the diff, and produce the completion response. Also holds the duplication map, material-uncertainty rules, and completion criteria.

## Resolve processed context-revision entries

In `Revise` mode, update every processed pending entry in `feedback/context-revisions.md`:

- use `Accounted for` when documentation was updated or confirmed current
- use `No revision needed` when repository evidence shows no contextual documentation change is warranted
- use `Superseded` when another entry or later change replaces it
- record the resolution date
- list documents reviewed and documents changed
- include a commit reference when available, but do not require one
- explain the resolution briefly and factually

Do not delete resolved entries. Do not mark an entry resolved when a material candidate document was not reviewed.

When the workflow state is local-only, do not resolve an entry from an unrelated branch. Resolve it only on its source branch or on its recorded base branch after repository evidence confirms the change is present and merge status is updated to `Merged`.

## Step 6: Cross-check documents

Ensure:

- project names and terminology are consistent
- commands match manifests, scripts, and CI
- paths exist
- architecture statements match source evidence
- test locations match actual files
- generated-file rules match generator definitions
- sources of truth do not conflict across documents
- security language does not expose sensitive details
- one topic has one primary authoritative document
- instruction files reference detailed documents instead of duplicating them

When two existing sources conflict, document the conflict in the most relevant file and include it in the completion report.

## Step 7: Remove template residue

Before completion, search the edited documents for:

- `<...>` placeholders
- example project names
- generic example diagrams
- generic commands
- `TODO`
- `TBD`
- contradictory status values
- references to files that do not exist
- claims unsupported by evidence

Allowed unresolved markers are:

- `Not yet confirmed`
- `Not applicable`
- a clearly identified open question with impact and suggested owner

Do not leave placeholders that look like instructions to future agents.

## Step 8: Review the documentation diff

Check that:

- only approved documentation files changed
- accurate existing content was preserved
- no secrets or sensitive values were introduced
- no source code or configuration changed
- broad formatting rewrites did not obscure meaningful edits
- file references are repository-relative
- Markdown structure is valid
- diagrams describe the actual system
- documents are useful and not merely template-complete

## Duplication rules

Use these primary homes:

| Information | Primary document |
|---|---|
| Always-on Copilot guidance | `.github/copilot-instructions.md` |
| Agent workflow | `AGENTS.md` |
| Purpose, users, domain, boundaries, ownership | `docs/PROJECT_CONTEXT.md` |
| Current technical structure and flows | `docs/ARCHITECTURE.md` |
| Setup, build, run, and developer commands | `docs/DEVELOPMENT.md` |
| Testing strategy and commands | `docs/TESTING.md` |
| Security development guidance | `docs/SECURE_DEVELOPMENT.md` |
| Completion criteria | `docs/DEFINITION_OF_DONE.md` |
| Current architecture, material decisions, rationale, and consequences | `docs/ARCHITECTURE.md` |

Other files should summarize and reference the primary document instead of repeating extensive detail.

## Document density

Replace reusable templates with concise project-specific documents. Do not preserve sections merely because the template contains them.

Typical initialized targets:

| Document | Typical size |
|---|---:|
| `.github/copilot-instructions.md` | 100–200 lines |
| `AGENTS.md` | 150–250 lines |
| `docs/PROJECT_CONTEXT.md` | 100–200 lines |
| `docs/ARCHITECTURE.md` | 150–300 lines |
| `docs/DEVELOPMENT.md` | 100–200 lines |
| `docs/TESTING.md` | 100–200 lines |
| `docs/SECURE_DEVELOPMENT.md` | 100–200 lines |
| `docs/DEFINITION_OF_DONE.md` | 50–100 lines |

These are density targets, not hard limits. Exceed them only when additional content changes understanding, operation, validation, security, or risk management.

Prefer direct sentences, short tables, and references to authoritative sources. Remove irrelevant template sections instead of filling them with repeated `Not applicable` values.

## Material uncertainty

Do not block useful documentation for minor gaps.

Mark the result as requiring review when uncertainty affects:

- project purpose
- ownership
- system boundaries
- source-of-truth ownership
- critical invariants
- supported runtime versions
- official setup or validation commands
- deployment model
- authentication or authorization
- sensitive-data handling
- destructive migration or cleanup behavior

## Completion criteria

Documentation maintenance is complete when:

- all selected documents are maintained or explicitly reported as not applicable
- project facts are grounded in repository evidence
- commands match repository definitions
- template residue has been removed
- unknown material information is visible
- documents do not substantially duplicate each other
- initialized documents are proportional and do not preserve unnecessary template bulk
- instruction files are concise and reference detailed documentation
- paths and cross-references are valid
- the workflow-state decision and verification result match repository evidence
- clone-local protected paths and tracked overrides are recorded consistently in the workflow state and Git-directory policy
- the clone-local rule registry exists when configured and no rule content leaked into shared documentation
- no application, test, build, dependency, schema, infrastructure, or shared Git configuration file was modified
- only approved documentation or clone-local Git policy files were edited
- the documentation diff has been reviewed
- every processed ledger entry has an evidenced terminal status

## Completion response

Respond with:

```markdown
## Documentation maintenance result

**Status:** Complete | Complete with review items | Partially complete | Blocked
**Mode:** Bootstrap | Initialize | Revise | Audit
**Repository:** <repository name or path>
**Files updated:** <count>

### Updated files

- `<path>` — <what was maintained>

### Evidence reviewed

- <important manifests, workflows, source areas, tests, and existing docs>

### Confirmed project facts

- <important fact>

### Review items

- <unknown, inference, contradiction, or `None`>

### Files not created or updated

- `<path>` — <reason, or `None`>

### Context-revision entries

- `<entry ID>` — Accounted for | No revision needed | Superseded | Still pending: <reason>

### Workflow state

- Tracking mode: Shared | Local-only | Local-only requested
- Verification: Not required | Confirmed excluded | Confirmed with protected overrides | Pending human action
- Base branch: <branch or `Not yet confirmed`>
- Commit policy: <path or `Not configured`>
- Local rules: <path or `Not configured`; enabled rule count>
- Protected tracked overrides: <paths or `None`>
- Pre-commit guard: Installed | Existing hook requires integration | Not requested

### Safety check

- Application, test, build, dependency, schema, or infrastructure files modified: No
- Clone-local Git files modified: <paths or `None`>
- Commands executed: <read-only Git inspection commands or `None`>
- Secrets introduced: No
```

Do not include an implementation proposal or modify application code.
