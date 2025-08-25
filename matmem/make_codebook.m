% make_codebook.m

global KBITS NUNITS Weights alphabet blanktext codebook decodebook

alphabet = 'abcdefghijklmnopqrstuvwxyz47';
ncodes = length(alphabet);

if DENSITY == 'd'
  % Dense code: standard binary encoding
  KBITS = 5;
  codebook = zeros(ncodes,KBITS);
  for i = 1:ncodes
    codebook(i,:) = bitget(i,1:5);
  end
else
  % Sparse code:  we will use choose(KBITS,2) patterns for the letters.
  KBITS = 8;
  y = ones(KBITS,1)*(1:KBITS);
  c1 = y(:);
  c2 = y';
  c2 = c2(:);
  combs = [c1 c2];
  combs = combs(c2>c1,:);
  codebook = zeros(ncodes,KBITS);
  for i = 1:ncodes
    codebook(i,combs(i,:)) = 1;
  end
end

NUNITS = TLEN * KBITS;
Weights = zeros(NUNITS,NUNITS);

% make first item be a blank code (all zeros)

codebook = [zeros(1,KBITS); codebook];
alphabet = ['*' alphabet];

blanktext = alphabet(ones(TLEN,1));
blankcode = encode(blanktext);

decodebook = blanks(2^KBITS);
decodebook(:) = '?';
v = 1 + sum(codebook' .* ((2.^(0:KBITS-1))'*ones(1,length(codebook))));
decodebook(v) = alphabet;

