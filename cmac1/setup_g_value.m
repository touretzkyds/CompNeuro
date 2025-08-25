% setup_g_value.m
% GUI callback to update the learning rate parameter
%
% This function is called when the user modifies the learning rate
% text box. It validates the input and updates the global learning
% rate variable, then resets the simulation to apply the change.

% Get the handle of the control that triggered this callback
h = gcbo;
new_val = str2num(get(h,'String'));  % Convert text to number

% Validate the learning rate input
if isempty(new_val) || length(new_val) > 1 || new_val < 1e-3 || new_val > 9
    % Invalid input: revert to previous value
    set(h, 'String', num2str(g_val));
    return;
else
    % Valid input: update learning rate
    g_val = new_val;
end

% Reset simulation to apply the new learning rate
reset_cmac
