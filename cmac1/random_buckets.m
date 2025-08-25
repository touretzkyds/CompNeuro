% random_buckets.m
% Create random bucket-to-memory mapping for CMAC
%
% This function implements the random memory assignment strategy where
% each bucket is mapped to a randomly selected memory location. This
% approach helps distribute memory usage and reduces systematic biases
% but may lead to hash collisions where multiple buckets map to the
% same memory location.

bins_assigned = {};  % Cell array to store memory locations for each input

% For each possible input value (0-359 degrees)
for z = 0:359
  % Find which buckets are activated by this input value
  % Handle wrap-around at 360 degrees boundary
  c = find( (z>=bmin & z<=bmax) | (z>=bmin-360 & z<=bmax-360) );

  % Assign the randomly selected memory locations for these buckets
  bins_assigned{z+1} = buckets(c);  % Note: MATLAB uses 1-based indexing
end
