---
name: empirical-analysis-planner
description: "Plan empirical analyses from a research question, project context, and available data evidence."
---

# Empirical Analysis Planner

Use this skill to plan empirical strategy: what to analyze, why it is feasible, which data and variables
matter, and what outputs should come first.

Do not use it as the main workflow for cleaning data, writing code, running regressions, reviewing do-files,
or verifying outputs.

## Deliverables

Depending on scope, produce:

- research-question to data mapping
- variable, sample, and unit plan
- descriptive evidence plan
- baseline specification ladder
- tables and figures plan
- robustness and sensitivity plan
- interpretation caveats
- feasibility risks and implementation sequence

For detailed planning standards, read `references/empirical-plan-standards.md` when the task is substantial
or ambiguous.

## Workflow

1. Restate the research question or empirical goal.
2. Inspect available project context, data-preparation evidence, codebooks, prior outputs, paper drafts, and
   relevant notes.
3. Distinguish direct evidence from inference, assumptions, and unresolved data needs.
4. Map research concepts to observable variables or proxies.
5. Identify the unit of observation, time frequency, target population, and defensible baseline sample.
6. Propose descriptive evidence before complex regressions.
7. Build a staged baseline specification ladder.
8. Propose output order, robustness checks, and interpretation limits.
9. Recommend the implementation sequence and prerequisite data checks.

## Boundaries And Routing

- Use `stata-data-prep-exploration` when raw data structure, cleaning, missingness, or merges are not yet understood.
- Use `stata-data-analysis` to implement empirical analysis in Stata.
- Use `stata_reviewer` for independent Stata review when authorized and available; it applies
  `.codex/agents/references/stata-review-protocol.md`.
- Use `verifier` for independent checks of files, logs, output existence, and freshness when available.
- Use `critical_reviewer` when an independent argument or claim review is useful.

If the main agent applies a review checklist itself, label that review non-independent. Review does not
replace verification or scoring.

## Final Response Standard

End with the recommended empirical path, what should be done first, what should wait, unresolved data
questions, and the main interpretation risks.
