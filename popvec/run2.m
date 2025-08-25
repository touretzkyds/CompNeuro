colordef none
clf reset, whitebg(gcf, [0 0 0]), hold on

pts = 0:pi/20:(2*pi-1e-4);

xv = cos(pts); yv = sin(pts);

zz = 0 * xv;

xlines = [zz; xv];
ylines = [zz; yv];

hl = plot(xlines,ylines);
axis equal, axis off, axis([-2.5 2.5 -2.5 2.5])
set(gca,'Position',[0 0 1 1])
set(1,'BackingStore','off')
set(gca,'SortMethod','childorder')

hp = plot(0,0,'m+');

set(gcf,'WindowButtonMotionFcn','motion2')
