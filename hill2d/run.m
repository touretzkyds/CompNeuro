% run.m:  Simulation begins

if ~exist('built','var'), build, end

initSE =  full(25.*wEE(:,floor(N^2/2+N/4)));
SE = initSE;
SI = 1.7;
External = SE*0;

figure(1)
clf, whitebg(gcf,[0 0 0])
colormap(jet)
hsurf = surf(reshape(SE,N,N));
axis([0 N 0 N 0 15])
axis xy
view(-5,70)
set(hsurf,'ButtonDownFcn','clickhandler')
set(gca,'ButtonDownFcn','clickhandler')

hstopgo = uicontrol('Style','PushButton', 'Position',[1 1 60 25], ...
    'BackGroundColor',[0.9 0.2 0.2], 'String','Stop', ...
    'CallBack','toggle_stopgo');

runflag=1;

mainloop
