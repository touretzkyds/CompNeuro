function edit_value(obj)

  global Params

  str = get(obj,'String');
  v = str2num(str);

  if isempty(v), v=0; end

  set(obj,'String',num2str(v))

  pname = get(obj,'UserData');

  eval(['Params.' pname ' = ' num2str(v) ';']);

  do_eval

