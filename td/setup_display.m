figure(1), clf
blackBackground
set(gcf, 'Color', [0 0 0])

subplot(3,1,1)
hstim = bar(buffer);
axis([0 1+buffer_length 0 1.5])
title('TD Learning Simulation')
ylabel('Stimuli')

subplot(3,1,2)
hweights = bar(W,'EdgeColor','w');
axis([0 1+buffer_length -1.2 1.2])
ylabel('Weights')

subplot(3,1,3)
axhist = gca;
hhist = bar(history,'EdgeColor','w');
set(hhist(1), 'FaceColor', 'b')
set(hhist(2), 'FaceColor', 'c')
set(hhist(3), 'FaceColor', 'y')
set(hhist(4), 'FaceColor', 'r')
xlabel(sprintf('Trial %d',epoch))
ylabel('History')

hlegend = legend(hhist,{'V(t)','V(t-1)','Reward','Error'},'Location','northeast');
p = get(hlegend,'Position');
p(1:2) = [0.79 0.25];
set(hlegend,'Position',p)

% add dotted vertical dividing lines
hold on
for i = 1.5 : buffer_length
  plot([i,i], [0,2], ':w')
end

axis([0 1+buffer_length -0.2 1.2])
drawnow
