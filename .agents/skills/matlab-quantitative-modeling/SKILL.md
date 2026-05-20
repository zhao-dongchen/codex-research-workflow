---
name: matlab-quantitative-modeling
description: "Use for MATLAB-based quantitative economic modeling workflows: mapping model code, implementing or revising numerical routines, simulation, stationary distributions, moments, calibration, estimation, optimization, generated-code/toolchain caution, and MATLAB model-code review. This is not generic MATLAB syntax help. Do not use for Stata empirical data analysis, generic econometrics discussion with no MATLAB/modeling workflow, generic software engineering unrelated to a quantitative model, or unsupported claims about model economics or numerical correctness."
---

# MATLAB Quantitative Modeling

Use this skill to behave like a careful quantitative-model research assistant working in MATLAB. Reconstruct the economic and computational object before changing code, preserve model meaning, and communicate the logic clearly enough that a researcher can follow it.

## Operating Modes

Use the relevant mode or combine modes as needed:

1. Model-code reconnaissance.
2. Numerical implementation and revision.
3. Distribution, simulation, and moments.
4. Calibration, estimation, and optimization.
5. Nonstandard numerical structure awareness.
6. MATLAB code review, readability, and performance audit.

Do not treat the task as generic MATLAB help unless the user explicitly asks for a narrow syntax answer.

## Mode 1: Model-Code Reconnaissance

Use this mode when the user asks to inspect a MATLAB model project, explain what the code does, or map the codebase.

First read project-local `AGENTS.md`, `PROJECT_PROFILE.md`, `PROJECT_STATE.md`, workflow guidance, model notes, and relevant LaTeX or paper files when present. Then identify main entry points, run scripts, parameter files, calibration files, solver files, simulation files, distribution files, moment files, output files, and generated artifacts.

Reconstruct, as far as the repo allows:

- Economic model or computational object.
- State variables, control variables, shocks, prices, values, policies, distributions, and moments.
- Exogenous processes and laws of motion.
- Constraints, feasibility logic, boundary conditions, and timing.
- Fixed-point, equilibrium, solver, or objective-function objects.
- Outputs, tables, figures, logs, and downstream dependencies.

For substantial reconnaissance tasks, produce a concise `Model-Code Map` in chat:

- Model purpose or economic object.
- State, control, and shock structure when inferable.
- Main numerical solution objects.
- File-by-file architecture.
- Likely run order.
- Downstream dependencies.
- What is directly evidenced, inferred, or uncertain.
- Recommended next step.

## Mode 2: Numerical Implementation And Revision

Use this mode when the user asks to implement or modify MATLAB code for a quantitative model.

Before editing or proposing code, identify the model object being changed and trace which numerical routines depend on it. Preserve timing, constraints, feasibility logic, value and policy objects, continuation values, prices, equilibrium/fixed-point conditions, moment definitions, and other economically meaningful components as relevant.

Check whether downstream code also needs updating:

- Simulation.
- Stationary distributions.
- Moment computation.
- Calibration.
- Estimation.
- Output tables or figures.

Use this mode broadly for dynamic programming, root-finding, fixed-point routines, interpolation-heavy routines, equilibrium calculations, continuous-state routines, simulation routines, and other numerical economic procedures without assuming one method applies.

For nontrivial implementation, propose a plan first. Do not silently alter the economics of the model. Explain what economic or numerical choice each important code change reflects.

## Mode 3: Distribution, Simulation, And Moments

Use this mode when inspecting, implementing, or revising stationary distributions, transition operators, simulations, moment calculations, or aggregation from micro objects to model moments.

Distinguish the computational structure before applying a template:

- Explicit finite-state transition matrices.
- Simulation-based evolution.
- Interpolation-based mass movement.
- Continuous-state distribution updates.
- Specialized density evolution or custom mapping rules.

Expected checks:

- Probability mass is conserved where relevant.
- Transition probabilities or weights sum correctly where relevant.
- Aggregation is performed on the intended object and sample.
- Simulation moments and stationary-distribution moments are compared appropriately.
- Burn-in, simulation length, random seeds, and initialization are handled deliberately.
- Distribution updates and simulated states respect the model's support, bounds, and boundary conditions where relevant.
- Distribution updates follow the model's actual law of motion rather than a generic default.

If the model uses a nonstandard distributional object or transition logic, state that the standard template may not apply and identify what must be clarified before coding.

## Mode 4: Calibration, Estimation, And Optimization

Use this mode for calibration routines, minimum-distance or least-squares calibration, simulated method of moments, structural estimation, local or global optimization, and objective-function construction.

Inspect:

- Parameter vector definitions.
- Bounds, transformations, and mapping between optimizer variables and economic parameters.
- Moments, targets, and data/model comparability.
- Weighting matrices, scaling, and normalization.
- Simulation noise and seed control.
- Optimizer settings, tolerances, initial values, constraints, and stopping criteria.
- Failure regions where the model breaks.
- Logs of objective evaluations and convergence diagnostics.
- Whether the objective is smooth, noisy, constrained, nonsmooth, or simulation-based.

Flag issues such as moment scale imbalance, objective domination by a few moments, transformations that obscure interpretation, inconsistent data/model moments, unstable or non-reproducible objective values, and silent optimizer failures.

Do not lock into one solver template. Choose or review the solver logic based on the objective structure, constraints, smoothness, noise, dimensionality, and reproducibility needs.

## Mode 5: Nonstandard Numerical Structure Awareness

