% toggle_inbit.m

setptr(gcf,'arrow')
DELETE_BUTTON_FLAG = 0;

inbit = gcbo;

dat = ~get(inbit,'UserData');
set(inbit,'UserData',dat)

c_in = zeros(1,NUNITS);
for i = 1:NUNITS
  c_in(i) = get(in_bits(i),'UserData');
end  

set(ibox,'String',upper(decode(c_in)));
set(obox,'String','');

apply_inbits(c_in)

