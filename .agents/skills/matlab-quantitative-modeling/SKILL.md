---
name: matlab-quantitative-modeling
description: "Compatibility pointer for MATLAB quantitative modeling prompts. Route design/planning to matlab-model-planner; whole-model construction, revision, adaptive high-risk component testing, probes, and integration/sanity checks to matlab-model-builder; independent MATLAB review to matlab_reviewer; verification to verifier; scoring to the MATLAB score protocol/template when substantial."
---

# MATLAB Quantitative Modeling

This broad skill name is retained for compatibility with older prompts.

Use `matlab-model-planner` for model design, diagnosis, model-object mapping, implementation planning, nonstandard numerical challenge mapping, high-risk component identification, and open-decision lists.

Use `matlab-model-builder` for whole-model construction or revision, adaptive validation of high-risk/result-critical components, quick probes, targeted tests, integration and sanity checks, speed and memory discipline, and evidence handoff.

Use `matlab_reviewer` for independent read-only MATLAB code, numerical, performance, reproducibility, and model-consistency review.

Use `critical_reviewer` for broader adversarial economic-model or research-claim review when a separate perspective is useful. No separate `quant_model_reviewer` is required in this scaffold because economic model logic is explicitly covered by `matlab_reviewer` and broader claim review is covered by `critical_reviewer`.

Use `verifier` for execution, output freshness, command, log, and reproducibility evidence when available.

Use `templates/matlab-quality-score-report.md` and the relevant score protocol when substantial scoring is requested or full workflow mode applies.

Do not treat this compatibility pointer as an automatic router. Select the active skill or subagent that matches the user's actual task.
