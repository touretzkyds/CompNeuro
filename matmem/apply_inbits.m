%  apply_inbits(c_in)

function apply_inbits(c_in)

  global NUNITS Weights in_bits out_bits rbox thresh_textobj nbits_textobj

  thresh = sum(c_in);
  s_res = c_in * Weights;
  c_res = s_res >= max(1,thresh);
  t_res = decode(c_res);

  set(rbox,'String',t_res)

  colors = 'bmy';
  rescolors = colors(c_res + sign(s_res) + 1);
  for i=1:NUNITS
    set(in_bits(i),'UserData',c_in(i),'Color',colors(1+2*c_in(i)))
    set(out_bits(i),'UserData',c_res(i),'Color',rescolors(i))
  end

  set(thresh_textobj,'String',sprintf('Threshold = %d',thresh))
  nbits = sum(sum(Weights));
  set(nbits_textobj,'String', ...
      sprintf('Bits in memory = %d / %d  (%d%% full)', ...
	      nbits, NUNITS^2, floor(nbits./NUNITS^2*100)))
