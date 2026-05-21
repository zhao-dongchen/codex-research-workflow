---
name: matlab-model-implementation
description: "Legacy compatibility pointer for older prompts. For MATLAB quantitative model implementation, revision, whole-model construction, proportionate high-risk component checks, probes, and integration/sanity checks, use matlab-model-builder. For design or implementation planning, use matlab-model-planner."
---

# MATLAB Model Implementation

This legacy skill name is retained for compatibility with older prompts.

Use `matlab-model-planner` when the task is to design, diagnose, map, or plan a quantitative MATLAB model before implementation.

Use `matlab-model-builder` when the task is to build, revise, assemble, or extend MATLAB quantitative model code, including coherent whole-model construction, proportionate validation of high-risk components, numerical probes, integration checks, speed/memory discipline, and evidence handoff.

Use `matlab_reviewer` for independent read-only MATLAB code, numerical, performance, reproducibility, and model-consistency review. Use `critical_reviewer` for broader adversarial review of research logic or claims when useful. Use `verifier` for execution, output freshness, and reproducibility evidence when available.

Do not treat this compatibility pointer as an automatic router. Select the active skill or subagent that matches the user's actual task.
