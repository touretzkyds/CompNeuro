function plot_arm(theta1,theta2)

 [elbow,hand] = arm_position(theta1,theta2);
 
% set(h_elbow,'XData',[0 elbow(1)],'YData',[0 elbow(2)])
% set(h_hand,'XData',[elbow(1), hand(1)], 'YData',[elbow(2) hand(2)]);

 delete(findobj('Tag','arm'))

 plot([0 elbow(1)],[0 elbow(2)],'b','LineWidth',2, ...
     'Tag','arm', ...
     'ButtonDownFcn','clickhandler');

 plot([elbow(1) hand(1)],[elbow(2) hand(2)],'LineWidth',2, ...
     'Color',[0 0.6 0], ...
     'Tag','arm', ...
     'ButtonDownFcn','clickhandler');

 drawnow
 