% CMAC simulation of inverse kinematics for a two-link arm.

global len1 len2 bin_centers bin_width theta1_memory theta2_memory

len1 = 5;        % length of upper arm
len2 = 5;        % length of forearm
max_extension = len1 + len2;

lim1 = [0 pi];   % min and max values for theta1
lim2 = [0 pi];   % min and max values for theta2

Nbins = 1000;
bin_width = 2;
bin_centers = rand(Nbins,2) * max_extension * 2 - max_extension;

theta1_memory = zeros(Nbins,1);
theta2_memory = zeros(Nbins,1);

eta = 0.1;       % learning rate

new_plot

