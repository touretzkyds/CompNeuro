% Simulation of TD (Temporal Difference) learning in the Schultz task.
%
% David S. Touretzky.  
% October, 1998

buffer_length = 8;
num_stimuli = 3;

buffer = zeros(buffer_length,num_stimuli);
reward = zeros(buffer_length,1);
history = zeros(buffer_length,4);  % [V, oldV, R, delta]

W = buffer;
V = 0;
Gamma = 0.9;
eta = 0.25;

% set up stimulus and reward patterns

stimpat = buffer;
stimpat(1,1) = 1;
% stimpat(4,2) = 1;
reward(7) = 1;

epoch = 0;
pat = Inf;

setup_display

if ~exist('pause_every_step','var'), pause_every_step = 0; end

if pause_every_step
  disp('Hit the space bar to advance each timestep.')
  disp('Set pause_every_step=0 to run automatically.')
else
  disp('Set pause_every_step=1 to manually step through the simulation.')
end

if ~exist('Ntrials','var'), Ntrials=40; end

for i=1:(Ntrials*buffer_length)
  main_loop
end
