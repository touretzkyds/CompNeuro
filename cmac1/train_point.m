% train_point.m
%
% the point is taken from pcoords

bins = bins_assigned{1+pcoords(1)};

r = sum(cmac_memory(bins));
diff = pcoords(2) - r;

if abs(diff) > Tolerance
  cmac_memory(bins) = cmac_memory(bins) + ...
      get(g_valbox,'Value') * diff / length(bins);
end

Npresented = Npresented + 1;
