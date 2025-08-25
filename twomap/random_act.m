pos = 1+floor(rand(1)*NEUNITS);

SE = 5*wEE(:,pos);
SI = 0.1;

if rand(1) > 0.5
  SE = SE(p2);
end

if run_flag <= 0
  run_flag = 1;
  mainloop
end
