---
name: matlab-model-builder
description: "Use when the user wants Codex to build, revise, assemble, or extend a MATLAB quantitative model codebase or model folder. This is the main whole-model producer skill: coherent model construction, adaptive high-risk component validation, probes, integration/sanity checks, speed and memory discipline, and evidence handoff."
---

# MATLAB Model Builder

Use this skill for building or revising a MATLAB quantitative model codebase. The goal is coherent whole-model construction, not a collection of disconnected component workflows.

Components are internal organization units. Do not create separate permanent workflows for every component. Use this skill to keep model objects, run order, outputs, tests, and interpretation consistent as a whole.

## Core Workflow

For substantial work:

1. Orient to the model goal, existing files, project state, and relevant model notes.
2. Identify or create the model folder structure.
3. Build coherent code organized into meaningful components.
4. Identify high-risk or result-critical components.
5. Decide adaptive validation intensity for each important component.
6. Quickly probe or play with components when useful.
7. Add targeted tests for high-risk or nonstandard components.
8. Run small-scale smoke tests when possible.
9. Run baseline integration and sanity checks when possible.
10. Record commands, logs, outputs, and known limitations.
11. Hand off to reviewer subagents if full workflow mode is requested.
12. Apply the score protocol or template only after evidence, review, and verification when substantial.

Read `references/high-risk-component-tests.md` for detailed probe/test examples. Read `references/vectorization-memory-standards.md` when performance, memory, vectorization, sparse matrices, or profiling are material.

## Adaptive Validation

Do not require a full formal component contract for every small helper. Do require explicit reasoning about which components are high risk or result-critical.

Classify important components:

- Light-check: simple helpers, formatting/output helpers, wrappers with little economic or numerical content. Use basic dimension, path, and smoke checks.
- Moderate-risk: reusable transformations, standard grids/shocks, standard simulation helpers, simple moment wrappers. Use small examples, dimension checks, boundary checks, and sanity checks.
- High-risk/result-critical: policy interpolation, off-grid mapping, transition matrices, distribution updates, VFI/Bellman/fixed-point solvers, price kernels, simulation engines, moment/objective functions, calibration/estimation routines, renegotiation/enforcement/payment schedules, and objects that directly affect headline results. Use targeted validation, numerical probes, and recorded evidence.

Justify why each important component receives light, moderate, or high validation intensity. Long-project complexity does not justify skipping validation. Large projects need prioritized validation, staged tests, logs, and sanity checks.

## Probes Are Allowed

Codex may quickly probe components before finalizing code. Useful probes include tiny-grid tests, boundary cases, parameter perturbations, sparse/dense comparisons, loop/vectorized comparisons, mass-conservation checks, stochastic-matrix convention checks, policy-bound checks, convergence/residual checks, moment-direction checks, timings, and memory-footprint checks.

If a probe informs an implementation decision, summarize or save the evidence. If a probe reveals a bug or ambiguity, fix it or record the unresolved issue before continuing.

## Whole-Model Discipline

- Keep the model coherent as a whole.
- Avoid over-modularization that creates coordination errors.
- Document dimensions for major arrays.
- Do not silently change timing, constraints, equilibrium conditions, moments, or interpretation.
- If code cannot run, clearly separate static checks from execution-verified evidence.
- Prefer vectorization, preallocation, sparse matrices, cached repeated calculations, and profiling/timing when useful.
- Avoid vectorization that creates avoidable memory pressure or hides model logic.

## Review And Verification

Use `matlab_reviewer` for independent MATLAB code, numerical, performance, and model-consistency review. Use `critical_reviewer` when a separate adversarial economic-logic or research-claim review is useful. Use `verifier` for execution, output freshness, and reproducibility evidence when available.

Review does not replace execution evidence. A score must cite actual files, commands, logs, outputs, verification, and review evidence.
