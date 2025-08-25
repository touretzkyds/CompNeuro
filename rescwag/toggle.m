function toggle(obj)

val = get(obj,'Value');
sc = get(obj,'UserData');

if val == 0
    set(obj,'BackgroundColor',[0.7 0.7 0.7])
else
    set(obj,'BackgroundColor',sc)
end
drawnow

update_evboxes
