# Project Constitution

This repository is a Codex-native academic research workflow scaffold. It is meant to be copied into
research projects that need careful planning, reproducible execution, independent verification, review,
scoring, and evidence-based handoff.

The scaffold is suitable for academic research projects, including economics projects with empirical code
and quantitative models. It deliberately avoids hard-coding Stata, MATLAB, R, LaTeX, Quarto, journal, or
data-source conventions unless a copied project adds them explicitly.

## Operating Principles

- Treat nontrivial tasks as plan-first work.
- Do not claim completion without evidence.
- Prefer explicit assumptions over implicit guesses.
- Preserve reproducibility: record commands, inputs, outputs, and verification evidence when they matter.
- Keep research reasoning auditable: distinguish facts, assumptions, interpretations, and unresolved questions.
- Minimize unrelated changes.
- Do not silently alter empirical specifications, sample definitions, variables, weights, fixed effects,
  clustering, model timing, constraints, calibration targets, or moment definitions.

## Default Workflow

For nontrivial work, use:

```text
PLAN -> IMPLEMENT -> VERIFY -> REVIEW -> FIX -> RE-VERIFY -> SCORE -> SUMMARIZE
```

Do not claim verification, review, or scoring unless that step was actually performed. Distinguish direct
execution evidence from inference based on file inspection.

## Skills, Subagents, And References

Skills under `.agents/skills/` are task-specific reusable workflow packages. They should contain the
procedure, local references, scripts, or assets needed for the task they handle.

Custom agents under `.codex/agents/` are independent actors for exploration, verification, review, and
similar roles. Reviewers and verifiers should be subagents, not skills. Do not claim that a skill or subagent
was used unless it actually was used.

Stata implementation uses `stata-data-analysis`. Independent Stata review uses
`.codex/agents/stata_reviewer.toml`, and `stata_reviewer` applies
`.codex/agents/references/stata-review-protocol.md`. If the main agent applies that protocol itself,
label the review non-independent.

The `workflow/` folder, if present, contains shared protocol/reference documents. It is not an automatic
Codex rule mechanism. Skills, subagents, nested AGENTS files, or user prompts may direct Codex to read
specific workflow files when relevant.

## Durable State

Save durable reports when substantial work changes project state or research status. Use `quality_reports/`
for plans, specs, session logs, reviews, scores, checkpoints, onboarding reports, and similar evidence.

`PROJECT_STATE.md` is the checked-in handoff file for current status, active decisions, risks, and next
actions. Update it before handoff when substantial work materially changes the repository or research state.
