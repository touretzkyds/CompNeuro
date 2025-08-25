
figure(1)
colordef white
clf reset, hold on, axis equal
whitebg(1,[1 1 1])
mx = max_extension + 0.5;
axis([-mx mx -mx mx])
set(gca,'ButtonDownFcn','clickhandler')

plot_outline

plot_arm(0.6,0.6)
