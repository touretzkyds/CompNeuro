% train_point.m
% Train the CMAC on a single data point using supervised learning
%
% This function implements the CMAC learning rule. It computes the current
% output for the input point, calculates the error, and updates the weights
% in all active memory locations if the error exceeds the tolerance threshold.
% The training point coordinates are taken from the global variable pcoords.

% Get the memory locations activated by this input point
bins = bins_assigned{1+pcoords(1)};

% Compute current CMAC output by summing weights in active bins
r = sum(cmac_memory(bins));

% Calculate prediction error
diff = pcoords(2) - r;

% Update weights only if error exceeds tolerance threshold
if abs(diff) > Tolerance
  % Distribute error correction equally among all active bins
  cmac_memory(bins) = cmac_memory(bins) + g_val * diff / length(bins);
end

% Increment training counter
Npresented = Npresented + 1;
