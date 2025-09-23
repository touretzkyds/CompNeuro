% set_button_state(b,v)

function set_button_state(b,v)

  global NUNITS buttons Weights

  set(b,'Value',v)

  if v == 0
    set(b,'BackgroundColor',[0.8 0.8 0.8])
  else
    set(b,'BackgroundColor',[1 0.8 0.8])
  end

  dat = get(b,'UserData');
  c_in = encode(dat{1});
  c_out = encode(dat{2});
  wdelta = c_in'*c_out;
  if v == 1
    Weights = Weights | wdelta;
  else
    remW = zeros(NUNITS,NUNITS);
    for b = buttons
      if get(b,'Value') == 1
      	rdat = get(b,'UserData');
      	c_in = rdat{4};
      	c_out = rdat{5};
      	remW = remW | (c_in'*c_out);
      end
    end
    Weights = (Weights & ~wdelta) | remW;
  end
