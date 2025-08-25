function clickhandler

global theta1_memory theta2_memory

  pos = get(gca,'CurrentPoint');
  pos = pos(1,1:2);
  plot_bins(pos)
  plot(pos(1),pos(2),'r*','Tag','bins')

  b = find_bins(pos);

  th1 = mean(theta1_memory(b));
  th2 = mean(theta2_memory(b));
  
  plot_arm(th1,th2)
  
