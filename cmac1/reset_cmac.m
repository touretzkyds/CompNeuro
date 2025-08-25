cmac_memory(:) = 0;
training_points = zeros(0,2);
Npresented = 0;

subplot(ax_in)
delete(findobj('Parent',ax_in,'Color','y'))
xlabel('')

plot_cmac
