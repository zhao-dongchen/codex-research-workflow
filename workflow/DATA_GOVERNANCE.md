# Data Governance

Use this protocol before working with data, logs, credentials, sensitive materials, or durable project reports.

## Do Not Commit

Do not commit or record in durable project artifacts:

- Credentials, tokens, keys, passwords, or authentication files.
- Restricted, proprietary, licensed, embargoed, or human-subject raw data unless the project explicitly permits it.
- Personally identifiable information or sensitive sample values.
- Sensitive storage locations or machine-specific absolute paths that should not be shared.
- Unredacted logs that expose secrets, restricted data, private paths, or sensitive output.
- Large generated artifacts unless the project explicitly tracks them.

## Referencing Restricted Data

When data cannot be committed, reference it by durable, non-sensitive metadata:

- Dataset name or abstract identifier.
- Version, vintage, release date, extract date, or provider reference.
- Access class, such as public, licensed, restricted, confidential, or local-only.
- Local-only storage convention without exposing sensitive machine-specific absolute paths.
- Hashes or checksums when feasible and allowed.

If exact provenance cannot be recorded safely, state what was intentionally omitted and why.

## Logs And Reports

Before saving logs, session reports, checkpoints, reviews, or project state:

- Redact credentials, tokens, keys, and private URLs.
- Remove sensitive sample values and personally identifiable information.
- Replace sensitive storage locations with safe labels or project-relative conventions.
- Summarize restricted data rather than copying restricted records or excerpts.
- Mark any evidence that has been redacted.

## Project State

`PROJECT_STATE.md` should contain durable coordination facts, not secrets or sensitive research material. Prefer safe references to detailed sensitive content.

Use `quality_reports/` for evidence that can safely be checked in. If evidence cannot be committed, record a safe summary and the location convention for the local-only evidence.

## Default Rule

When unsure whether data, logs, paths, or outputs are safe to commit, do not commit them. Record a redacted summary and ask for project-specific guidance.
