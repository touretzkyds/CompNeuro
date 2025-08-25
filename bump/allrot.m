function y = allrot(x,dir)

  if size(x,2)==1, x = x';  end
  if (nargin < 2), dir=1; end

  n = length(x);
  y = zeros(n,n);

  for i = 1:n
    y(i,:) = rot(x,dir*(i-1));
  end
