% set_g_value.m

val = str2num(get(g_valbox,'String'));

if isempty(val) | length(val) > 1 | val < 1e-3 | val > 9
  set(g_valbox,'String',num2str(get(g_valbox,'Value')))
else
  set(g_valbox,'Value',val,'String',sprintf('%4.3f',val))
end

