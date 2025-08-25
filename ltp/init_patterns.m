function init_patterns

  global buttons Patterns

  pat1 = zeros(2,100);
  pat1(1,[26:49, 76:98]) = 1;
  pat1(2,[40:60, 70:90]) = 1;

  phase000 = [sinewave(200,3,0); sinewave(200,3,0)];
  phase030 = [sinewave(200,3,0); sinewave(200,3,-pi/6)];
  phase090 = [sinewave(200,3,0); sinewave(200,3,-pi/2)];
  phase180 = [sinewave(200,3,0); sinewave(200,3,pi)];

  patrand = rand(2,100);

  patbcmb = zeros(1,200);
  patbcmb(10:60) = 0.99;
  patbcmb(61:105) = 0.5;
  patbcmb(106:160) = 0.99;
  patbcmb(161:195) = 0.25;
  tempa = zeros(1,50);
  tempa([15:24 34:43]) = 0.5;
  patbcma = [tempa tempa tempa tempa];
  patbcm = [patbcma; patbcmb];

  Patterns = {pat1 patbcm patrand phase000 phase030 phase090 phase180};

  set(buttons.patterns,'String', ...
      {'Step','BCM test', 'Random','In-Phase', ...
       'Phase 30','Phase 90','Anti-Phase'})


function v = sinewave(npts,ncycles,phase)

  top = ncycles * 2 * pi;
  incr = top/npts;
  pts = 0:incr:top;

  v = sin(pts + phase)/2 + 0.5;
