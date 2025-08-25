% clear_memory.m

DELETE_BUTTON_FLAG = 0;

for b = buttons
  set_button_state(b,0)
  setup_button(b,blanktext,blanktext)
end

Weights(:) = 0;
update_weights

set_ibox('');
set(ibox,'String','')
set(obox,'String','')

update_resboxes
