# Model Design Plan Template

Use this reference when a MATLAB quantitative model needs a structured design or implementation plan.

## Model Goal

- Research or computational purpose:
- Target outputs:
- Intended empirical or quantitative use:

## Model Objects

- State variables:
- Control variables:
- Shocks and exogenous processes:
- Prices and equilibrium objects:
- Constraints and feasibility conditions:
- Value and policy objects:
- Distribution objects:
- Moment and objective objects:

## Timing And Logic

- Within-period timing:
- Laws of motion:
- Equilibrium, fixed-point, or market-clearing logic:
- Interpretation-sensitive choices:

## Numerical Challenges

- Nonstandard structures:
- Interpolation or off-grid objects:
- Transition/distribution mechanics:
- Solver or fixed-point risks:
- Simulation, calibration, estimation, or SMM risks:
- Speed and memory risks:

## Implementation Components

- Component map:
- Run order:
- Inputs and outputs:
- Downstream dependencies:

## High-Risk Tests And Probes

- Light-check components:
- Moderate-risk components:
- High-risk or result-critical components:
- Tiny-grid probes:
- Boundary probes:
- Sparse/dense comparisons:
- Moment-direction checks:
- Integration and sanity checks:

## Open Decisions

- User decisions needed:
- Assumptions:
- Direct evidence:
- Inferences:
- Unresolved questions:
