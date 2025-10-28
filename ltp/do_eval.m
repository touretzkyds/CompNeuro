function do_eval

  global axplot axdata buttons Patterns Params PAUSE_FLAG
  global bcm_flag bcm_theta

  patno = get(buttons.patterns,'Value');
  pats = Patterns{patno};
  NPATS = size(pats,2);

  w_AB = Params.w0;
  mu_A = mean(pats(1,:));
  mu_B = mean(pats(2,:));
  bcm_flag = 0;
  bcm_theta = mean(pats(2,:).^2);

  expr = [get_expr(buttons.c1) '+' ...
	  get_expr(buttons.c2) '+' ...
	  get_expr(buttons.c3) '+' ...
	  get_expr(buttons.c4)];
			    

  p_alpha = Params.alpha;
  p_beta = Params.beta;
  p_gamma = Params.gamma;
  p_delta = Params.delta;

  vals = zeros(1,NPATS);
  bcm_record = zeros(1,NPATS);

  for i=1:NPATS;
    y_A = pats(1,i);
    y_B = pats(2,i);
    bcm_record(i) = bcm_theta;
    wdelta = eval(expr);
    w_AB = max(0, w_AB + wdelta);
    vals(i) = w_AB;
  end

  subplot(axplot)
  plot(vals,'y')
  axis([0 NPATS min(-0.1,Params.lmin) Params.lmax*1.05])
  grid on
  strs = get(buttons.textobjs,'String');
  titlestr = '';
  for i=1:4, titlestr = concstr(titlestr,strs{i}); end
  if isempty(titlestr), titlestr = '0'; end
  title(['\Delta w_{AB} = ' titlestr])


  subplot(axdata)
  pdata = [pats(2,:); 1.2+pats(1,:)];
  plot(pdata','b')
  axis([0 NPATS -0.1 2.5]), axis off
  text(0,1.2,'y_A')
  text(0,0,'y_B')
  if bcm_flag
    hold on
    plot(bcm_record,'r.')
    text('Units','pixels','Position',[15 10],'String','\theta','Color',[1 0 0])
    hold off
  end

function e = get_expr(obj)

  val = get(obj,'Value');
  dat = get(obj,'UserData');

  entry = dat{val};
  e = entry{2};



function n = concstr(t,s)

  if isempty(s)
    n = t;
    return
  end

  if isempty(t)
    if s(1) == '-'
      n = ['- ' s(2:end)];
    else
      n = s;
    end
  else % t is not empty
    if s(1) == '-'
      n = [t ' - ' s(2:end)];
    else
      n = [t ' + ' s];
    end
  end

