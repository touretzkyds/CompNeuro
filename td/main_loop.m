% Main loop for TD learning

pat = pat+1;
if pat > buffer_length
  epoch = epoch + 1;
  pat = 1;
  buffer(:) = 0;
  history(:) = 0;
  V = 0;
end

 % shift new stimulus into buffer
oldbuff = buffer;
buffer(2:end,:) = buffer(1:(end-1),:);
buffer(1,:) = stimpat(pat,:);
R = reward(pat);

 % TD learning rule
oldV = V;
V = dot(W(:),buffer(:));
delta = R + Gamma*V - oldV;
%history(2:end,:) = history(1:(end-1),:);
%history(1,:) = [V oldV R delta];
history(pat,:) = [V oldV R delta];

W(:) = W(:) + eta*delta*oldbuff(:);

% Now do the graphic display
for i = 1:num_stimuli
  set(hstim(i), 'YData', buffer(:,i))
  set(hweights(i),'YData', W(:,i))
end

for i = 1:4
  set(hhist(i), 'YData', history(:,i))
end
set(hlegend,'String',{'V(t)','V(t-1)','Reward','Error'})
axis(axhist);
xlabel(sprintf('Trial %d',epoch))
drawnow

if pause_every_step == 1
  pause
elseif pat==buffer_length
  pause(0.25)
end
