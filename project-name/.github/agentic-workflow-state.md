# Agentic Workflow State

This file records stable repository policy for the agentic workflow. Agents must read it before creating, selecting, executing, or reconciling workflow artifacts.

- **Tracking mode:** Not decided
- **Tracking verification:** Not checked
- **Base branch:** Not yet confirmed
- **Artifact naming:** Standard
- **Cross-branch artifact retention:** Keep
- **Automatic artifact selection:** Explicit path or matching active work item
- **Context revision scope:** Matching source branch or confirmed merged base branch
- **Local commit policy:** Not configured
- **Protected tracked overrides:** None
- **Remote update policy:** Standard unless protected paths exist
- **Local rules:** Resolve from active Git directory when present
- **Recorded by:** Not yet confirmed
- **Last reviewed:** Not yet confirmed

## Allowed values

- **Tracking mode:** `Not decided` | `Shared` | `Local-only requested` | `Local-only`
- **Tracking verification:** `Not checked` | `Not required` | `Confirmed excluded` | `Confirmed with protected overrides` | `Pending human action`
- **Artifact naming:** `Standard` | `Work-item-prefixed`
- **Local commit policy:** `Not configured` | `<git-dir>/agentic-workflow/commit-policy.md`

`Local-only` means template-added untracked paths are excluded and any intentional replacements of tracked shared files are registered as protected overrides. `Local-only requested` means that is the intended policy, but exclusion, protected-path registration, or required index flags still need human action.
