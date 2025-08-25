% run.m
% Main entry point for 1-dimensional CMAC simulation
%
% This script implements a Cerebellar Model Articulation Controller (CMAC)
% for learning and approximating 1-dimensional functions. The CMAC uses
% multiple overlapping hash tables to create a distributed memory system
% that can learn continuous functions through local generalization.
%
% Copyright (c) 1997, 2005 by David S. Touretzky.
% Carnegie Mellon University

% CMAC Architecture Overview:
% - Input space: circular variable with values 0-359 degrees
% - Hash tables: 32 separate encodings with overlapping coverage
% - Buckets per hash: 11 regions, each covering ~32.7 degrees
% - Hash stride: 2 degrees offset between consecutive hash tables
% - Memory: 4096 total locations, using at most 352 (11*32)
% - Actual usage may be lower due to hash collisions

% Initialize global variables for GUI interaction

last_point = [];  % Tracks the most recently selected input point

% CMAC Memory Configuration
Memsize = 4096;              % Total memory locations available
Nhashes = 32;                % Number of overlapping hash tables
Nbuckets_per_hash = 11;      % Number of buckets per hash table
hash_stride = 2;             % Degree offset between hash table starting positions

% Learning Parameters
g_val = 1;                   % Learning rate (adjustable via GUI)
Tolerance = 0.01;            % Minimum error threshold for weight updates

% Function Definition
xcoords = 0:359;             % Input domain: 0 to 359 degrees
ycoords = sin(xcoords*pi/180); % Default target function: sine wave

% Bucket Assignment Mode
bucket_mode = 1;             % 1 = random memory assignment, 2 = sequential assignment

% Function Mode
func_mode = 1;               % 1 = sine wave, 2 = higher frequency sine, 3 = even higher frequency sine, 4 = step function, 5 = random piecewise-linear function

% Initialize CMAC memory array
cmac_memory = zeros(Memsize,1);

% Initialize vertical line for ax_in and ax_hist and ax_out
xline_in = [];
xline_hist = [];
xline_out = [];

% Configure bucket boundaries and memory assignments
setup_buckets
