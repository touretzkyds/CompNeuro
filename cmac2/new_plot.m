
figure(1)
clf reset, hold on, axis equal
whiteBackground(gcf)
mx = max_extension + 0.5;
axis([-mx mx -mx mx])
set(gca,'ButtonDownFcn','clickhandler')

plot_outline

plot_arm(0.6,0.6)
