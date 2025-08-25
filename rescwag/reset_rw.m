% reset_rw.m

for b = go_buttons(:)'
    for bobj = get(b,'UserData')
        set(bobj,'Value',0)
        toggle(bobj)
    end
    
end

for i = 1:length(aboxes)
    t = aboxes(i);
    set(t,'String',num2str(InitCoeffs(i)))
    set_boxval(t)
end

new_expt