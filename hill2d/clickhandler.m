% clickhandler

% Note: don't accumulate input if the simulation isn't running.

if runflag

  mousepos = get(gca,'CurrentPoint');
  pos = max(1, min(Nunits, (round(mousepos(2,1))-1)*N + round(mousepos(2,2))));

  External = External + 150 * wEE(:,pos).^3*60;
  
end
