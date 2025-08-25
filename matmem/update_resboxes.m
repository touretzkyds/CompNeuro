% update_resboxes.m

global NMEM buttons resboxes ibox rbox

for i = 1:NMEM
  dat = get(buttons(i),'UserData');
  c_in = dat{4};
  c_out = dat{5};
  thresh = max(1,sum(c_in));
  c_res = (c_in*Weights) >= thresh;
  t_res = decode(c_res);
  dat{3} = t_res;
  set(buttons(i),'UserData',dat)
  set(resboxes(i),'String',t_res)
  if all(c_out == c_res) & any(c_res)
    res_color = [1 0.75 0.75];
  else
    res_color = [0.75 0.75 1];
  end
  if get(buttons(i),'Value') == 0
    res_color = res_color * 0.8;
  end
  set(resboxes(i),'BackgroundColor',res_color)
end
