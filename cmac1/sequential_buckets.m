% sequential_buckets.m
% Create sequential bucket-to-memory mapping for CMAC
%
% This function implements the sequential memory assignment strategy where
% buckets are mapped to memory locations in a deterministic, evenly-spaced
% pattern. This approach avoids hash collisions and ensures uniform memory
% utilization, making it easier to analyze CMAC behavior.

% Pre-allocate cell array for memory assignments
bins_assigned = cell(360,1);

% Calculate memory stride to distribute buckets evenly across memory space
% Ensure minimum stride of 1 to prevent multiple buckets mapping to same location
memory_stride = max(1, floor(Memsize / (Nhashes * Nbuckets_per_hash)));

% For each possible input value (0-359 degrees)
for z = 0:359
  % Find which buckets are activated by this input value
  c = find( (z>=bmin & z<=bmax) | (z>=bmin-360 & z<=bmax-360) );

  % Map bucket indices to evenly distributed memory locations
  memory_locations = mod((c-1) * memory_stride, Memsize) + 1;
  bins_assigned{z+1} = memory_locations;  % Note: MATLAB uses 1-based indexing
end