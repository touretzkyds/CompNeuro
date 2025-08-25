function init_params

  global buttons

  set_bparam(buttons.alpha,0.1)
  set_bparam(buttons.beta,0.1)
  set_bparam(buttons.gamma,0.1)
  set_bparam(buttons.delta,0.05)

  set_bparam(buttons.lmax,5)
  set_bparam(buttons.lmin,0.14)

  set_bparam(buttons.w0,0.5)



function set_bparam(button,val)

  global Params

  str = num2str(val);
  set(button,'String',str);

  pname = get(button,'Userdata');
  eval(['Params.' pname ' = ' str ';'])

