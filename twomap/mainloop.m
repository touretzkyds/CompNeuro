% mainloop.m

while run_flag > 0
  run_flag = run_flag - 1;
  t = t+1;

  core_equations

  set(h_bump1,'YData',FE)
  set(h_inp1,'YData',External)

  set(h_bump2,'YData',FE(p2));
  set(h_inp2,'YData',External(p2));

  if run_flag == 0 | rem(t,10) == 0
    set(h_title,'String', ...
	sprintf('Iteration %4d:  Peak %5.3f at %6.2f   Width=%2d', ...
	t,peakval,peakpos,sum(FE>0.15)))
    drawnow
  end

end
