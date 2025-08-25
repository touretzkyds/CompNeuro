% Attractor bump model.  Follows the equations in: 
%   Goodridge, J.P. and Touretzky, D. S. (1999) Modeling
%   attractor deformation in the rodent head direction system.
%  Mouse on one of the flanks of the bump to make the attractor move.

% David S. Touretzky, Carnegie Mellon University.
% April, 1999.

global NEUNITS W

NEUNITS = 101;  % should be an odd number for symmetry
NEUNITS2 = floor(NEUNITS/2);

W =  rot(exp(-((-NEUNITS2):NEUNITS2).^2/NEUNITS2)',NEUNITS2);
wEE = 0.377 * allrot(W,-1);
wEI = -8;
wIE = 0.5;
wII = -4;

gammaE = -1.5;
gammaI = -7.5;
tauE = 0.001;
tauI = 0.0002;
deltaT = 0.0001;
t = 0;

SE = 3 * rot(wEE(:,1),NEUNITS2);
SI = 0.2;
Bias = 0;
Noise = 0;

External = 0 * SE;
DecayRate = 0.99;

coords = (0:(NEUNITS-1))' / NEUNITS * 2*pi - pi;
sincoords = sin(coords);
coscoords = cos(coords);

disp('Click on the bump to supply external input.')

setup_display

run_flag = Inf;
bump_mainloop
