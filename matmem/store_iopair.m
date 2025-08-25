% store_iopair.m

for i=1:NUNITS
  c_in(i) = get(in_bits(i),'UserData');
  c_out(i) = get(out_bits(i),'UserData');
end

for i=1:NUNITS
  if c_in(i)
    for j=1:NUNITS
      if c_out(j)
	Weights(i,j) = 1;
      end
    end
  end
end

update_weights
update_resboxes
