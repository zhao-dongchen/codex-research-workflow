% Toy MATLAB transition-matrix smoke test for the workflow scaffold.
% All artifacts are written under quality_reports/session_logs/matlab_workflow_test.

clear; clc;

outdir = fileparts(mfilename('fullpath'));
repo_root = fullfile(outdir, '..', '..', '..');
start_dir = pwd;
cd(repo_root);
repo_root = pwd;
cd(start_dir);
if ~exist(outdir, 'dir')
    mkdir(outdir);
end

diary_file = fullfile(outdir, 'matlab_output.log');
if exist(diary_file, 'file')
    delete(diary_file);
end
diary(diary_file);
cleanup_diary = onCleanup(@() diary('off'));

fprintf('toy_transition_matrix_test_started\n');
fprintf('run_datetime_utc=%s\n', utc_stamp());
fprintf('script_directory=%s\n', outdir);
fprintf('matlab_version=%s\n', version);

% Planner/builder component map:
% State: one-dimensional asset/capital grid a_grid.
% Policy: next-period asset/capital a_prime_policy, deliberately off-grid.
% Transition: row-stochastic T, where distribution_next = distribution_current * T.
% Distribution: row vector over grid points.
% Aggregate: dot product of distribution and grid.
a_grid = [0, 1, 2, 3, 4]';
a_prime_policy = [0, 0.5, 1.5, 3.2, 4]';
n_grid = numel(a_grid);

[T_dense, lower_idx, upper_idx, upper_weight] = build_transition_matrix(a_grid, a_prime_policy);
T_sparse = sparse(T_dense);

row_sum = sum(T_dense, 2);
initial_dist = [0.10, 0.20, 0.30, 0.25, 0.15];
next_dist_dense = initial_dist * T_dense;
next_dist_sparse = initial_dist * T_sparse;

agg_before = initial_dist * a_grid;
agg_after = next_dist_dense * a_grid;
expected_agg_after = initial_dist * a_prime_policy;

checks = struct();
checks.dimension_ok = isequal(size(T_dense), [n_grid, n_grid]);
checks.nonnegative_weights_ok = all(upper_weight >= -eps & upper_weight <= 1 + eps);
checks.nonnegative_probabilities_ok = all(T_dense(:) >= -eps);
checks.row_sum_ok = max(abs(row_sum - 1)) < 1e-12;
checks.exact_on_grid_low_ok = abs(T_dense(1, 1) - 1) < 1e-12;
checks.exact_on_grid_high_ok = abs(T_dense(5, 5) - 1) < 1e-12;
checks.off_grid_split_low_ok = abs(T_dense(2, 1) - 0.5) < 1e-12 && abs(T_dense(2, 2) - 0.5) < 1e-12;
checks.off_grid_split_mid_ok = abs(T_dense(3, 2) - 0.5) < 1e-12 && abs(T_dense(3, 3) - 0.5) < 1e-12;
checks.boundary_handling_ok = abs(T_dense(4, 4) - 0.8) < 1e-12 && abs(T_dense(4, 5) - 0.2) < 1e-12;
checks.mass_conservation_ok = abs(sum(next_dist_dense) - sum(initial_dist)) < 1e-12;
checks.sparse_dense_match_ok = max(abs(next_dist_sparse - next_dist_dense)) < 1e-12;
checks.aggregate_matches_policy_ok = abs(agg_after - expected_agg_after) < 1e-12;
checks.aggregate_plausible_ok = agg_after < agg_before;

check_names = fieldnames(checks);
all_checks_passed = true;
for i = 1:numel(check_names)
    passed = checks.(check_names{i});
    all_checks_passed = all_checks_passed && passed;
    fprintf('%s=%d\n', check_names{i}, passed);
end

