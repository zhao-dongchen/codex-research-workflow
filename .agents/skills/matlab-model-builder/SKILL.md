---
name: matlab-model-builder
description: "Build or revise coherent MATLAB quantitative model code with proportionate validation."
---

# MATLAB Model Builder

Use this skill for building or revising a MATLAB quantitative model codebase. The goal is coherent
whole-model construction, not a collection of disconnected component workflows.

Components are internal organization units. Do not create separate permanent workflows for every component.
Use this skill to keep model objects, run order, outputs, tests, and interpretation consistent as a whole.

## Core Workflow

For substantial work:

1. Orient to the model goal, existing files, project state, and relevant model notes.
2. Identify or create the model folder structure.
3. Build coherent code organized into meaningful components.
4. Identify high-risk or result-critical components.
5. Decide proportionate validation intensity for each important component.
6. During construction, run cheap probes, smoke checks, and targeted checks where they are likely to catch
   meaningful errors.
7. Defer broader validation to `verifier`, `matlab_reviewer`, or full workflow mode when that is more efficient.
8. Record commands, logs, outputs, known limitations, and any important checks that were skipped or deferred.
9. Hand off to reviewer subagents if full workflow mode is requested.
10. Apply the score protocol or template only after evidence, review, and verification when substantial.

Read `references/high-risk-component-tests.md` for detailed probe/test examples. Read
`references/vectorization-memory-standards.md` when performance, memory, vectorization, sparse matrices,
or profiling are material.

## Proportionate Validation

Do not require a full formal component contract or large test suite for every small helper. Use judgment
based on complexity, novelty, downstream importance, and failure risk. Long-project complexity does not
justify skipping validation, but validation should be prioritized.

Classify important components:

- Light-check: simple helpers, formatting/output helpers, wrappers with little economic or numerical content.
  Use basic dimension, path, and smoke checks.
- Moderate-risk: reusable transformations, standard grids/shocks, standard simulation helpers, and simple
  moment wrappers. Use small examples, dimension checks, boundary checks, and sanity checks.
- High-risk/result-critical: policy interpolation, off-grid mapping, transition matrices, distribution
  updates, VFI/Bellman/fixed-point solvers, price kernels, simulation engines, moment/objective functions,
  calibration/estimation routines, renegotiation/enforcement/payment schedules, and objects that directly
  affect headline results. Use targeted validation, numerical probes, and recorded evidence, but keep the
  evidence proportionate to the task.

If you skip or defer a plausible check, briefly record why. Do not claim correctness solely from static inspection.

Construction-time checks include tiny-grid probes, dimension checks, boundary checks, smoke runs,
mass/probability checks for transition or distribution objects, and cheap convergence or residual checks.

Review/verification-time checks include broader reruns, output freshness verification, log/hash/manifest
checks, independent numerical-logic review, and deeper tests if reviewers identify risk.

## Probes Are Allowed

Codex may quickly probe components before finalizing code. Use small, cheap probes to test dimensions,
boundaries, stochastic conventions, mass conservation, policy bounds, residuals, moment direction, timing,
or memory risk when those checks are likely to change the implementation decision.

Do not create large test suites unless the user requests them or the component has high result risk.

If a probe informs an implementation decision, summarize or save the evidence. If a probe reveals a bug or
ambiguity, fix it or record the unresolved issue before continuing.

## Whole-Model Discipline

- Keep the model coherent as a whole.
- Avoid over-modularization that creates coordination errors.
- Document dimensions for major arrays.
- Do not silently change timing, constraints, equilibrium conditions, moments, or interpretation.
- If code cannot run, clearly separate static checks from execution-verified evidence.
- Prefer vectorization, preallocation, sparse matrices, cached repeated calculations, and profiling/timing when useful.
- Avoid vectorization that creates avoidable memory pressure or hides model logic.

## Review And Verification

Use `matlab_reviewer` for independent MATLAB code, numerical, performance, and model-consistency review.
Use `critical_reviewer` when a separate adversarial economic-logic or research-claim review is useful.
Use `verifier` for execution, output freshness, and reproducibility evidence when available.

Review does not replace execution evidence. A score must cite actual files, commands, logs, outputs,
verification, and review evidence.
