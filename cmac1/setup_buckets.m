% setup_buckets.m
% Configure CMAC bucket boundaries and memory assignments
%
% This function sets up the overlapping hash tables that form the core
% of the CMAC architecture. Each hash table divides the input space into
% buckets, and multiple hash tables are offset to provide overlapping
% coverage for generalization.

% Calculate bucket size (degrees per bucket)
bucketsize = floor(360/Nbuckets_per_hash);

% Create base bucket boundaries for the first hash table
base_bmin = bucketsize * (0:Nbuckets_per_hash-1);  % Starting positions
offsets = hash_stride * (0:Nhashes-1)';            % Offset for each hash table

% Generate bucket boundaries for all hash tables
% Each hash table is offset by hash_stride degrees from the previous one
bmin = repmat(base_bmin, Nhashes, 1) + repmat(offsets, 1, Nbuckets_per_hash);
bmax = bmin + bucketsize - 1;

% Assign random memory locations to each bucket
% This creates the hash function mapping from buckets to memory addresses
buckets = [];
for i = 1:Nhashes
  cands = randperm(Memsize);                       % Random permutation of memory addresses
  buckets(i,:) = cands(1:Nbuckets_per_hash);      % Take first N addresses for this hash
end

% Reshape arrays into column vectors for easier indexing
bmin = bmin(:);
bmax = bmax(:);
buckets = buckets(:);

% Create the final bucket-to-memory mapping based on selected mode
if bucket_mode == 1
  random_buckets      % Use random memory assignment
else
  sequential_buckets  % Use sequential memory assignment
end

% Reset the simulation state
reset_cmac
