% reset_cmac.m
% Reset the CMAC simulation to initial state
%
% This function reinitializes the GUI, clears all learned weights,
% removes training points, and resets counters. It's called when
% the user clicks the Reset button or changes CMAC parameters.

% Reinitialize the graphical user interface
setup_graphics

% Clear the last selected point
last_point = [];

% Reset CMAC memory to zero (forget all learning)
cmac_memory(:) = 0;

% Clear the training point history
training_points = zeros(0,2);

% Reset training counter
Npresented = 0;

% Clean up previous training point markers from the input plot
subplot(ax_in)
delete(findobj('Parent',ax_in,'Color','y'))  % Remove yellow training point markers
xlabel('')  % Clear the training point counter label

% Update all plots to reflect the reset state
plot_cmac
