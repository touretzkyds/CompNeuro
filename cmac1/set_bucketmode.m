% set_bucketmode

bucket_mode = get(bucketmode_menu,'Value');

if bucket_mode == 1
  random_buckets
else
  sequential_buckets
end

setup_graphics
reset_cmac
