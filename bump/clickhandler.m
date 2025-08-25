% clickhandler.m

% Line objects don't have a CurrentPoint property, so if the user
% mouses on the bump itself and gcbo returns a line, we should replace
% that handle with the parent handle (the axes object).

obj = gcbo;
if ~strcmp(get(obj,'Type'),'axes')
  obj = get(obj,'Parent');
end

mousepos = get(obj,'CurrentPoint');
stim_index = max(1,min(NEUNITS,floor(mousepos(1,1))));
stim_scale = mousepos(1,2);
External = External + stim_scale * rot(W,-(stim_index-1));

if run_flag <= 0
  run_flag = 1;
  bump_mainloop
end
