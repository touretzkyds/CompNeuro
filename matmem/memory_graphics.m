% memory_graphics.m

delete(grid_objs), delete(weight_objs)
grid_objs = [];
weight_objs = zeros(NUNITS,NUNITS);
axis([-20 NUNITS -6 NUNITS])

% Grid lines:
for i=1:NUNITS
  t1 = plot([-1 NUNITS],[i i],'w');
  t2 = plot([i i],[-1 NUNITS],'w');
  t3 = plot(i,-1,'wv');
  t4 = plot(-1,i,'w>');
  grid_objs = [grid_objs t1 t2 t3 t4];
end

for i=1:TLEN-1
  coord = [i i]*KBITS + 0.5;
  t1 = plot(coord,[-1.5 -0.5],'g');
  t2 = plot([-1.5 -0.5],coord,'g');
  grid_objs = [grid_objs t1 t2];
end

for i=1:NUNITS
  for j=1:NUNITS
    weight_objs(j,i) = plot(i,j,'*w','ButtonDownFcn','toggle_weight');
  end
end

% Input and output bits:
delete(in_bits), delete(out_bits)
in_bits = zeros(1,NUNITS); out_bits = in_bits;
for i=1:NUNITS
  in_bits(i) = plot(-2,i,'bo','ButtonDownFcn','toggle_inbit');
  out_bits(i) = plot(i,-2,'bo','ButtonDownFcn','toggle_outbit');
end

ax = axis;
px = (-1-ax(1))/(ax(2)-ax(1));
py = -ax(3)/(ax(4)-ax(3));

store_button = ...
    uicontrol('Style','Pushbutton','String','S', ...
	      'Units','normalized','Position',[px py 0.04 0.04], ...
	      'BackgroundColor',[1.0 0 0], ...
	      'CallBack','store_iopair');

grid_objs(1+end) = store_button;
