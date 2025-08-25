% 1-Dimensionala CMAC simulation.

% Copyright (c) 1997, 2005 by David S. Touretzky.
% Carnegie Mellon University

% We're encoding a circular variable whose values are integers in
% [1,360].  We divide the circle into 11 regions (hash buckets).
% We'll construct 32 separate encodings; the starting position of each
% encoding will be offset by 2 from the previous encoding.

% This scheme uses at most 11*32 = 352 memory locations out of 4096.
% The actual number used may be lower, due to collisions.

Memsize = 4096;
Nhashes = 32;
Nbuckets_per_hash = 11;
bucketsize = floor(360/Nbuckets_per_hash);
Tolerance = 0.01;

a = Nhashes*(0:Nbuckets_per_hash-1);
s = 2*(0:Nhashes-1)';

bmin = repmat(a,Nhashes,1) + repmat(s,1,Nbuckets_per_hash);
bmax = bmin + bucketsize - 1;

% For each hash, grab a set of bins at random from the pool.
buckets = [];
for i = 1:Nhashes
  cands = randperm(Memsize);
  buckets(i,:) = cands(1:Nbuckets_per_hash);
end

bmin = bmin(:);
bmax = bmax(:);
buckets = buckets(:);

bucket_mode = 1;  % 1 for randomly drawn buckets; 2 for systematically ordered
random_buckets

cmac_memory = zeros(Memsize,1);

setup_graphics
reset_cmac
