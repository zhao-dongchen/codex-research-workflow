# MATLAB Quantitative Model Review Protocol

This is a reference file for independent MATLAB quantitative model review. The reviewer actor is `.codex/agents/matlab_reviewer.toml`.

Review does not replace verification. Review does not replace scoring. Review findings should inform quality scoring when scoring applies.

## Report Structure

Report findings first:

- blockers
- major issues
- minor issues
- verification gaps
- score implications
- recommended fixes or decisions

Distinguish direct evidence, execution-verified facts, inferences, assumptions, and missing evidence.

## Severity

- Blocker: code cannot run for the required task, a core model object is inconsistent with equations, or reported results are unsupported.
- Major: likely affects quantitative results, interpretation, reproducibility, or performance feasibility.
- Minor: local clarity, robustness, metadata, or maintainability issue that does not currently change results.
- Note: useful observation or optional improvement.

## Review Depth And Resource Use

For routine MATLAB changes, focus on changed files, dimensions, obvious numerical risks, and output evidence. Do not require exhaustive review for trivial wrappers or formatting.

For high-risk quantitative model changes, review transition/distribution logic, solvers, interpolation, moments, simulations, estimation objectives, performance/memory, and tests more deeply.

If execution evidence is missing for numerical claims, flag it rather than compensating with more static review.

## Review Checklist

### Model-Code Architecture

- Map authoritative source files, generated files, run order, and outputs.
- Check function boundaries and whether code organization preserves whole-model coherence.
- Flag over-modularization or hidden dependencies that can create coordination errors.

### Dimensions And Array Conventions

- Check dimensions for major arrays.
- Check state, control, shock, policy, value, distribution, simulation, and moment object conventions.
- Flag ambiguous row/column orientation or inconsistent indexing.

### Grid Construction

- Check grid bounds, spacing, support, state ordering, shock discretization, and boundary treatment.
- Confirm grids match the model's economic state space.

### Interpolation And Off-Grid Policies

- Check bracketing, interpolation weights, exact-on-grid behavior, boundary handling, support, and policy bounds.
- Flag interpolation that silently changes the economic object.

### Transition Matrices

- Check dimensions, nonnegative probabilities, row/column stochastic convention, exact-on-grid mapping, off-grid splitting, sparse/dense consistency when relevant, and aggregation conventions.

### Distribution Updates

- Check mass conservation, nonnegativity, support, stationary residuals or update distance, and consistency with transition conventions.

### VFI, Solver, And Fixed-Point Logic

- Check feasibility masks, Bellman equations or residuals, convergence criteria, tolerance choices, policy bounds, NaN/Inf handling, and benchmark behavior when available.

### Simulation Logic

- Check initialization, seeds, burn-in, path length, support, policy application, shock processes, aggregation, and simulated moment construction.

### Moment Construction

- Check data/model comparability, moment definitions, scaling, weighting, missing or invalid outputs, and whether moments move in expected directions under informative perturbations.

### Calibration, Estimation, And Objectives

- Check parameter mappings, bounds, transformations, optimizer settings, objective contributions, weighting matrix, stochastic objective stability, failure regions, and convergence evidence.

### Economic Model Logic

- Check timing, state/control/shock definitions, constraints, value functions, equilibrium conditions, lender/firm/household/objective logic when relevant, and whether numerical shortcuts alter economics.
- Check consistency between paper/model equations and code when equations or notes are available.

### Vectorization, Memory, And Performance

- Check preallocation, sparse structures, caching, repeated expensive construction, avoidable temporary arrays, and whether performance claims cite timing/profiling evidence.
- Flag vectorization that creates memory pressure or hides model logic.

### Test And Probe Coverage

- Check whether validation intensity matches complexity, novelty, and result importance.
- High-risk components need targeted probes or tests, proportionate to their effect on results.
- Long-project complexity is not a reason to skip validation.

### Reproducibility And Output Freshness

- Check entrypoints, commands, MATLAB/toolbox versions, logs, generated outputs, timestamps, hashes when useful, seeds, and whether outputs were regenerated from current code.

### Unsupported Claims

- Flag unsupported numerical, economic, performance, convergence, or output-freshness claims.
