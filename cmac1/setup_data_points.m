% setup_data_points.m

f = get(function_menu,'Value');

xvals = xcoords * pi / 180;

switch f
  case 1
    ycoords = sin(xvals);
  case 2
    ycoords = sin(3*xvals);
  case 3
    ycoords = sin(8*xvals);
  case 4
    ycoords = 0.75*sign(sin(3*xvals-pi/4));
  case 5
    n_smooth = 20; % use 20 steps between each random point
    c = [0];
    a = 2*rand(1,ceil(length(xcoords)/n_smooth)) - 1;
    for i=1:length(a)
      b = [];
      for j = (1/n_smooth):(1/n_smooth):1
	b(end+1) = (1-j)*c(end) + j*a(i);
      end
      c = [c b];
    end
    ycoords = c(1:length(xcoords));
end

set(h_in,'YData',ycoords)
set(h_desired,'YData',ycoords)

reset_cmac
