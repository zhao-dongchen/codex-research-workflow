---
name: matlab-model-implementation
description: "Use for implementing or revising MATLAB quantitative economic model code: map model architecture, modify numerical routines, update downstream simulation, distributions, moments, calibration, estimation, tables, or figures, and verify model-code changes. This is the producer/modifier skill for MATLAB quantitative modeling, not generic MATLAB syntax help or read-only audit. For review-only tasks, use review-matlab-model."
---

# MATLAB Model Implementation

Use this skill as the MATLAB quantitative-model producer/modifier workflow. The user-facing job is to implement or revise MATLAB quantitative economic model code while preserving model meaning and downstream consistency.

Use this skill for requests such as:

- Implement this model change in MATLAB.
- Revise a solver, value-function iteration, fixed-point routine, simulation, distribution update, moment routine, calibration, or estimation objective.
- Update downstream routines after a change to model timing, constraints, parameters, moments, or numerical objects.
- Improve speed or memory use while preserving economic and numerical validity.
- Explain and modify a MATLAB quantitative model project.

For read-only review or audit of MATLAB model code, numerical assumptions, performance, memory, outputs, or reproducibility, use `review-matlab-model` instead.

## Expected Deliverables

Deliverables should match the task. For substantial work, produce:

- `Model-Code Map`.
- Change-impact analysis.
- Implementation plan.
- Modified files after approval.
- Verification summary.
- Unresolved risks.

Before finalizing substantial model changes, call or recommend a `review-matlab-model` pass so economic logic, numerical correctness, downstream consistency, performance, memory, and readability receive read-only review.

## Producer Workflow

1. Read local instructions, project state, workflow guidance, model notes, LaTeX or paper files, and relevant MATLAB files when present.
2. Identify the model object being changed and the code paths that implement it.
3. Produce a `Model-Code Map` for substantial tasks.
4. Trace downstream dependencies before editing: simulation, stationary distributions, moments, calibration, estimation, tables, figures, logs, and generated artifacts.
5. Identify whether the task touches nonstandard numerical structure before applying a familiar template.
6. Propose an implementation plan before nontrivial edits.
7. Implement after approval when the change is nontrivial or affects durable project artifacts.
8. Verify by running available tests, scripts, smoke checks, static checks, or targeted comparisons when possible.
9. Summarize what changed, what was verified by execution, what was inferred by reading code, and what remains unresolved.

## Model-Code Map

For substantial reconnaissance or implementation tasks, produce a concise `Model-Code Map`:

- Model purpose or economic object.
- State, control, shock, price, value, policy, distribution, and moment objects when inferable.
- Exogenous processes, constraints, feasibility logic, boundary conditions, and timing.
- Main numerical solution, fixed-point, equilibrium, simulation, objective, or calibration objects.
- File-by-file architecture.
- Likely run order.
- Downstream dependencies.
- What is directly evidenced, inferred, or uncertain.
- Recommended next step.

## Change-Impact Analysis

Before modifying MATLAB model code, identify:

- Which economic object or computational object is changing.
- Which routines consume or produce that object.
- Whether downstream code must change, including simulation, distributions, moments, calibration, estimation, tables, figures, and logs.
- Whether changes alter timing, constraints, feasibility, continuation values, prices, equilibrium/fixed-point conditions, or moment definitions.
- Whether output interpretation changes.
- Which checks are needed before the change can be considered complete.

Do not silently alter the economics of the model. Explain what economic or numerical choice each important code change reflects.

## Numerical Implementation Standards

Use the model's actual structure rather than forcing one default template. This skill covers dynamic programming, root-finding, fixed-point routines, interpolation-heavy routines, equilibrium calculations, continuous-state routines, simulation routines, calibration, estimation, and other numerical economic procedures.

Preserve relevant model meaning:

- Timing.
- Constraints and feasibility logic.
- Laws of motion.
- Value and policy objects.
- Continuation values.
- Prices and equilibrium objects.
- Distributional objects.
- Moment definitions.
- Objective-function interpretation.

## Distribution, Simulation, And Moments

When implementing or revising stationary distributions, transition operators, simulations, moment calculations, or aggregation, distinguish the computational structure:

- Explicit finite-state transition matrices.
- Simulation-based evolution.
- Interpolation-based mass movement.
- Continuous-state distribution updates.
- Specialized density evolution or custom mapping rules.

Check:

- Probability mass is conserved where relevant.
- Transition probabilities or weights sum correctly where relevant.
- Aggregation is performed on the intended object and sample.
- Simulation moments and stationary-distribution moments are compared appropriately.
- Burn-in, simulation length, random seeds, and initialization are handled deliberately.
- Distribution updates and simulated states respect the model's support, bounds, and boundary conditions where relevant.
- Distribution updates follow the model's actual law of motion rather than a generic default.

If the model uses nonstandard distributional or transition logic, state that a standard template may not apply and clarify the required logic before coding.

## Calibration, Estimation, And Optimization

When working on calibration, minimum-distance routines, simulated method of moments, structural estimation, local or global optimization, or objective-function construction, inspect:

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

## Nonstandard Numerical Structure

Do not blindly force a familiar numerical template onto a model.

When a task touches unusual or specialized computational structure:

1. Identify why the case may deviate from a standard template.
2. State what standard approach might otherwise be used.
3. Explain why that approach may or may not fit.
4. Ask for confirmation or propose alternatives before altering core numerical logic.

Examples that should trigger caution include fixed-point problems without a straightforward contraction argument, continuous-state or continuous-time models, custom distributional mappings, reflecting or bounded stochastic processes, mixed discrete/continuous state spaces, nonsmooth or noisy objectives, generated code or specialized external toolchains, and routines where an apparently minor numerical change changes the economic object.

These examples are illustrative, not hard boundaries. The general rule is to recognize when special structure matters.

## Human-Readable Quantitative Code

MATLAB code should communicate the model. Preserve the project's existing style when possible.

When writing or revising code:

- Use clear section headers when helpful.
- Comment on the economic purpose of major blocks.
- Explain numerical roles of important loops, fixed-point iterations, objective evaluations, and distribution updates.
- Explain major inputs, outputs, and intermediate objects.
- State dimensions or shapes of important arrays where that prevents confusion.
- Clarify when a variable represents a state, control, shock, price, value, policy, distribution, simulation output, or target moment.
- Avoid overly compressed or clever code that hides model logic.
- Avoid trivial comments that narrate obvious MATLAB syntax.

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

- Read-only audit or review of MATLAB quantitative model code; use `review-matlab-model`.
- Generic MATLAB syntax questions with no quantitative-modeling content.
- Stata empirical data-analysis tasks.
- General econometrics discussion with no MATLAB/modeling workflow.
- Generic software engineering unrelated to a quantitative model.
- Unsupported claims about the model's economics or numerical correctness when relevant files/results were not inspected.

## Workflow Integration

Fit the local project workflow:

- Inspect first.
- Plan for nontrivial changes.
- Implement only after approval when appropriate.
- Verify before claiming completion.
- Use or recommend `review-matlab-model` before finalizing substantial model changes.
- Update durable project state or reports only when working inside a scaffolded project and when appropriate.

## Optional Agents

Use available agents only when they are available and when the user explicitly requests full workflow support or the task is substantial enough to benefit from them:

- Use `research_explorer` to map a MATLAB model codebase or dependency structure.
- Use `critical_reviewer` to review proposed or implemented model changes, numerical assumptions, or performance revisions.
- Use `verifier` to check implementation claims and verification evidence.

Do not imply that agents are silently guaranteed to run.
