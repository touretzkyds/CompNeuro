function set_button(b,t_in,t_out)

  global alphabet codebook blanktext Weights

  c_in = encode(t_in);
  c_out = encode(t_out);
  set(b,'UserData',{t_in,t_out,blanktext,c_in,c_out})

  if ~all(c_in == 0)
    set(b,'String',sprintf('%s --> %s',upper(t_in),upper(t_out)))
  else
    set(b,'String','   ---')
  end
