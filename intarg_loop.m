%%
clear all

S = dir('./Data');
S = S(~[S.isdir]);
[~,idx] = sort([S.datenum]);

S = S(idx);

%load data from one of the participant's data
for i = 1:length(S)
    currname = S(i).name;
    D = zip_load(append('./Data/', currname));
    D = D.c3d;

    targets = [D(1).TP_TABLE.Target_1, D(1).TP_TABLE.Target_2, ...
        D(1).TP_TABLE.Target_3, D(1).TP_TABLE.Target_4, ... 
        D(1).TP_TABLE.Target_5, D(1).TP_TABLE.Target_6, ...
        D(1).TP_TABLE.Target_7, D(1).TP_TABLE.Target_8, ... 
        D(1).TP_TABLE.Target_9, D(1).TP_TABLE.Target_10, ...
        D(1).TP_TABLE.Target_11, D(1).TP_TABLE.Target_12, ...
        D(1).TP_TABLE.Target_13, D(1).TP_TABLE.Target_14];

    %read all simultaneously
    targ_pos = [D(1).TARGET_TABLE.X_GLOBAL,D(1).TARGET_TABLE.Y_GLOBAL];

    %initialize a matrix to put time in target in
    timeintarget = zeros(length(D),17);

    
    for h = 1:length(D) %looping through trials

        %for each trial we want to get time in each target
        %requires some amount of error handling because some trials don't have
        %all 14 targets reached (error trials)

        % load the event times
        times = get_times(D,h);
        trialdata = [D(h).TRIAL.TRIAL_NUM D(h).TRIAL.TP ...
            D(h).TP_TABLE.Visual_Horizon(D(h).TRIAL.TP)];

        %get the target positions for this trial
        trial_positions = targ_pos(targets(D(h).TRIAL.TP,:),:);

        lrad = D(h).TARGET_TABLE.Logical_radius(1); %logical radius

        Tin = zeros(14,1);


        if isempty(times.T1) < 1 %returns 0 if it isn't empty, ie reached target
            Tin(1) = time_intargetcont(D(h).Right_HandX(times.T1:times.T1+1500)*100, ...
                D(h).Right_HandY(times.T1:times.T1+1500)*100, ...
                trial_positions(1,:), lrad);
        end

        if isempty(times.T2) < 1
            Tin(2) = time_intargetcont(D(h).Right_HandX(times.T2:times.T2+1500)*100, ...
                D(h).Right_HandY(times.T2:times.T2+1500)*100, ...
                trial_positions(2,:), lrad);
        end

        if isempty(times.T3) < 1
            Tin(3) = time_intargetcont(D(h).Right_HandX(times.T3:times.T3+1500)*100, ...
                D(h).Right_HandY(times.T3:times.T3+1500)*100, ...
                trial_positions(3,:), lrad);
        end

        if isempty(times.T4) < 1
            Tin(4) = time_intargetcont(D(h).Right_HandX(times.T4:times.T4+1500)*100, ...
                D(h).Right_HandY(times.T4:times.T4+1500)*100, ...
                trial_positions(4,:), lrad);
        end

        if isempty(times.T5) < 1
            Tin(5) = time_intargetcont(D(h).Right_HandX(times.T5:times.T5+1500)*100, ...
                D(h).Right_HandY(times.T5:times.T5+1500)*100, ...
                trial_positions(5,:), lrad);
        end

        if isempty(times.T6) < 1
            Tin(6) = time_intargetcont(D(h).Right_HandX(times.T6:times.T6+1500)*100, ...
                D(h).Right_HandY(times.T6:times.T6+1500)*100, ...
                trial_positions(6,:), lrad);
        end

        if isempty(times.T7) < 1
        Tin(7) = time_intargetcont(D(h).Right_HandX(times.T7:times.T7+1500)*100, ...
            D(h).Right_HandY(times.T7:times.T7+1500)*100, ...
            trial_positions(7,:), lrad);
        end

        if isempty(times.T8) < 1
        Tin(8) = time_intargetcont(D(h).Right_HandX(times.T8:times.T8+1500)*100, ...
            D(h).Right_HandY(times.T8:times.T8+1500)*100, ...
            trial_positions(8,:), lrad);
        end

        if isempty(times.T9) < 1
        Tin(9) = time_intargetcont(D(h).Right_HandX(times.T9:times.T9+1500)*100, ...
            D(h).Right_HandY(times.T9:times.T9+1500)*100, ...
            trial_positions(9,:), lrad);
        end

        if isempty(times.T10) < 1
        Tin(10) = time_intargetcont(D(h).Right_HandX(times.T10:times.T10+1500)*100, ...
            D(h).Right_HandY(times.T10:times.T10+1500)*100, ...
            trial_positions(10,:), lrad);
        end

        if isempty(times.T11) < 1
        Tin(11) = time_intargetcont(D(h).Right_HandX(times.T11:times.T11+1500)*100, ...
            D(h).Right_HandY(times.T11:times.T11+1500)*100, ...
            trial_positions(11,:), lrad);
        end

        if isempty(times.T12) < 1
        Tin(12) = time_intargetcont(D(h).Right_HandX(times.T12:times.T12+1500)*100, ...
            D(h).Right_HandY(times.T12:times.T12+1500)*100, ...
            trial_positions(12,:), lrad);
        end

        if isempty(times.T13) < 1
        Tin(13) = time_intargetcont(D(h).Right_HandX(times.T13:times.T13+1500)*100, ...
            D(h).Right_HandY(times.T13:times.T13+1500)*100, ...
            trial_positions(13,:), lrad);
        end

        if isempty(times.T14) < 1
        Tin(14) = time_intargetcont(D(h).Right_HandX(times.T14:times.T14+1500)*100, ...
            D(h).Right_HandY(times.T14:times.T14+1500)*100, ...
            trial_positions(14,:), lrad);
        end


        timeintarget(h,:) = [trialdata Tin'];
    end

    dlmwrite(append('./Summaries/',currname(1:length(currname)-4),'_time_in_target.txt'),timeintarget,'\t');
    fprintf('\r')
    fprintf('\r')
    fprintf('Wrote out data')
    fprintf('\r')
end

