% toggle.m

setptr(gcf,'arrow')

obj = gcbo;

if DELETE_BUTTON_FLAG == 1
  set_button_state(obj,0)
  setup_button(obj,blanktext,blanktext)
  update_weights
  update_resboxes
  DELETE_BUTTON_FLAG = 0;
  return
end

val = get(obj,'Value');
tdat = get(obj,'UserData');
in_text = tdat{1};
out_text = tdat{2};
ibox_text = lower(get(ibox,'String'));
obox_text = lower(get(obox,'String'));

% see if some button already has the string in ibox
matching_button = 0;
for b = buttons
  bdat = get(b,'UserData');
  if strcmp(bdat{1},ibox_text) == 1
    matching_button = b;
  end
end

% pressing an empty button ?
if strcmp(tdat{1},blanktext) == 1
  % look for invalid cases: no text to copy, or another button has this item
  if length(ibox_text) == 0 | ...
     length(obox_text) == 0 | ...
     strcmp(ibox_text,blanktext) == 1 | ...
     matching_button ~= 0
    set(obj,'Value',0) % turn this button back off
    return
  else
    % empty button can be set up from ibox/obox
    in_text = ibox_text;
    out_text = obox_text;
  end
else
  % pressing a non-empty button
  if obj == matching_button
    % item's in_text matches ibox, so we may be changing the out_text
    out_text = lower(get(obox,'String'));
  end
end

setup_button(obj,in_text,out_text)
set_button_state(obj,val)

update_weights

set_ibox(in_text)
set(obox,'String',upper(out_text))

update_resboxes
