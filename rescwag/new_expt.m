% new_expt.m

Weights(:) = 0;
Weight_history(:) = NaN;
Weight_history(1,:) = 0;
epoch = 1;
marked_epochs_x = [];
marked_epochs_y = [];

disp_weights
