function train_case(go_button)

v = get(go_button,'UserData');

cs1 = get(v(1),'Value');
cs2 = get(v(2),'Value');
cs3 = get(v(3),'Value');
ucs = get(v(4),'Value');
learn_rw([1 cs1 cs2 cs3],ucs)
