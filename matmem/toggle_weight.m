% toggle_weight.m

setptr(gcf,'arrow')
DELETE_BUTTON_FLAG = 0;

wobj = gcbo;
dat = get(wobj,'UserData');
xr = dat(1); xc = dat(2);
Weights(xr,xc) = ~Weights(xr,xc);

colors = 'wr';
set(weight_objs(xr,xc),'Color',colors(1+Weights(xr,xc)))

c_in = zeros(1,NUNITS);
for i =1:NUNITS
  c_in(i) = get(in_bits(i),'UserData');
end  

apply_inbits(c_in)
