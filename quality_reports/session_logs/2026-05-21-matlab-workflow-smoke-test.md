# MATLAB Workflow Smoke Test

## Task

Run a temporary MATLAB workflow smoke test for the new MATLAB skill/subagent architecture. The test is a toy quantitative-model component, not a real model.

## Planner Findings

The toy component has:

- state grid: one-dimensional asset/capital grid `a_grid = [0, 1, 2, 3, 4]`
- policy object: deterministic next-period asset/capital policy with off-grid values `[0, 0.5, 1.5, 3.2, 4]`
- transition object: row-stochastic transition matrix `T`
- distribution object: row-vector distribution updated as `distribution_next = distribution_current * T`
- aggregate object: distribution-weighted grid average before and after applying the policy

High-risk/result-critical pieces for this toy test:

- interpolation weights
- exact-on-grid and off-grid mapping
- boundary handling
- row-stochastic convention
- mass conservation after distribution update
- sparse/dense consistency on the tiny case

## Builder Implementation

Created all test artifacts under:

```text
quality_reports/session_logs/matlab_workflow_test/
```

Files:

- `toy_transition_matrix_test.m`
- `matlab_output.log`
- `matlab_batch_stdout.log`
- `manifest.txt`
- `artifact_hashes.txt`
- `transition_check.csv`
- `transition_check.mat`

The script anchors outputs to its own directory, builds a dense transition matrix, compares dense and sparse distribution updates, runs targeted probes, writes a CSV/MAT output, and records a manifest.

## Command

Final MATLAB command:

```sh
/Applications/MATLAB_R2025b.app/bin/matlab -batch "run('quality_reports/session_logs/matlab_workflow_test/toy_transition_matrix_test.m')" > quality_reports/session_logs/matlab_workflow_test/matlab_batch_stdout.log 2>&1
```

The command required local MATLAB app execution. The final successful run recorded:

- MATLAB version: `25.2.0.3177638 (R2025b) Update 5`
- log timestamp: `2026-05-21 03:18:28 UTC`
- manifest timestamp: `2026-05-21 03:18:29 UTC`

## Probe Findings

All targeted probes passed:

- correct transition matrix dimensions
- nonnegative interpolation weights
- nonnegative transition probabilities
- row sums equal one under the stated row-stochastic convention
- exact-on-grid low and high policies map exactly
- off-grid policies split mass correctly
- upper boundary case is handled deliberately
- total distribution mass is conserved
- sparse and dense transition applications match
- aggregate after transition matches the policy-implied aggregate
- aggregate movement is plausible for the chosen downward-shifting policy

Final integration check:

- mass before: `1`
- mass after: `1`
- aggregate before: `2.15`
- aggregate after: `1.95`
- expected aggregate after from policy: `1.95`

Performance/memory note:

- dense transition matrix: `200` bytes
- sparse transition matrix: `176` bytes
- dense is acceptable for this tiny grid; large sparse transition operators should use sparse matrices and avoid accidental densification.

## Verification Evidence

The `verifier` subagent checked the final artifacts read-only and reported `PASS`.

Verified:

- final outputs are newer than the edited script
- explicit UTC timestamps are present
- command evidence is present
- hash evidence matches current bytes for script, logs, CSV, MAT output, and manifest
- all 13 probes passed
- transition CSV values match expected interpolation behavior
- MAT file is readable and contains expected variables
- mass conservation and aggregate movement checks passed
- no accidental root-level MATLAB outputs were found

Remaining verifier gaps:

- verifier did not rerun MATLAB; it verified recorded artifacts
- artifact files are currently untracked until staged/committed

## Independent MATLAB Review

An independent subagent acted as `matlab_reviewer` and read `.codex/agents/references/matlab-review-protocol.md` first. The runtime did not expose the newly added `matlab_reviewer` role name directly in the spawn list, so the reviewer was launched as a generic subagent with explicit `matlab_reviewer` instructions.

Review findings:

- Blockers: none.
- Major issues: none.
- Minor issues: machine-specific MATLAB command path, weak initial timezone formatting, missing hashes, and limited defensive input validation in the toy helper.

Fixes applied:

- changed timestamps to explicit UTC
- added `artifact_hashes.txt`
- included manifest hash in the final hash file
- kept the helper intentionally toy-scoped rather than turning it into a reusable production transition-matrix library

Accepted residual risks:

- command path is machine-specific observed execution evidence
- reviewer did not rerun MATLAB
- invalid-grid/NaN/wrong-length defensive tests are outside this smoke-test scope

## Score

Final quality score: `94`.

Threshold interpretation: strong internal workflow smoke test.

No score cap was applied. Deductions reflect:

- machine-specific MATLAB command path
- reviewer/verifier did not rerun MATLAB independently
- toy helper is not a production reusable transition-matrix library

## Conclusion

The new MATLAB workflow activated correctly for a toy quantitative-model component:

- `matlab-model-planner` guided design and high-risk component identification.
- `matlab-model-builder` guided implementation, probes, integration checks, and performance/memory note.
- verifier checked output freshness and reproducibility evidence.
- independent MATLAB review used `.codex/agents/references/matlab-review-protocol.md`.
- scoring used the MATLAB score template criteria.

This smoke test does not prove behavior on a full real model with equilibrium solving, VFI, calibration, estimation, simulation, generated outputs, paper claims, large arrays, or real performance constraints.
