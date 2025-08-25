function cmap = bwr(n)
%BWR Blue-white-red colormap.
%   cmap = bwr(N) returns an N-by-3 matrix containing a blue-white-red colormap.
%   This is useful for displaying diverging data. If N is not specified, 
%   the size of the current colormap is used.
%
%   This function is a simple implementation for older MATLAB versions
%   that do not include 'bwr' as a built-in colormap.

if nargin < 1
    n = size(get(gcf, 'colormap'), 1);
end

% Define the anchor colors
blue = [0, 0, 1];
white = [1, 1, 1];
red = [1, 0, 0];

% Calculate the number of points for each of the two gradients
m = floor(n/2);

% Create the first half of the colormap (blue to white)
b_half = [linspace(blue(1), white(1), m)', ...
          linspace(blue(2), white(2), m)', ...
          linspace(blue(3), white(3), m)'];
          
% Create the second half of the colormap (white to red)
r_half = [linspace(white(1), red(1), m)', ...
          linspace(white(2), red(2), m)', ...
          linspace(white(3), red(3), m)'];
          
% Check if n is odd or even
if mod(n, 2) == 1
    % n is odd, so we can have a perfect white middle point
    cmap = [b_half; white; r_half];
else
    % n is even, so we just concatenate the two halves
    cmap = [b_half; r_half];
end

end