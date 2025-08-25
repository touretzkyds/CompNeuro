% random_buckets

bins_assigned = {};
for z = 0:359
  c = find( (z>=bmin & z<=bmax) | (z>=bmin-360 & z<=bmax-360) );
  bins_assigned{z+1} = buckets(c);
  bincounts(z+1) = length(c);
end
