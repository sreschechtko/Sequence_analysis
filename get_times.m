function times = get_times(data_in, trial_num)

    times.Start = round(data_in(trial_num).EVENTS.TIMES(contains(data_in(trial_num).EVENTS.LABELS, 'GO_CUE'))*1000);
    times.T1 = round(min(data_in(trial_num).EVENTS.TIMES(contains(data_in(trial_num).EVENTS.LABELS, 'TARGET_1')))*1000); %min because contains picks up T10, T11, etc
    times.T2 = round(data_in(trial_num).EVENTS.TIMES(contains(data_in(trial_num).EVENTS.LABELS, 'TARGET_2'))*1000);
    times.T3 = round(data_in(trial_num).EVENTS.TIMES(contains(data_in(trial_num).EVENTS.LABELS, 'TARGET_3'))*1000);
    times.T4 = round(data_in(trial_num).EVENTS.TIMES(contains(data_in(trial_num).EVENTS.LABELS, 'TARGET_4'))*1000);
    times.T5 = round(data_in(trial_num).EVENTS.TIMES(contains(data_in(trial_num).EVENTS.LABELS, 'TARGET_5'))*1000);
    times.T6 = round(data_in(trial_num).EVENTS.TIMES(contains(data_in(trial_num).EVENTS.LABELS, 'TARGET_6'))*1000);
    times.T7 = round(data_in(trial_num).EVENTS.TIMES(contains(data_in(trial_num).EVENTS.LABELS, 'TARGET_7'))*1000);
    times.T8 = round(data_in(trial_num).EVENTS.TIMES(contains(data_in(trial_num).EVENTS.LABELS, 'TARGET_8'))*1000);
    times.T9 = round(data_in(trial_num).EVENTS.TIMES(contains(data_in(trial_num).EVENTS.LABELS, 'TARGET_9'))*1000);
    times.T10 = round(data_in(trial_num).EVENTS.TIMES(contains(data_in(trial_num).EVENTS.LABELS, 'TARGET_10'))*1000);
    times.T11 = round(data_in(trial_num).EVENTS.TIMES(contains(data_in(trial_num).EVENTS.LABELS, 'TARGET_11'))*1000);
    times.T12 = round(data_in(trial_num).EVENTS.TIMES(contains(data_in(trial_num).EVENTS.LABELS, 'TARGET_12'))*1000);
    times.T13 = round(data_in(trial_num).EVENTS.TIMES(contains(data_in(trial_num).EVENTS.LABELS, 'TARGET_13'))*1000);
    times.T14 = round(data_in(trial_num).EVENTS.TIMES(contains(data_in(trial_num).EVENTS.LABELS, 'TARGET_14'))*1000);


    %vel = sqrt(data_in.Right_HandXVel(start:T14).^2 + data_in.Right_HandYVel(start:T14).^2);