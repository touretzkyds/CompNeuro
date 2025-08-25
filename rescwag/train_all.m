function train_all(all_button,reps)

gos = get(all_button,'UserData');

for i = 1:reps
    for go_button = gos
        train_case(go_button)
    end
    record_weights
end
