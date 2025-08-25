%  v = encode(string)

function v = encode(string)
  global alphabet codebook

  v = [];

  for c = string
    pos = findstr(c,alphabet);
    if pos > 0
      v = [v, codebook(pos,:)];
    else
      v = -1;
      return
    end
  end
