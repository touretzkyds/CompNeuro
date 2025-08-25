% clickhandler.m

p = get(ax_in,'CurrentPoint');

xcoords(1);   % work-around for bug in Matlab 7.0.0
xval = max(xcoords(1),min(xcoords(end),floor(p(1))));
pcoords = [xval ycoords(1+xval)];
store_item

plot_cmac
