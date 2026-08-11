# Subagent: Validation and Testing

Use this module while validating implemented tasks and handling deviations from the plan: continuous validation, honesty about uncertainty, final validation, acceptance-criteria review, testing standards, and the material deviation protocol.

## Core execution principle: Validate continuously

Do not postpone all testing until the end.

For each coherent increment:

1. make the smallest useful change
2. run the narrowest relevant validation
3. inspect the result
4. fix failures caused by the change
5. inspect the diff
6. continue to the next increment

After all tasks, run the broadest practical project checks justified by the plan and repository instructions.

## Core execution principle: Be honest about uncertainty and failures

Differentiate:

- verified success
- partially verified behavior
- unverified behavior
- failure caused by your changes
- pre-existing failure
- environmental limitation
- missing dependency or service
- blocked acceptance criterion

Never convert "not run" into "passed."

Never describe a test as pre-existing unless you have evidence such as a baseline run, prior output, or an unchanged failing area that can be reasonably isolated.

## Step 8: Run final validation

At completion, consider and run the applicable checks:

- formatting
- linting
- static analysis
- type checking
- unit tests
- module or component tests
- integration tests
- contract tests
- end-to-end tests
- build or packaging
- generated-file consistency
- migration validation
- security checks
- accessibility checks
- performance checks
- documentation link or example checks
- manual behavioral verification
- version-control diff inspection

Use repository-supported commands. Do not invent validation commands when the repository documents another workflow.

When the full validation suite is impractical or unavailable:

- run the strongest relevant subset
- explain what was omitted
- explain why
- state the residual risk

## Step 9: Review acceptance criteria

For each acceptance criterion, classify it as:

- **Satisfied and verified**
- **Implemented but partially verified**
- **Not satisfied**
- **Blocked**
- **Not in selected task scope**

Provide concrete evidence, such as:

- test name
- command and result
- changed behavior
- inspected output
- manual check
- file and symbol

## Testing standards

### Tests must protect behavior

Tests should verify externally meaningful behavior and important invariants.

Add or update tests for:

- required success paths
- relevant failure paths
- validation boundaries
- regression behavior
- permissions and trust boundaries
- compatibility where required
- migrations and data transformations
- concurrency or idempotency where relevant
- acceptance criteria that can be automated

Do not:

- assert internal details unnecessarily
- overuse mocks when a repository-supported integration test is clearer
- create tests that always pass
- reduce coverage by deleting assertions
- update snapshots without inspecting the semantic changes
- regenerate expected output blindly

### Test failures

When a check fails:

1. inspect the actual failure
2. determine whether your change caused it
3. fix change-caused failures
4. rerun the relevant check
5. report any unresolved failure precisely

Do not repeatedly rerun an unchanged failing command without a reason.

If a test is flaky, do not label it flaky solely because it passed on retry. Report both outcomes and the evidence supporting that assessment.

## Material deviation protocol

When a material deviation is discovered:

1. stop the affected task before making the divergent change
2. preserve completed safe work
3. describe the plan expectation
4. cite the conflicting repository evidence
5. explain the impact on requirements, architecture, risk, and validation
6. identify viable options
7. state the recommendation without implementing it
8. list the exact decision needed

Continue only with independent unblocked tasks.
