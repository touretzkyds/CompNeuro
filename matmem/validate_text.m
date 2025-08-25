function str = validate_text(obj)

  global TLEN alphabet DELETE_BUTTON_FLAG

  DELETE_BUTTON_FLAG = 0;

  str = [lower(strtok(get(obj,'String'))) alphabet(ones(TLEN,1))];
  str = str(1:TLEN);

  for i = 1:TLEN
    if ~any(find(str(i) == alphabet))
      str(i) = alphabet(1);
    end
  end

  set(obj,'String',upper(str))

