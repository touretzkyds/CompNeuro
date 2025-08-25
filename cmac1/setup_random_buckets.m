% setup_random_buckets

bins_assigned = {};
for z = 0:359
  c = find((z>=bmin|z<bmax-360) & z<=bmax);
  bins_assigned{z+1} = buckets(c);
  bincounts(z+1) = length(c);
end
