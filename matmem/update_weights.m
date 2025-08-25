% update_weights.m

global NUNITS NMEM Weights weight_objs

colors = 'wr';

for i=1:NUNITS
  for j=1:NUNITS
    set(weight_objs(i,j),'Color',colors(1+Weights(i,j)),'UserData',[i j])
  end
end
