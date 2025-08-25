% set_all_buttons(v)

function set_all_buttons(v)

  global buttons blanktext DELETE_BUTTON_FLAG

  DELETE_BUTTON_FLAG = 0;

  for b = buttons
    sdat = get(b,'UserData');
    if (v == 0) |  ~strcmp(sdat{1},blanktext)
      set_button_state(b,v)
    end
  end

update_weights

update_resboxes

set_ibox
