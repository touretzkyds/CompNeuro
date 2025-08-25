function [elbow,hand] = arm_position(theta1,theta2)

% Calculate the coordinates of the elbow and hand, given the joint
% angles (theta1 and theta2) and the lengths of the upper arm and
% forearm (len1 and len2).

  global len1 len2
  
  rot1 = [ cos(theta1) -sin(theta1); 
           sin(theta1)  cos(theta1)];

  rot2 = [ cos(theta2) -sin(theta2); 
           sin(theta2)  cos(theta2)];

  elbow = [0 len1] * rot1;

  hand =  (([0 len2] * rot2) + [0 len1]) * rot1;
