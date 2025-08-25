% store_item.m

subplot(ax_in)
h = plot(pcoords(1),pcoords(2),'yo');
set(h,'ButtonDownFcn','clickhandler')
training_points(end+1,:) = pcoords;
xlabel(sprintf('N = %d training points',size(training_points,1)))

train_point
