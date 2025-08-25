% Principal Component Analysis using Sanger's rule.
% David S. Touretzky.   September, 1998.
%
% See equations (8.21) and (8.22) from Hertz, Krogh, and Palmer.
%
%  Npts		number of points in the training set (Gaussian)
%  shape	[sx sy] scale factors for x and y coordinates
%  rotang	rotation angle of the gaussian's axes
%  mu		[mx my] mean of the gaussian
%  zeromean	if 1, training points will be normalized to zero mean
%  Nepochs	number of epochs to run
%  eta		learning rate


if ~exist('demo_type','var'), demo_type = 'pca_gaussian'; end
if ~strcmp(demo_type,'pca_gaussian'), clear all; demo_type = 'pca_gaussian'; end
if ~exist('Npts','var'), Npts = 2000; end
if ~exist('shape','var'), shape = [0.2 ; 0.025]; end
pts = randg2(Npts) .* (shape * ones(1,Npts));   % 2-by-N matrix

if ~exist('rotang','var'), rotang = pi/3; end
rotm = [cos(rotang) -sin(rotang); sin(rotang) cos(rotang)];

if ~exist('mu','var'), mu = [0.6 ; 0.3]; end
rpts = rotm*pts + mu*ones(1,Npts);

if ~exist('zeromean','var'), zeromean = 1; end
if zeromean
  rpts = rpts - mu*ones(1,Npts);
end

% plot the axes (white lines), training set (red dots), and mean (blue circle)
figure(gcf)
clf, whitebg(gcf,[0 0 0]), hold on
axis(1.2*[-1 1 -1 1])
plot([-50 50],[0 0],'w--')
plot([0 0],[-50 50],'w--')
plot(rpts(1,:),rpts(2,:),'r.','MarkerSize',4)
if ~zeromean, plot(mu(1),mu(2),'co'); end
hw1 = []; hw2 = []; hm1 = []; hm2 = []; hp = [];

W1 = (rand(2,1)-0.5) / 1;
W2 = (rand(2,1)-0.5) / 1;
if sign(W1)==sign(mu); else W1 = -W1; end

if ~exist('eta','var'), eta = 0.5; end
if ~exist('Nepochs','var'), Nepochs = 20; end
M1 = zeros(2,Nepochs*Npts);
M2 = M1;
repcnt = 1;

for epoch = 1:Nepochs;  % main loop
  for i = 1:Npts;
    xi = rpts(:,i);
    V1 = W1' * xi; V2 = W2' * xi;
    deltaW1 = eta * V1 * (xi - V1*W1);
    deltaW2 = eta * V2 * (xi - V1*W1 - V2*W2);
    W1 = W1 + deltaW1; W2 = W2 + deltaW2;
    M1(:,(epoch-1)*Npts+i) = W1; M2(:,(epoch-1)*Npts+i) = W2;
    if rem(i-1,repcnt) == 0
      spts = rpts -[1 ; 1]*W1'*rpts .* (W1*ones(1,Npts));
      delete([hw1 hw2 hm1 hm2 hp]);
      % hp = plot(spts(1,:),spts(2,:),'y.','MarkerSize',4); % non-PCA1 subspace (yellow dots)
      hm1 = plot(M1(1,:),M1(2,:),'g.','MarkerSize',4);  % memory of past W values (green dots)
      hm2 = plot(M2(1,:),M2(2,:),'g.','MarkerSize',4);
      hw1=plot([0 W1(1)],[0 W1(2)],'c'); % current W vectors (blue lines)
      hw2=plot([0 W2(1)],[0 W2(2)],'m');
      xlabel(sprintf('%d epochs, |W1|=%5.3f, |W2|=%5.3f, angle=%5.2f deg.', ...
		     epoch, norm(W1), norm(W2), ...
		     acos(dot(W1,W2)/norm(W1)/norm(W2))*180/pi))
      drawnow
      if i>50; repcnt = min(500,repcnt*2); end
    end
  end
end


% plot eigenvalues calculated directly, for comparison (purple lines)
C = rpts*rpts';
[eigvec,eigval] = eig(C)
%plot([0 eigvec(1,2)],[0 eigvec(2,2)],'m--')  
%plot([0 eigvec(1,1)],[0 eigvec(2,1)],'m--')
drawnow
