% Construct a 2D attractor using the Wilson-Cowan equations
% with one inhibitory unit.

if ~exist('N','var'), N = 35; end
Nunits = N*N;

%%% Attractor parameters
density = 0.2; % estimated density of recurrent connections
wEE = spalloc(Nunits,Nunits,ceil(Nunits^2*density));
wEEarea = 8.0;  % area under a bump: desired sum of one row of wEE
wEI = -6;
wIE = 60/Nunits;
wII = -1;
gammaE = -1.5;
gammaI = -7.5;
tauE = 0.01;
tauI = 0.001;
deltaT = 0.001;
decayrate = 0.97;

%%% Unit coordinates
unitno = reshape(1:Nunits,N,N);	% matrix of unit numbers
unitx = repmat((1:N)',1,N);	% x coordinates of units
unity = unitx';			% y coordinates of units
unitx = unitx(:);
unity = unity(:);

%%% Pre-allocate work variables; we will re-use the space on each iteration.
xdiff = zeros(Nunits,1);
ydiff = xdiff;
posn = xdiff > xdiff; % logical array
unitdistsq = xdiff;
W = zeros(1,Nunits);

fprintf('Building weights for %dx%d grid (%d units)...\n',N,N,Nunits)

for u = 1:Nunits
  if rem(u,100) == 0, fprintf('%d..\n',u), end
  %% Calculate the Euclidean distance between unit u and the rest, 
  %% using an NxN toroidal topology.
  xdiff(:) = abs(unitx(u) - unitx);
  posn(:) = xdiff >= ceil(N/2);
  xdiff(posn) = N - xdiff(posn);
  ydiff(:) = abs(unity(u) - unity);
  posn(:) = ydiff >= ceil(N/2);
  ydiff(posn) = N - ydiff(posn);
  unitdistsq(:) = (xdiff.^2 + ydiff.^2) / (2*floor(N/2)^2);
  W(:) = exp(-unitdistsq/0.05);
  W(W<0.2) = 0;
  wEE(u,:) = W;
end

fprintf('norm...\n');
wEE = wEE * (wEEarea /  sum(wEE(1,:)));

built = true;

