function r = rot(vec,k)

% r = ROT(vec,k)   Rotate vec left by k elements.
%       	   vec may be either a column or row vector
  
  [nrows,ncols] = size(vec);

  if (nrows > 1) & (ncols > 1)
    error('Input must be a row or column vector')
  end

  n = length(vec);
  k = rem(k,n);

  if k>=0
    first = k+1:n;
    second = 1:k;
  else % k is negative
    k = -k;
    first = (n-k+1):n;
    second = 1:(n-k);
  end
 
  if (nrows > 1)
     r = [vec(first); vec(second)];
  else
     r = [vec(first) vec(second)];
  end
