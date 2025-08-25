% make_random.m

DELETE_BUTTON_FLAG = 0;

for b = buttons
  rdat = get(b,'UserData');
  if strcmp(rdat{1},blanktext) == 1
    t_in = random_string;
    t_out = random_string;
    setup_button(b,t_in,t_out)
  end
end

update_weights

update_resboxes
