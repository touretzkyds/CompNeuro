% setup_bucket_mode.m
% GUI callback to change the bucket assignment mode
%
% This function is called when the user selects a different bucket
% assignment mode from the dropdown menu. It updates the global
% bucket_mode variable and re-initializes the CMAC with the new mode.

bucket_mode = get(bucketmode_menu,'Value');

if bucket_mode == 1
  random_buckets
else
  sequential_buckets
end

reset_cmac