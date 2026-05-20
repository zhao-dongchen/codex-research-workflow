---
name: review-matlab-model
description: "Use for read-only review of MATLAB quantitative economic model code: audit economic correctness, numerical correctness, downstream consistency, performance, memory, readability, generated-code/toolchain risks, outputs, and verification evidence. Produce a MATLAB Model Review Report. Do not use as the primary producer skill for model implementation, and do not edit code by default."
---

# Review MATLAB Model

Use this skill for read-only diagnosis of MATLAB quantitative economic model code, numerical routines, outputs, and reproducibility. The user-facing job is a severity-ranked `MATLAB Model Review Report`, not implementation.

## Default Behavior

- Default to read-only diagnosis and findings first.
- Do not modify code unless the user asks for fixes or approves a follow-up implementation plan.
- Inspect relevant project instructions, model notes, MATLAB code, logs, outputs, documentation, generated-code relationships, and paper or LaTeX files when present.
- Distinguish direct code inspection, execution-verified behavior, inference from theory/model files, assumptions, user-confirmed facts, and unresolved questions.
- If code, logs, data, or outputs are inaccessible, review available files anyway, but label any unverified claims clearly.

## MATLAB Model Review Report

For substantial reviews, produce a concise `MATLAB Model Review Report` with:

- What the code appears to do.
- What appears correct.
- Critical findings.
- Major findings.
- Minor findings.
- Why each issue matters economically or numerically.
- Suggested fixes or checks.
- What remains unverified.

Findings should be severity-ranked. For each finding, include evidence from files, code, logs, outputs, execution results, or the absence of necessary evidence.

## Review Scope

Review the parts of the MATLAB model workflow relevant to the request:

- Model-code architecture and run order.
- Economic correctness.
- Numerical correctness.
- Downstream consistency.
- Distribution, simulation, and moment logic.
- Calibration, estimation, and optimization logic.
- Nonstandard numerical structures.
- Performance and memory.
- Readability and researcher traceability.
- Specialized toolchains and generated code.
- Outputs, logs, verification evidence, and reproducibility.

## Economic Correctness

Check whether the code appears to implement the stated model:

- State, control, shock, price, value, policy, distribution, and moment objects.
- Timing.
- Constraints and feasibility logic.
- Laws of motion.
- Boundary conditions.
- Equilibrium or fixed-point objects.
- Moment definitions.
- Consistency between theory/model notes and code where both are present.
- Whether downstream objects are updated when upstream model logic changes.

Do not make unsupported claims about model economics when the relevant files, notes, or outputs were not inspected.

## Numerical Correctness

Review:

- Convergence criteria and tolerances.
- Indexing and grid alignment.
- Interpolation logic.
- Feasibility masks.
- Boundary treatment.
- Probability mass conservation where relevant.
- Transition probabilities or weights.
- Simulation logic, burn-in, seeds, initialization, and sample size.
- Objective-function stability.
- Correct use of solver outputs.
- Whether distribution updates and simulated states respect support, bounds, and boundary conditions.

Flag routines where an apparently minor numerical change may change the economic object.

## Distribution, Simulation, And Moments

Distinguish the computational structure before judging it:

- Explicit finite-state transition matrices.
- Simulation-based evolution.
- Interpolation-based mass movement.
- Continuous-state distribution updates.
- Specialized density evolution or custom mapping rules.

Check whether aggregation is performed on the intended object and whether simulation moments and stationary-distribution moments are compared appropriately. If the model uses nonstandard distributional or transition logic, state why a generic template may not apply.

## Calibration, Estimation, And Optimization

Review:

- Parameter vector definitions.
- Bounds, transformations, and mappings between optimizer variables and economic parameters.
- Moments, targets, and data/model comparability.
- Weighting matrices, scaling, and normalization.
- Simulation noise and seed control.
- Optimizer settings, tolerances, initial values, constraints, and stopping criteria.
- Failure regions where the model breaks.
- Logs of objective evaluations and convergence diagnostics.
- Whether the objective is smooth, noisy, constrained, nonsmooth, or simulation-based.

Flag moment scale imbalance, objective domination by a few moments, transformations that obscure interpretation, inconsistent data/model moments, unstable or non-reproducible objective values, and silent optimizer failures.

## Performance And Memory Review

Review performance without optimizing blindly:

- Whether vectorization improves speed without creating memory pressure or hiding model logic.
- Whether loops are appropriate given dimensions and clarity.
- Preallocation.
- Caching repeated calculations.
- Sparse structures where appropriate.
- Repeated expensive object construction inside loops.
- Likely bottlenecks, such as interpolation, expectation calculations, simulation, optimizer evaluations, repeated model solves, or distribution updates.
- Whether profiling or timing evidence supports performance claims.

Performance findings should explain whether the suggested change preserves economic meaning and numerical validity.

## Readability Review

Assess whether the MATLAB code communicates the model:

- Clear function responsibilities.
- Informative comments.
- Meaningful variable names where feasible.
- Explanation of major arrays and returned objects.
- Dimensions or shapes of important arrays where that prevents confusion.
- Comments clarifying states, controls, shocks, prices, values, policies, distributions, simulation outputs, and target moments.
- Structure that lets a researcher trace the model logic.

Do not require trivial comments that narrate obvious MATLAB syntax.

## Specialized Toolchains And Generated Code

If the project uses generated code or specialized external toolchains, identify that before recommending edits.

Examples may include generated solver files, derivative code, compiled extensions, or model-specification systems such as Dynare, but the rule is general:

- Identify which file is authoritative.
- Distinguish hand-written source code from generated artifacts.
- Avoid recommending edits to generated files when the source specification is the proper place to change behavior.
- State uncertainty when the toolchain relationship is not clear.

## Boundaries

Do not use this skill to:

- Implement or revise MATLAB model code by default; use `matlab-model-implementation`.
- Edit code by default.
- Answer generic MATLAB syntax questions with no quantitative-modeling content.
- Review Stata empirical data-analysis tasks.
- Make unsupported claims about model economics or numerical correctness without inspecting relevant files or results.
- Treat absence of execution evidence as proof of correctness.

## Optional Agents

Use available agents only when they are available and when the user explicitly requests full workflow support or the review is substantial enough to benefit from them:

- Use `critical_reviewer` to challenge findings, economic or numerical reasoning, severity, and missing evidence.
- Use `verifier` to check file state, logs, output freshness, command evidence, and completion claims.

Do not imply that agents are silently guaranteed to run.
