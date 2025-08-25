% Independent Components Analysis.   1-dimensional case.
%
% Based on the example from A. J. Bell and T. J. Sejnowski (1995), An
% information-maximisation approach to blind separation and blind
% deconvolution.  Neural Computation 7(6):1004-1034.
%
% David S. Touretzky.  September, 1998.

if ~exist('demo_type','var'), demo_type = 'ica1'; end
if ~strcmp(demo_type,'ica1'), clear all; demo_type = 'ica1'; end
if ~exist('Npts','var'), Npts = 3000; end
if ~exist('Nepochs','var'), Nepochs = 50; end
if ~exist('eta','var'), eta = 0.3; end

scaled_eta = eta / Npts;
x = randn(1,Npts)*2 + (rand(1)*3+1)*sign(rand(1)-0.5);

figure(gcf)
clf, whitebg(gcf,[0 0 0])
h1 = subplot(2,1,1);
x_pts = -10:0.2:10;
Nbins = length(x_pts);
xh=hist(x,x_pts);
bar(x_pts,xh,'hist')
ax = axis;
axis([-10 10 0 ax(4)])
set(h1,'NextPlot','add')
x_csum = cumsum(xh);
plot(x_pts,x_csum/x_csum(end)*ax(4),'g'); % green line: cumulative density fn.
title('Input Distribution X')
drawnow

h1a = [];
y_max = 2*Npts/100;

w = 1;
w0 = 0;

for epoch = 0:Nepochs

  u = w*x + w0;
  y = sigmoid(u);
  subplot(h1)
  delete(h1a)
  y_pts = sigmoid(w*x_pts+w0);
  x_csum = cumsum(x_pts);
  h1a = plot(x_pts,y_pts*ax(4),'y');  % yellow line
  legend('data','cum sum','y=g(u)','Location','NorthWest')

  subplot(2,1,2)
  set(gca,'NextPlot','replace')
  hist(y,Nbins)
  axis([0 1 0 y_max])
  set(gca,'NextPlot','add')
  plot([0 1],y_max*[0.5 0.5],'r--','LineWidth',1)
  title(sprintf('Epoch %d: Output Distribution Y',epoch))
  xlabel(sprintf('w = %5.4f,   w0 = %5.4f',w,w0))
  drawnow

  dw = (1.0 ./ w) + x .* (1-2*y);
  dw0 = 1 - 2*y;

  w = w + scaled_eta * sum(dw);
  w0 = w0 + scaled_eta * sum(dw0);

end
