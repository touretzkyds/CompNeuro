% toggle_stopgo

runflag = ~ runflag;

if runflag == 1
  set(hstopgo,'String','Stop')
  set(hstopgo,'BackgroundColor',[0.9, 0.2, 0.2])
  drawnow
  mainloop
else
  set(hstopgo,'String','Go')
  set(hstopgo,'BackGroundColor',[0.2, 0.9, 0.2])
  drawnow
end

