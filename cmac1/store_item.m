% store_item.m
% Add a training point to the dataset and train the CMAC
%
% This function takes the current point coordinates (from pcoords),
% adds it to the training set, displays it as a yellow marker on the
% input plot, and immediately trains the CMAC on this point.

% Switch to the input panel and add visual marker for this training point
subplot(ax_in)
h = plot(pcoords(1),pcoords(2),'yo');  % Yellow circle marker
set(h,'ButtonDownFcn','clickhandler')  % Make marker clickable

% Update the vertical line in the input panel to show the new point
if isgraphics(xline_in)
    delete(xline_in)
end
xline_in = xline(last_point, ":r", 'LineWidth', 2);

% Add this point to the training dataset
training_points(end+1,:) = pcoords;

% Update the training point counter display
xlabel(sprintf('N = %d training points',size(training_points,1)))

% Train the CMAC on this new point
train_point

% Update the vertical line in the other panels
subplot(ax_hist)
if isgraphics(xline_hist)
    delete(xline_hist)
end
xline_hist = xline(last_point, "r", 'LineWidth', 2);

subplot(ax_out)
if isgraphics(xline_out)
    delete(xline_out)
end
xline_out = xline(last_point, ":r", "LineWidth", 2);
