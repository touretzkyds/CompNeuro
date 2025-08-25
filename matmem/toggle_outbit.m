% toggle_output.m

setptr(gcf,'arrow')
DELETE_BUTTON_FLAG = 0;

outbit = gcbo;

dat = ~get(outbit,'UserData');

c_in = zeros(1,NUNITS);
c_res = c_in;
for i = 1:NUNITS
  if outbit == out_bits(i)
    gind = i;
  end
  c_in(i) = get(in_bits(i),'UserData');
  c_res(i) = get(out_bits(i),'UserData');
end

thresh = max(1,sum(c_in));
g_res = c_in*Weights;
g_res = g_res(gind);

if dat == 1
  color = 'y';
elseif g_res > 0
  color = 'm';
else
  color = 'b';
end

set(outbit,'UserData',dat,'Color',color)

set(rbox,'String',decode(c_res))
set(ibox,'String','')
set(obox,'String','')

