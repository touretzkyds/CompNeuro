% motion.m

c = get(gca,'CurrentPoint');
theta = atan2(c(1,2),c(1,1));
rho = norm(c(1,1:2)) / 2.5;
xlines = [zz; rho*xv.*(1.4+cos(pts-theta))];
ylines = [zz; rho*yv.*(1.4+cos(pts-theta))];
for i = 1:length(hl)
    set(hl(i),'XData',xlines(:,i),'YData',ylines(:,i))
end
set(hp,'XData',c(1,1),'YData',c(1,2))
% drawnow    % this drawnow crashes Matlab 6.5
