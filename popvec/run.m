blackBackground
clf, hold on
disp('try ''run2'' for a color version')

pts = 0:pi/40:(2*pi-1e-4);

xv = cos(pts); yv = sin(pts);

zz = 0 * xv;
nanz = NaN * xv;

xlines = [zz; xv; nanz];
ylines = [zz; yv; nanz];

hl = plot(xlines(:),ylines(:), 'y');
set(gca,'Position',[0 0 1 1])
axis equal, axis off, axis([-2.5 2.5 -2.5 2.5])

hp = plot(0,0,'m+','MarkerSize',12);

set(gcf,'WindowButtonMotionFcn','motion')
