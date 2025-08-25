% plot_buckets.m
% Update bucket activation visualization
%
% This function updates the bucket tiling display at the bottom of the GUI.
% It shows which buckets are activated by the most recently selected input
% point by highlighting them in yellow while keeping inactive buckets gray.

% Reset all bucket visualizations to inactive color
inactive_color = [0.4 0.4 0.4];  % Gray color for inactive buckets
for i = 1:length(g_h_hist_bars)
    if ~isempty(g_h_hist_bars{i})
        set(g_h_hist_bars{i}, 'FaceColor', inactive_color);
    end
end

% Highlight buckets activated by the last selected point
if ~isempty(last_point)
    % Find which buckets contain the last selected input point
    z = last_point;
    c = find( (z>=bmin & z<=bmax) | (z>=bmin-360 & z<=bmax-360) );

    % Highlight active buckets in yellow
    active_color = 'y';  % Yellow color for active buckets
    for i = 1:length(c)
        idx = c(i);
        if ~isempty(g_h_hist_bars{idx})
            set(g_h_hist_bars{idx}, 'FaceColor', active_color);
        end
    end
end

% Force immediate graphics update
drawnow;

