# Stata Data Prep Standards

This reference preserves the detailed data-orientation checklist for `stata-data-prep-exploration`. Use it when data access, units, missingness, cleaning, sample construction, or merges may affect analysis.

## Data Access

Classify the access situation:

- data inside the current repo or workspace
- data stored locally outside the repo
- remote, licensed, proprietary, restricted, or confidential data
- data referenced in code but not currently accessible
- user-uploaded sample, extract, or excerpt only

Inspect Stata scripts, globals, locals, path files, configs, README files, logs, codebooks, and documentation to infer intended data locations. If data are inaccessible, read code and documentation, propose diagnostic commands, and clearly label unverified points.

## Documentation And Metadata

When meanings, units, coverage, or design are unclear, inspect available documentation before guessing:

- codebooks and data dictionaries
- README files and vendor documentation
- survey questionnaires
- PDF or web documentation
- paper appendices
- Stata labels and notes
- prior cleaning scripts and logs

Separate known facts, documentation-based inference, and questions requiring user confirmation.

## Data Orientation Report

For substantial tasks, cover:

1. dataset identity and source
2. data access status
3. likely observation unit
4. identifiers and time variables
5. cross-sectional, panel, repeated cross-section, event, transaction, or other structure
6. coverage over time and units
7. candidate key variables
8. labels, value labels, codebooks, and documentation status
9. units and scales
10. missingness and coverage concerns
11. duplicate or uniqueness issues
12. suspicious values or impossible ranges
13. merge possibilities or risks
14. recommended next step
15. unresolved questions

## Variable And Unit Diagnosis

For important variables, identify:

- raw variable name
- label or documented meaning
- source definition
- measurement unit and scale
- frequency
- whether it is a stock, flow, rate, share, count, category, or identifier
- whether monetary values are nominal or real
- whether values are levels, logs, percentages, or fractions
- whether values are raw, cleaned, imputed, constructed, or merged

Flag ambiguity before interpreting magnitudes, including percent-versus-fraction ambiguity, monetary scale ambiguity, zero-versus-missing ambiguity, and changing meanings across files or years.

## Missingness Diagnosis

Distinguish:

- variable absent from source
- variable present under another name
- sparse population
- structurally undefined values
- time-coverage missingness
- merge failure
- transformation-created missingness
- sample-restriction missingness
- Stata extended missing values
- true zero versus missing ambiguity

When data are available, diagnose missingness by year, unit type, group, source file, merge status, sample restriction step, or relevant economic category.

## Minimal Cleaning And Sample Construction

Separate:

- raw source universe
- mechanically usable observations
- minimal cleaned sample
- analysis-specific sample
- optional stricter restrictions

Mechanically necessary exclusions may include missing core identifiers, impossible dates, unresolved duplicate keys, observations outside the documented source universe, or variables fully unavailable for a requested diagnostic.

For each restriction, explain what it removes, why it is necessary or optional, how much data it removes when measurable, and whether it changes the target population or interpretation.

## Merge Diagnosis

Before merging, determine:

- what each dataset represents
- observation unit of each dataset
- intended post-merge observation unit
- candidate merge keys
- uniqueness requirements
- time alignment
- intended merge relationship
- whether `m:m` would create unintended Cartesian expansion

For substantial merge tasks, report intended relationship, keys, uniqueness checks, expected and observed match rates, match rates by time or group when relevant, systematic unmatched observations, possible reasons for match rates, remaining risks, and next checks.

## Exploratory Diagnostics

Useful diagnostics include:

- observation counts by year or group
- unique units over time
- missingness tables
- summary statistics
- percentiles and outlier checks
- distribution plots
- categorical cross-tabs
- coverage plots
- before/after cleaning counts
- merge status summaries
- support and impossible-value checks

Keep exploratory output focused on data quality and feasibility.

## Stata Code Standards

When writing cleaning or exploration code:

- use clear section headers
- define paths and macros transparently
- save cleaned outputs separately
- comment why each cleaning step exists
- explain sample restrictions and variable construction
- check uniqueness before merges
- inspect `_merge` or equivalent diagnostics
- use logs for substantive diagnostics
- avoid overly clever code that hides data logic

Comments should explain empirical and data-design logic, not obvious Stata syntax.
