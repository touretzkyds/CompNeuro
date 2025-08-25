% Independent Components Analysis.   2-dimensional case.
%
% Based on the algorithm in A. J. Bell and T. J. Sejnowski (1995), An
% information-maximisation approach to blind separation and blind
% deconvolution.  Neural Computation 7(6):1004-1034.
%
% David S. Touretzky.  September, 1998.

if ~exist('demo_type','var'), demo_type = 'ica_cross'; end
if ~strcmp(demo_type,'ica_cross'), clear all; demo_type = 'ica_cross'; end
if ~exist('Npts','var'), Npts = 3000; end
if ~exist('Nepochs','var'), Nepochs = 200; end

if ~exist('eta','var'), eta = 0.5; end

nptsx = floor(Npts/2);
nptsy = Npts - nptsx;
pts = zeros(2,Npts);
pts(1,1:nptsx) = rand(1,nptsx)*2-1;
pts(2,nptsx+(1:nptsy)) = rand(1,nptsy)*2-1;
pts = pts + rand(2,Npts)*0.1-0.05;

A = [2 1; 1 -0.7];  % mixing matrix
x = A*pts;
x = x - mean(x,2)*ones(1,Npts); % assure zero mean

figure(gcf)
clf, whitebg(gcf,[0 0 0])
hold on
plot(x(1,:),x(2,:),'r.','MarkerSize',4)  % plot the data set as red dots
axis([-2.5 2.5 -1.2 1.2])
ax = axis;
drawnow
h1 = [];

W = [1 0; 0 1];
w0 = [0; 0];

for epoch=0:Nepochs
  u = W*x + w0*ones(1,Npts);
  y = sigmoid(u);
  Winv = inv(W);
  Winv(abs(Winv)<1e-5) = 1e-5;  % to protect against zero divides belowXS
  delete(h1)
  % plot the estimated mixing matrix as blue lines
  h1 = [ plot(ax(1:2),ax(1:2)*Winv(2,1)/Winv(1,1),'c'),
         plot(ax(1:2),ax(1:2)*Winv(2,2)/Winv(1,2),'c') ];
  W1 = Winv(:,1); W2 = Winv(:,2);
  xlabel(sprintf('%d epochs, angle=%5.2f deg.', ...
                 epoch, acos(dot(W1,W2)/norm(W1)/norm(W2))*180/pi))
  drawnow

  dW = inv(W') + (1 - 2*y)*x'/Npts;
  dw0 = 1 - 2*y;

  W = W + eta * dW;
  w0 = w0 + eta * mean(dw0,2);

end

Winv = inv(W);
Winv / min(min(abs(Winv)))

