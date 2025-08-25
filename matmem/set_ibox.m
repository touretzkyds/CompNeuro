%  set_ibox(str)

function set_ibox(str)

  global NUNITS ibox obox rbox blanktext in_bits out_bits Weights
  global  thresh_textobj nbits_textobj

  if nargin == 0
    str = validate_text(ibox);
  end
  set(ibox,'String',upper(str))
  if length(str)==0
    str = blanktext;
  end

  apply_inbits(encode(str))
