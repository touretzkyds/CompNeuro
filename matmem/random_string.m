function y = random_string

  global TLEN alphabet

  % First character is the char for the zero string, so skip it.
  y = alphabet(2+floor(rand(TLEN,1)*(length(alphabet)-1)));
