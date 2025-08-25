function label_all_buttons
  global axbuttons buttons

  subplot(axbuttons)
  delete(buttons.textobjs)
  textobjs = [set_button(buttons.c1), ...
	      set_button(buttons.c2), ...
	      set_button(buttons.c3), ...
	      set_button(buttons.c4)];
  buttons.textobjs = textobjs;

  do_eval  

function h = set_button(obj)

  pos = get(obj,'Position');
  val = get(obj,'Value');
  dat = get(obj,'UserData');
  entry = dat{val};
  str = entry{1};

  h = text('Units','pixels', 'Position',[pos(1),pos(2)+pos(4)*1.4], ...
	   'String',str, 'Color',[1 0.4 0.1]);
  tpos = get(h,'Position');
  ext = get(h,'Extent');
  set(h,'Position',[tpos(1)+pos(3)/2-ext(3)/2, tpos(2)]);
