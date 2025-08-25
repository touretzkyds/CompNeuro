pos = 1+floor(rand(1,3)*NEUNITS);

SE = 3*wEE(:,pos(1)) + wEE(:,pos(2)) + wEE(:,pos(3));
SI = 0.1;

if run_flag <= 0
  run_flag = 1;
  bump_mainloop
end
