% plot_cmac.m

if bucket_mode == 1
  m = reshape(cmac_memory,64,64);
else
  m = reshape(cmac_memory(1:Nhashes*Nbuckets_per_hash),Nhashes,Nbuckets_per_hash)';
end
set(h_mem,'CData',m)
  

youtput = [];
for i = 1:360
  youtput(i) = sum(cmac_memory(bins_assigned{i}));
end

subplot(ax_out)
set(h_out,'YData',youtput)

RMS = sqrt(mean((youtput-ycoords).^2));
title(sprintf('Points = %d:  MaxErr = %4.3f, RMS = %4.3f', ...
	      Npresented, max(abs(youtput-ycoords)), RMS))
