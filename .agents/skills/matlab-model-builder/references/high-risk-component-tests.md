# High-Risk MATLAB Model Component Tests

Use this reference for targeted tests and probes inside `matlab-model-builder`.

## Transition Matrix And Off-Grid Policy Tests

- Check matrix dimensions.
- State row- or column-stochastic convention clearly.
- Check nonnegative weights and probabilities.
- Check sums equal one under the stated convention.
- Check exact-on-grid policies map exactly.
- Check off-grid policies split mass to neighboring grid points correctly.
- Check boundary cases deliberately.
- Check support is respected.
- Check probability mass is conserved after distribution updates.
- Compare sparse and dense implementations on a small object when both are relevant.
- Check aggregation before/after transition matches the intended object.

## Interpolation Weight Tests

- Verify bracketing indices at interior and boundary points.
- Test exact grid points, below-bound, above-bound, and midpoint cases.
- Check weights are nonnegative and sum to one where appropriate.
- Check interpolated policy/value monotonicity only when the model implies it.

## Distribution Mass-Conservation Tests

- Check total mass before and after update.
- Check mass by economically meaningful groups when relevant.
- Check distributions remain on support and nonnegative.
- Check stationary-distribution residuals or update distance when feasible.

## VFI, Bellman, Solver, And Fixed-Point Tests

- Check feasibility masks.
- Check policies stay within bounds.
- Check value and policy dimensions.
- Report convergence criteria and iteration counts.
- Check Bellman residual or fixed-point residual when feasible.
- Use a small-grid or analytic benchmark when available.
- Check for silent NaN/Inf failures.

## Simulation Tests

- Check seed control and initialization.
- Check state support and policy bounds over simulated paths.
- Check burn-in and sample length are deliberate.
- Compare simulated moments with stationary-distribution moments when both are intended to match.
- Perturb parameters and confirm qualitative moment directions when the economics imply a direction.

## Moment And Objective Tests

- Check data/model comparability.
- Check moment scaling and weighting.
- Check objective contributions by moment.
- Check behavior at baseline, perturbed, and failure-region parameters.
- Check deterministic reproducibility when seeds are fixed.

## Small Probes

- Use tiny grids to expose indexing, mass movement, and boundary behavior.
- Compare loop and vectorized versions on small or medium objects.
- Time expensive blocks before making performance claims.
- Record probe outputs when they justify implementation choices.
