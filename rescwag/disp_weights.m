% disp_weights.m

global Weights Weight_history epoch axwt axhist

weightcolors = ...
    [1 1 1; ...
     0 1 1; ...
     1 0 1; ...
     1 0 0];

% Turn weight vector into a matrix to allow bar plots to have different colors
w = zeros(4);
for i = 1:4; w(i,i) = Weights(i); end

subplot(axwt)
b=bar(w);
axis([0 5 -1.3 1.3])
set(gca,'XTickLabel',['bkg';'cs1';'cs2';'cs3'],'YTick',-1:0.25:1)
title(sprintf('Trial %d',epoch-1))
text(0.1, 1.1, ...
    '\Delta{}V_i = \beta\cdot(\lambda - \Sigma{}V_kX_k)\cdot\alpha_i\cdot{}X_i', ...
    'FontSize',12,'Color','g');
for i=1:length(Weights)
  set(b(i),'BarWidth',4)
  set(b(i),'FaceColor',weightcolors(i,:))
  text(i-0.4, -1.2, sprintf('%3.2f',Weights(i)), ...
      'Color', weightcolors(i,:))
end
if strcmp(get(b,'Type'),'hggroup')
  b = get(b,'Children');
end
%set(b,'FaceVertexCdata',weightcolors) % this must come last due to X weirdness

subplot(axhist), cla, hold on
chunksize=25;
xmax = chunksize*ceil((epoch-1)/chunksize);
xc = 0:xmax;
plot(xc,Weight_history(1:xmax+1,1),'Color',weightcolors(1,:),'LineStyle',':')
plot(xc,Weight_history(1:xmax+1,2),'Color',weightcolors(2,:),'LineStyle','-')
plot(xc,Weight_history(1:xmax+1,3),'Color',weightcolors(3,:),'LineStyle','-.')
plot(xc,Weight_history(1:xmax+1,4),'Color',weightcolors(4,:),'LineStyle','--')
axis([0 xmax+1 -1.3 1.3])
plot(marked_epochs_x,marked_epochs_y,'y--')
box on
title('Weight History')

update_evboxes

drawnow
