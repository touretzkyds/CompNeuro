% mainloop

while runflag

  FE = max(gammaE + wEE*SE + wEI*SI + External, 0);
  FI = max(gammaI + sum(wIE*SE) + wII*SI, 0);

  SE = SE + (-SE+FE) * (deltaT/tauE);
  SI = SI + (-SI+FI) * (deltaT/tauI);

  External = decayrate * External;

  FEr = reshape(FE,N,N);
  FEc = FEr + reshape(External,N,N);
  set(hsurf,'ZData',FEr,'CData',FEc)
  drawnow

end
