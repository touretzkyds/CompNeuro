% motion.m

c = get(gca,'CurrentPoint');
theta = atan2(c(1,2),c(1,1));
rho = norm(c(1,1:2)) / 2.5;
xlines = [zz; rho*xv.*(1.4+cos(pts-theta)); nanz];
ylines = [zz; rho*yv.*(1.4+cos(pts-theta)); nanz];
set(hl,'XData',xlines(:),'YData',ylines(:))
set(hp,'XData',c(1,1),'YData',c(1,2))
drawnow
