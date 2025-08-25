% update_evboxes.m

global Weights evboxes cr_button

for h = evboxes(:)'
    u = get(h,'UserData');
    vals = get(u,'Value');
    cr = [1 vals{1:end-1}]*Weights';
    if get(cr_button,'Value') == 1
        cr = max(0,cr);
    end
    set(h,'String',sprintf('%3.2f',cr))
end
