function plot_bins(pt)

global bin_centers bin_width

  sqx = [-1 -1 1  1 -1] * bin_width/2;
  sqy = [-1  1 1 -1 -1] * bin_width/2;

  s = find_bins(pt);
  delete(findobj(1,'Tag','bins'))
  
  coords = bin_centers(s,:);
  
  for i = 1:size(coords,1);
    plot(sqx+coords(i,1),sqy+coords(i,2),'k','Tag','bins', ...
	'ButtonDownFcn','clickhandler')
  end
  
    