fprintf('row_stochastic_convention=rows sum to one; distribution_next = distribution_current * T\n');
fprintf('max_row_sum_error=%.16g\n', max(abs(row_sum - 1)));
fprintf('mass_before=%.16g\n', sum(initial_dist));
fprintf('mass_after=%.16g\n', sum(next_dist_dense));
fprintf('aggregate_before=%.16g\n', agg_before);
fprintf('aggregate_after=%.16g\n', agg_after);
fprintf('expected_aggregate_after_from_policy=%.16g\n', expected_agg_after);
fprintf('dense_memory_bytes=%d\n', whos_bytes('T_dense'));
fprintf('sparse_memory_bytes=%d\n', whos_bytes('T_sparse'));
fprintf('performance_memory_note=For this tiny grid, dense and sparse both work; for large sparse transition operators, use sparse matrices and avoid accidental densification.\n');

transition_rows = table((1:n_grid)', a_grid, a_prime_policy, lower_idx, upper_idx, upper_weight, row_sum, ...
    'VariableNames', {'row', 'grid_value', 'policy_value', 'lower_idx', 'upper_idx', 'upper_weight', 'row_sum'});
writetable(transition_rows, fullfile(outdir, 'transition_check.csv'));

save(fullfile(outdir, 'transition_check.mat'), 'a_grid', 'a_prime_policy', 'T_dense', 'T_sparse', ...
    'initial_dist', 'next_dist_dense', 'agg_before', 'agg_after', 'checks');

manifest_file = fullfile(outdir, 'manifest.txt');
fid = fopen(manifest_file, 'w');
fprintf(fid, 'script=%s\n', fullfile(outdir, 'toy_transition_matrix_test.m'));
fprintf(fid, 'command=/Applications/MATLAB_R2025b.app/bin/matlab -batch "run(''%s'')" \n', fullfile(outdir, 'toy_transition_matrix_test.m'));
fprintf(fid, 'working_directory=%s\n', pwd);
fprintf(fid, 'repo_root=%s\n', repo_root);
fprintf(fid, 'run_datetime_utc=%s\n', utc_stamp());
fprintf(fid, 'matlab_version=%s\n', version);
fprintf(fid, 'row_stochastic_convention=rows sum to one; distribution_next = distribution_current * T\n');
fprintf(fid, 'output_csv=%s\n', fullfile(outdir, 'transition_check.csv'));
fprintf(fid, 'output_mat=%s\n', fullfile(outdir, 'transition_check.mat'));
fprintf(fid, 'log=%s\n', diary_file);
fprintf(fid, 'all_checks_passed=%d\n', all_checks_passed);
fprintf(fid, 'status=completed\n');
fclose(fid);

if ~all_checks_passed
    error('toy_transition_matrix_test:failedChecks', 'One or more transition matrix checks failed.');
end

fprintf('toy_transition_matrix_test_completed\n');

function [T, lower_idx, upper_idx, upper_weight] = build_transition_matrix(grid, policy)
    n = numel(grid);
    T = zeros(n, n);
    lower_idx = zeros(n, 1);
    upper_idx = zeros(n, 1);
    upper_weight = zeros(n, 1);

    for row = 1:n
        x = policy(row);
        if x <= grid(1)
            lo = 1;
            hi = 1;
            w_hi = 0;
        elseif x >= grid(end)
            lo = n;
            hi = n;
            w_hi = 0;
        else
            lo = find(grid <= x, 1, 'last');
            hi = find(grid >= x, 1, 'first');
            if lo == hi
                w_hi = 0;
            else
                w_hi = (x - grid(lo)) / (grid(hi) - grid(lo));
            end
        end

        lower_idx(row) = lo;
        upper_idx(row) = hi;
        upper_weight(row) = w_hi;
        T(row, lo) = T(row, lo) + (1 - w_hi);
        T(row, hi) = T(row, hi) + w_hi;
    end
end

function bytes = whos_bytes(var_name)
    info = evalin('caller', sprintf('whos(''%s'')', var_name));
    bytes = info.bytes;
end

function stamp = utc_stamp()
    stamp = string(datetime('now', 'TimeZone', 'UTC', 'Format', 'yyyy-MM-dd HH:mm:ss ''UTC'''));
end
