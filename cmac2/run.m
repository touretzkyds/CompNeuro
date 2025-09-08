% Generate random angle pairs theta1, theta2.
% Calculate the resulting hand position.
% Train the CMAC to return (theta1,theta2) when given this hand
% position as input.

initialize

Ntrain = 5000;

trainpoints = [rand(Ntrain,1)*lim1(2)+lim1(1) rand(Ntrain,1)*lim2(2)+lim2(1)];
handpoints = zeros(Ntrain,2);
prediction_error = zeros(Ntrain,1);

for i = 1:Ntrain
  theta1 = trainpoints(i,1);
  theta2 = trainpoints(i,2);

  [elbow_pos,hand_pos] = arm_position(theta1,theta2);
  handpoints(i,:) = hand_pos;
  if rem(i,100) == 0
    plot_arm(theta1,theta2)
    title(sprintf('%d points out of %d',i,Ntrain))
    drawnow
  end
  
  % learning algorithm
  b = find_bins(hand_pos);
  predicted_theta1 = mean(theta1_memory(b));
  predicted_theta2 = mean(theta2_memory(b));

  theta1_error = theta1 - predicted_theta1;
  theta2_error = theta2 - predicted_theta2;

  prediction_error(i) = theta1_error^2 + theta2_error^2;

  theta1_memory(b) = theta1_memory(b) + eta * theta1_error;
  theta2_memory(b) = theta2_memory(b) + eta * theta2_error;

end

figure(1)
plot(handpoints(:,1),handpoints(:,2),'.', ...
    'Color',0.8*[1 1 1],'ButtonDownFcn','clickhandler')
text(-10,9,'Click the mouse to','Color','r','FontSize',12)
text(-10,8,'test the memory.','Color','r','FontSize',12)

figure(2),
clf reset
blackBackground(gcf)
twindow = floor(Ntrain/50);
plot(50*(1:twindow),mean(reshape(prediction_error(1:50*floor(Ntrain/50)),50,floor(Ntrain/50))))
title('Training error')
