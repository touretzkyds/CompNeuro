% dense_sparse.m

DELETE_BUTTON_FLAG = 0;

if DENSITY == 'd'
  DENSITY = 's';
  set(density_button,'String','Sparse')
else
  DENSITY = 'd';
  set(density_button,'String','Dense')
end

make_codebook
memory_graphics

for b = buttons
  dat = get(b,'UserData');
  dat{4} = encode(dat{1});
  dat{5} = encode(dat{2});
  set(b,'UserData',dat);
  if get(b,'Value') == 1
    set_button_state(b,1)  % re-store the memory item
  end
end

update_weights
update_resboxes
set_ibox
