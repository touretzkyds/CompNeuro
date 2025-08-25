global Weights Weight_history Coeffs epoch axwt axhist cr_button evboxes

Weights = zeros(1,4);   % background weight, and CS1, CS2, CS3
Weight_history = NaN*zeros(1000,4);
InitCoeffs = [1 1 1 1 0.1];  % alphas for bkg, CS1, CS2, CS3, and learning rate beta
Coeffs = InitCoeffs;

setup_display

reset_rw
