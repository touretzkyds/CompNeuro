% Principal Component Analysis using Sanger's rule.
% David S. Touretzky.   September, 1998.
%
% See equations (8.21) and (8.22) from Hertz, Krogh, and Palmer.
%
%  Npts		number of points in the training set (Gaussian)
%  Nepochs	number of epochs to run
%  eta		learning rate

if ~exist('demo_type','var'), demo_type = 'pca_cross'; end
if ~strcmp(demo_type,'pca_cross'), clear all; demo_type = 'pca_cross'; end
if ~exist('Npts','var'), Npts = 3000; end
if ~exist('Nepochs','var'), Nepochs = 250; end

if ~exist('eta','var'), eta = 0.1; end

nptsx = floor(Npts/2);
nptsy = Npts - nptsx;
pts = zeros(2,Npts);
pts(1,1:nptsx) = rand(1,nptsx)*2-1;
pts(2,nptsx+(1:nptsy)) = rand(1,nptsy)*2-1;
pts = pts + rand(2,Npts)*0.1-0.05;

A = [2 1; 1 -0.7];  % mixing matrix
rpts = A*pts;
rpts = rpts - mean(rpts,2)*ones(1,Npts); % assure zero mean

% plot the axes (white lines), training set (red dots), and mean (blue circle)
figure(gcf)
clf, blackBackground
hold on
axis([-2.5 2.5 -1.2 1.2])
plot([-50 50],[0 0],'w--')
plot([0 0],[-50 50],'w--')
plot(rpts(1,:),rpts(2,:),'r.','MarkerSize',4)
hw1 = []; hw2 = []; hm1 = []; hm2 = []; hp = [];

W1 = (rand(2,1)-0.5) / 1;
W2 = (rand(2,1)-0.5) / 1;

if ~exist('eta','var'), eta = 0.5; end
if ~exist('Nepochs','var'), Nepochs = 20; end
M1 = zeros(2,Nepochs);
M2 = M1;

for epoch = 1:Nepochs;  % main loop
  V1 = W1' * rpts; V2 = W2' * rpts;
  deltaW1 = sum(eta * repmat(V1,2,1) .* (rpts - W1*V1),2);
  deltaW2 = sum(eta * repmat(V2,2,1) .* (rpts - W1*V1 - W2*V2),2);
  W1 = W1 + deltaW1 / Npts;
  W2 = W2 + deltaW2 / Npts;
  if epoch > 1
    M1(:,epoch-1) = W1; M2(:,epoch-1) = W2;
    delete([hw1 hw2 hm1 hm2 hp]);
    hm1 = plot(M1(1,:),M1(2,:),'g.','MarkerSize',4);  % memory of past W values (green dots)
    hm2 = plot(M2(1,:),M2(2,:),'g.','MarkerSize',4);
    hw1=plot([0 W1(1)],[0 W1(2)],'c','LineWidth',2); % current W vectors (blue lines)
    hw2=plot([0 W2(1)],[0 W2(2)],'m','LineWidth',2);
    xlabel(sprintf('%d epochs, |W1|=%5.3f, |W2|=%5.3f, angle=%5.2f deg.', ...
                   epoch, norm(W1), norm(W2), ...
                   acos(dot(W1,W2)/norm(W1)/norm(W2))*180/pi))
    drawnow
  end
end


% plot eigenvalues calculated directly, for comparison (purple lines)
C = rpts*rpts';
[eigvec,eigval] = eig(C)
%plot([0 eigvec(1,2)],[0 eigvec(2,2)],'m--')  
%plot([0 eigvec(1,1)],[0 eigvec(2,1)],'m--')
drawnow
