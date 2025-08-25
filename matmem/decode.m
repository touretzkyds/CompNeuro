%  y = decode(x)

function y = decode(x)

  global KBITS TLEN decodebook

  m = reshape(x,KBITS,TLEN);
  v = sum(m .* ((2.^(0:KBITS-1))'*ones(1,TLEN)));

  y = decodebook(1+v);
