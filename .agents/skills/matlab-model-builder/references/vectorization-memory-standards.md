# Vectorization And Memory Standards

Use this reference when MATLAB model work touches speed, memory, vectorization, sparse matrices, profiling, or large arrays.

## Prefer Vectorization When

- It removes expensive interpreter loops without obscuring model logic.
- Array dimensions are modest and memory growth is controlled.
- The vectorized expression matches the economic object clearly.
- It reduces repeated computation inside simulation, expectation, interpolation, or objective-evaluation loops.

## Do Not Vectorize Blindly

Avoid vectorization when it:

- creates large temporary arrays or tensor products that stress memory
- hides timing, state, or distribution logic
- makes boundary cases harder to audit
- prevents sparse representation
- worsens clarity for little speed gain

## Preallocation And Caching

- Preallocate arrays whose final dimensions are known.
- Cache repeated grids, transition objects, interpolation indices, weights, shocks, and invariant pieces of objectives.
- Avoid repeated construction of expensive objects inside loops unless parameters change.
- Document dimensions of major arrays near creation or function headers.

## Sparse Matrices

- Use sparse matrices for large transition operators or selection matrices when density is low.
- Verify sparse and dense implementations match on small examples when changing representation.
- State row/column convention and multiplication direction.
- Watch for accidental densification.

## Timing And Profiling

- Use `tic`/`toc`, `timeit`, MATLAB profiler, or comparable logs when making performance claims.
- Record problem size with timing evidence.
- Separate cold-start, setup, solve, simulation, and output-writing time when useful.
- Report memory-sensitive design choices when large arrays are unavoidable.

## Handoff

Do not claim a performance improvement without timing or profiling evidence. If performance cannot be measured, label it as a static expectation or hypothesis.
