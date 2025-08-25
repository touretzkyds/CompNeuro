% resbutton.m

setptr(gcf,'arrow')

if DELETE_BUTTON_FLAG == 1
  obj = get(gcbo,'UserData');
  set_button_state(obj,0)
  setup_button(obj,blanktext,blanktext)
  update_weights
  update_resboxes
  DELETE_BUTTON_FLAG = 0;
  return
end


obj = gcbo;
button = get(obj,'UserData');
dat = get(button,'UserData');

t_in = dat{1};
t_out = dat{2};

if strcmp(t_in,blanktext) == 1
  return
end

set_ibox(dat{1})
set(obox,'String',upper(dat{2}))

