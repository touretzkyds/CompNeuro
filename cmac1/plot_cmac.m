% plot_cmac.m
% Update all CMAC visualization plots
%
% This function refreshes the memory visualization, output function plot,
% and bucket activation display. It also computes and displays performance
% metrics including maximum error and RMS error.

% Update memory visualization (64x64 grid representation of 4096 memory locations)
if bucket_mode == 1
  m = reshape(cmac_memory,64,64);  % Random mode: show memory as 2D grid
else
  m = reshape(cmac_memory,64,64);  % Sequential mode: same visualization
end
set(h_mem,'CData',m)  % Update the memory heatmap

% Compute CMAC output for all input values
youtput = zeros(1,360);  % Pre-allocate for performance
for i = 1:360
  % Sum weights in all memory locations activated by input i-1
  youtput(i) = sum(cmac_memory(bins_assigned{i}));
end

% Update the output function plot
subplot(ax_out)
set(h_out,'YData',youtput)  % Update learned function curve

% Calculate and display performance metrics
RMS = sqrt(mean((youtput-ycoords).^2));           % Root mean square error
max_error = max(abs(youtput-ycoords));            % Maximum absolute error
title(sprintf('Points = %d:  MaxErr = %4.3f, RMS = %4.3f', ...
              Npresented, max_error, RMS))

% Update bucket activation visualization
plot_buckets
