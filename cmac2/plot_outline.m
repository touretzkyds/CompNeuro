
pts = -pi/2:pi/20:pi/2;

%figure(3), clf, hold on, axis equal
%axis([-mx mx -mx mx])

plot(10*cos(pts),10*sin(pts),'r')
plot(5*cos(pts),5*sin(pts)+5,'r')
plot(-5*cos(pts),5*sin(pts)-5,'r')
