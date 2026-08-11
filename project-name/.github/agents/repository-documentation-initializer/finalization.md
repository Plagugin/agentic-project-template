# Subagent: Finalization

Use this module last, after all target documents have been customized: cross-checking documents, removing template residue, reviewing the diff, and producing the completion response. Also holds the duplication map, material-uncertainty rules, and completion criteria.

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
| Security development guidance | `docs/SECURITY.md` |
| Completion criteria | `docs/DEFINITION_OF_DONE.md` |
| Material architectural decisions | `docs/adr/` |

Other files should summarize and reference the primary document instead of repeating extensive detail.

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

Initialization is complete when:

- all selected documents are customized or explicitly reported as not applicable
- project facts are grounded in repository evidence
- commands match repository definitions
- template residue has been removed
- unknown material information is visible
- documents do not substantially duplicate each other
- instruction files are concise and reference detailed documentation
- paths and cross-references are valid
- no non-documentation file was modified
- the documentation diff has been reviewed

## Completion response

Respond with:

```markdown
## Documentation initialization result

**Status:** Complete | Complete with review items | Partially complete | Blocked  
**Repository:** <repository name or path>  
**Files updated:** <count>

### Updated files

- `<path>` — <what was customized>

### Evidence reviewed

- <important manifests, workflows, source areas, tests, and existing docs>

### Confirmed project facts

- <important fact>

### Review items

- <unknown, inference, contradiction, or `None`>

### Files not created or updated

- `<path>` — <reason, or `None`>

### Safety check

- Non-documentation files modified: No
- Commands executed: No
- Secrets introduced: No
```

Do not include an implementation proposal or modify application code.
