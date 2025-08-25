function b = find_bins(hand_coords)

global bin_centers bin_width

s = abs(bin_centers(:,1)-hand_coords(1)) <= bin_width/2 & ...
    abs(bin_centers(:,2)-hand_coords(2)) <= bin_width/2;

b = find(s);
