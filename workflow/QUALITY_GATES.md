# Quality Gates

Quality gates define when work can move from one stage to the next.

## Planning Gate

Before implementation:

- The objective is clear.
- Scope and non-scope are stated.
- Risks and assumptions are visible.
- Verification and review steps are defined.
- The plan is approved for nontrivial work.

## Implementation Gate

Before claiming implementation is done:

- Changes match the approved plan.
- Unrelated files are not modified.
- Important assumptions are documented.
- The implementation is ready for verification.

## Verification Gate

Before review:

- Relevant checks have been run where possible.
- Evidence has been recorded.
- Failures are fixed or explicitly documented.
- Unverified areas are identified.

## Review Gate

Before finalization:

- Review findings have been addressed or accepted as residual risk.
- Important research assumptions and reproducibility concerns have been considered.
- Evidence supports the completion claim.

## Handoff Gate

Before ending substantial work:

- `PROJECT_STATE.md` is updated if project state changed.
- Plans, logs, reviews, specs, or checkpoints are saved when appropriate.
- The final summary states changes, evidence, and residual uncertainty.

## Research-Specific Gate

For academic research work, also check:

- Data provenance is noted.
- Sample construction or calibration assumptions are visible.
- Outputs can be reproduced from recorded commands where feasible.
- Numerical results have basic sanity checks.
- Claims are tied to evidence rather than memory or intuition.
