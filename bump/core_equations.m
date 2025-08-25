VE = gammaE + wEE*SE + wEI*SI + External + Bias + (rand(NEUNITS,1)-0.5)*Noise;
FE = (1 + tanh(VE))/2;
deltaSE = (-SE+FE) * (deltaT/tauE);

VI = gammaI + wIE*sum(SE) + wII*SI;
FI = (1 + tanh(VI))/2;
deltaSI = (-SI+FI)*deltaT/tauI;

SE = SE + deltaSE;
SI = SI + deltaSI;

if get(hold_pushbutton,'Value') == 0
  External = External * DecayRate;
end

cospeak = sum(coscoords .* FE) / sum(FE);
sinpeak = sum(sincoords .* FE) / sum(FE);
peakpos = (atan2(sinpeak,cospeak)+pi)/(2*pi)*NEUNITS;
peakval = max(FE);

set(h_bump,'YData',FE)
set(h_inhib,'YData',[FI FI])
set(h_inp,'YData',External)

if t == 1 | rem(t,10) == 0
    update_title
end

drawnow
