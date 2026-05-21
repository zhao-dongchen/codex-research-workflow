# Resource-Aware Validation And Review Policy

## Task

Refine active scaffold instructions so MATLAB construction uses proportionate validation and subagent review uses cost-aware scope and escalation.

## Changes

- Added `.codex/agents/references/subagent-resource-policy.md`.
- Updated MATLAB builder guidance to prefer cheap construction-time probes and targeted checks, while deferring broader validation to verifier/reviewer/full workflow mode when appropriate.
- Updated `matlab_reviewer`, `stata_reviewer`, `verifier`, and `critical_reviewer` to consult the resource policy when deciding scope or escalation.
- Added review-depth guidance to MATLAB and Stata review protocols.
- Updated the MATLAB score template to reward proportionate validation and explicit deferred checks while preserving caps for missing high-risk validation.
- Concision pass: kept detailed policy/rubric content in references, kept README and PROJECT_STATE concise, and preserved active skill front matter.

## Model/Reasoning Settings

No custom agent model or reasoning settings were changed. The current agent TOMLs do not set expensive model or reasoning overrides.

## Validation

Validation commands were run after edits; see final handoff for details.

## Residual Risk

The policy is instruction-level. It still needs observation in a larger real Stata or MATLAB task to calibrate whether agents choose review depth appropriately.