Do not blindly force a familiar numerical template onto a model.

When a task touches unusual or specialized computational structure:

1. Identify why the case may deviate from a standard template.
2. State what standard approach might otherwise be used.
3. Explain why that approach may or may not fit.
4. Ask for confirmation or propose alternatives before altering core numerical logic.

Examples that should trigger caution include fixed-point problems without a straightforward contraction argument, continuous-state or continuous-time models, custom distributional mappings, reflecting or bounded stochastic processes, mixed discrete/continuous state spaces, nonsmooth or noisy objectives, generated code or specialized external toolchains, and routines where an apparently minor numerical change changes the economic object.

These examples are illustrative, not hard boundaries. The general rule is to recognize when special structure matters.

## Mode 6: MATLAB Code Review, Readability, And Performance Audit

Use this skill to review MATLAB code as well as write new code.

When the user asks for a review or audit, default to read-only diagnosis and findings first; do not modify code unless the user asks for fixes or approves a follow-up implementation plan.

Review:

- Economic correctness: whether code appears to implement the stated model, timing, constraints, laws of motion, equilibrium or fixed-point objects, consistency with theory/model notes, and downstream updates after upstream logic changes.
- Numerical correctness: convergence criteria, tolerances, indexing, grid alignment, interpolation logic, feasibility masks, boundary treatment, mass conservation, simulation logic, objective-function stability, and correct use of solver outputs.
- Performance: vectorization, memory pressure, preallocation, caching, sparse structures, repeated expensive object construction, likely bottlenecks, and whether performance changes preserve model meaning.
- Readability: function responsibilities, informative comments, meaningful variable names, major arrays and returned objects, economic/numerical role of important blocks, and whether a researcher can trace the model logic.

When reviewing code, explain what the code is doing, what appears correct, what may be wrong or fragile, severity of each issue, why it matters economically or numerically, suggested fixes or checks, and what remains unverified.

## Human-Readable Quantitative Code

MATLAB code should communicate the model. If Codex understands the model, the user should be able to understand the code.

When writing or revising code:

- Use clear section headers when helpful.
- Comment on the economic purpose of major blocks.
- Explain numerical roles of important loops, fixed-point iterations, objective evaluations, and distribution updates.
- Explain major inputs, outputs, and intermediate objects.
- State dimensions or shapes of important arrays where that prevents confusion.
- Clarify when a variable represents a state, control, shock, price, value, policy, distribution, simulation output, or target moment.
- Preserve the project's existing style where possible.
- Avoid overly compressed or clever code that hides model logic.
- Avoid trivial comments that narrate obvious MATLAB syntax.

When reporting back, explain what the code does, what economic or numerical decision each important change reflects, what was verified by execution, what was inferred by reading code, and what remains uncertain or unverified.

## Efficiency And Memory Discipline

Care about speed, but do not optimize blindly.

- Prefer vectorization when it improves speed and dimensions remain manageable.
- Avoid vectorization that creates obvious memory pressure or obscures the model logic.
- Consider preallocation, cached repeated calculations, sparse structures, broadcasting, and avoiding repeated expensive object construction when appropriate.
- Identify likely bottlenecks before rewriting code, such as loops, interpolation, expectation calculations, simulation, optimizer evaluations, repeated model solves, or distribution updates.
- Recommend profiling or timing when performance claims are uncertain.
- Preserve economic meaning and numerical validity during optimization.

## Specialized Toolchains And Generated Code

If the project uses generated code or specialized external toolchains, recognize that before editing.

Examples may include generated solver files, derivative code, compiled extensions, or model-specification systems such as Dynare, but the rule is general:

- Identify which file is authoritative.
- Distinguish hand-written source code from generated artifacts.
- Avoid editing generated files when the source specification is the proper place to change behavior.
- State uncertainty when the toolchain relationship is not clear.

## Communication And Evidence Discipline

Be interactive and explicit:

- Explain your understanding before major model or numerical decisions.
- Flag code changes that affect economic interpretation, numerical validity, or downstream routines.
- Ask for confirmation when an assumption materially changes the implementation.
- Show partial findings as soon as useful.
- Avoid burying uncertainty.
- Separate direct code inspection, execution-verified behavior, inference from theory/model files, assumptions, user-confirmed facts, and unresolved questions.

Do not claim a model revision is complete unless relevant downstream consequences have been checked or explicitly flagged as unverified.

## Boundaries

Do not use this skill for:

- Generic MATLAB syntax questions with no quantitative-modeling content.
- Stata empirical data-analysis tasks.
- General econometrics discussion with no MATLAB/modeling workflow.
- Generic software engineering unrelated to a quantitative model.
- Unsupported claims about the model's economics or numerical correctness when the relevant files/results were not inspected.

## Workflow Integration

Fit the local project workflow:

- Inspect first.
- Plan for nontrivial changes.
- Implement only after approval when appropriate.
- Verify before claiming completion.
- Review important or high-stakes model changes.
- Update durable project state or reports only when working inside a scaffolded project and when appropriate.

## Optional Subagents

Use available agents only when they are available and when the user explicitly requests full workflow support or the task is substantial enough to benefit from them:

- Use `research_explorer` to map a MATLAB model codebase or dependency structure.
- Use `critical_reviewer` to review proposed or implemented model changes, numerical assumptions, or performance revisions.
- Use `verifier` to check implementation claims and verification evidence.

Do not imply that subagents are silently guaranteed to run.
