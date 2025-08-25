% sample_point.m
% Generate a random training point from the target function
%
% This function selects a random input value from the domain [0,359],
% looks up the corresponding target output value, and stores the
% input-output pair as a training point for the CMAC.

% Generate random input point in the range [0,359]
p = floor(rand(1)*360);
last_point = p;  % Remember this point for visualization

% Create coordinate pair [input, target_output]
pcoords = [p ycoords(1+p)];  % Note: ycoords is 1-indexed

% Add this point to the training set and train the CMAC
store_item
