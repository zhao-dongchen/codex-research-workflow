---
name: matlab-model-planner
description: "Use when the user wants to design, plan, diagnose, or reason through a quantitative MATLAB model before implementation: map model objects, timing, equilibrium logic, numerical challenges, high-risk components, adaptive tests/probes, implementation order, and open decisions. Do not implement unless asked."
---

# MATLAB Model Planner

Use this skill when the user asks Codex to think through a quantitative MATLAB model before implementation. This is a planning skill, not the main producer for code edits.

## What To Produce

For substantial tasks, produce a model design or implementation plan covering:

- model purpose and target outputs
- states, controls, shocks, prices, constraints, distributions, moments, and objectives
- timing, laws of motion, equilibrium or fixed-point logic, and interpretation
- nonstandard settings and numerical challenges
- component map and intended run order
- high-risk or result-critical components
- required adaptive tests, probes, and smoke checks
- implementation sequence
- speed and memory risks
- open questions or user decisions needed

Use `references/model-design-plan-template.md` when a structured plan would help.

## Planning Rules

- Do not force a standard VFI, simulation, or distribution template onto a nonstandard model.
- Highlight unusual features: off-grid policies, interpolation weights, transition operators, distribution updates, renegotiation or enforcement, fixed points, constraints, policy functions, moments, calibration, estimation objectives, and SMM.
- Identify what must be tested or probed, but do not implement unless asked.
- Separate direct evidence from files, inference, assumptions, and unresolved questions.
- For long or complex projects, preserve depth. Do not shrink the design analysis merely because the project is large.

## Handoff

Route implementation to `matlab-model-builder`. Route independent MATLAB code, numerical, performance, and model-consistency review to `matlab_reviewer`. Use `verifier` for execution, output freshness, and reproducibility evidence when available.
