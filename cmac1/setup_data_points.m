% setup_data_points.m
% GUI callback to change the target function
%
% This function is called when the user selects a different function
% from the dropdown menu. It generates the new target function values
% and updates both the input and output plots, then resets the simulation.

% Get the selected function from the dropdown menu
func_mode = get(function_menu,'Value');

% Convert input coordinates from degrees to radians
xvals = xcoords * pi / 180;

% Generate target function values based on selection
switch func_mode
  case 1
    ycoords = sin(xvals);                    % Simple sine wave
  case 2
    ycoords = sin(3*xvals);                  % Higher frequency sine wave
  case 3
    ycoords = sin(8*xvals);                  % Even higher frequency sine wave
  case 4
    ycoords = 0.75*sign(sin(3*xvals-pi/4));  % Step function (discontinuous)
  case 5
    % Random piecewise-linear function with smooth interpolation
    n_smooth = 20;  % Number of interpolation steps between random points
    c = [0];        % Start at zero
    a = 2*rand(1,ceil(length(xcoords)/n_smooth)) - 1;  % Random target values [-1,1]

    % Interpolate between random points for smoothness
    for i=1:length(a)
      b = [];
      for j = (1/n_smooth):(1/n_smooth):1
        b(end+1) = (1-j)*c(end) + j*a(i);  % Linear interpolation
      end
      c = [c b];
    end
    ycoords = c(1:length(xcoords));  % Trim to exact length needed
end

% Update both input and output plots with the new target function
set(h_in,'YData',ycoords)      % Update interactive input plot
set(h_desired,'YData',ycoords) % Update target function in output plot

% Reset simulation to start fresh with the new target function
reset_cmac
