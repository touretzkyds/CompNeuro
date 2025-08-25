% Attractor Bump Model with Two Maps
%
% Copyright (c) 1999 by David S. Touretzky, and
% (c) 2000 by David S. Touretzky and Marios Savvides.
%
% This model follows the equations in: 
%   Goodridge, J.P. and Touretzky, D. S. (2000) Modeling
%   attractor deformation in the rodent head direction system.
%   Journal of Neurophysiology, 83(6):3402-3410.
%
% Original version written April, 1999.
% Modified June 2000 by David Touretzky and Marios Savvides to
% overlay two attractor maps and allow external input to make the
% bump jump from one map to the other.
%
% Mouse on one of the flanks of the bump to make the attractor move.

NEUNITS = 201;  % should be an odd number for symmetry
NEUNITS2 = floor(NEUNITS/2);

W =  rot(exp(-((-NEUNITS2):NEUNITS2).^2/NEUNITS2)',NEUNITS2);
W(W < 0.01) = 0;
wEE1 =  allrot(W,-1);

p2 = randperm(NEUNITS);
pmat2 = allrot(p2,-1);
for i=1:NEUNITS
   inv2(pmat2(i,:)) = 1:NEUNITS;
   wEE2(pmat2(i,1),:) = W(inv2)';
end

wEE = 0.377 * max(wEE1,wEE2);
wEI = -8;
wIE = 0.5;
wII = -4;

gammaE = -1.5;
gammaI = -7.5;
%tauE = 0.001;
%tauI = 0.0002;
tauE = 0.01;
tauI = 0.002;
deltaT = 0.0001;
t = 0;

SE = 0.9 * rot(W(:,1),NEUNITS2);
SI = 0.3;

Bias = 0;
Noise = 0;
External = 0 * SE;
DecayRate = 0.99;

coords = (0:(NEUNITS-1))' / NEUNITS * 2*pi - pi;
sincoords = sin(coords);
coscoords = cos(coords);

disp('Click in either plot to supply external input.')

setup_display

run_flag = Inf;

mainloop
