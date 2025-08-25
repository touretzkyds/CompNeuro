% setup_display.m

colordef none
clf reset, whitebg(gcf,[0 0 0])
set(gcf,'Backingstore','off')

ax1 = axes ('position',[0.1 0.6 0.85 0.32]);
set(ax1,'ButtonDownFcn','clickhandler')
axis([1 NEUNITS 0 1])
h_title = title('');
ylabel('Map 1')
hold on

h_bump1 = plot(zeros(NEUNITS,1),'yo','ButtonDownFcn','clickhandler');

h_inp1 = plot(zeros(NEUNITS,1),'r+','ButtonDownFcn','clickhandler');

ax2 = axes ('position',[0.1 0.2 0.85 0.32]);
set(ax2,'ButtonDownFcn','clickhandler')
axis([1 NEUNITS 0 1])
set(ax2,'XtickLabel',p2(get(ax2,'XTick')))
ylabel('Map 2')
hold on

xlabel('Use the mouse to supply external input')
h_bump2 = plot(zeros(NEUNITS,1),'yo','ButtonDownFcn','clickhandler');
h_inp2 = plot(zeros(NEUNITS,1),'r+','ButtonDownFcn','clickhandler');


bias_slider = uicontrol('Style','Slider','Tag','Bias', ...
  'Position', [90 30 150 16], 'Value', 0.5, ...
  'SliderStep', [0.05 0.1], ...
  'CallBack','Bias = update_slider(gcbo,bias_text, -1.0,  1.0,  0.1,  ''Bias: %5.2f'');');
bias_text = uicontrol('Style','Text','Position',[250 30 80 16], ...
		      'String','No Bias');


noise_slider = uicontrol('Style','Slider','Tag','Noise', ...
  'Position', [90 10 150 16], 'Value', 0.0, ...
  'SliderStep', [0.05 0.1], ...
  'CallBack','Noise = update_slider(gcbo,noise_text,0, 2, 0.1, ''Noise: %4.1f'');');
noise_text = uicontrol('Style','Text','Position',[250 10 80 16], ...
		       'String','No Noise');


run_button = uicontrol('Style','PushButton','Position',[10 50 40 18], ...
	'BackgroundColor',[.2 .8 .2],'String','Run', ...
	'CallBack','run_flag = Inf; mainloop');

step_button = uicontrol('Style','PushButton','Position',[10 30 40 18], ...
	'BackgroundColor',[.5 .5 1],'String','Step', ...
	'CallBack','run_flag = 1; mainloop');

rand_button = uicontrol('Style','PushButton','Position',[10 10 40 18], ...
	'BackgroundColor',[.8 .2 .2],'String','Rand', ...
	'CallBack','random_act');

hold_pushbutton = uicontrol('Style','CheckBox', ...
        'Position',[400 19 90 20], 'String', 'Input Hold');
