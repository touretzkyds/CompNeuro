% RANDG2(N) returns a matrix of N column vectors drawn from a 2D gaussian
%           distribution with mean 0 and variance 1.

function z = randg2(n)

  r = randn(1,n);
  phi = rand(1,n)*2*pi;

  x = r .* cos(phi);
  y = r .* sin(phi);

  z = [x;y];


