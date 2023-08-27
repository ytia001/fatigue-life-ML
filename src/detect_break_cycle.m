M=readtable('Raw Data/FPAAM0027_1.csv','NumHeaderLines',3);
M=table2array(M);
displacement=M(:,2);
force=M(:,3);
count_cycle=M(:,4);
% plot(count_cycle,force)
max_cycle=max(M(:,4));
av_loop_force=zeros(max_cycle/0.5+1,1);
for i=0:0.5:max_cycle
loc=find(M(:,4)==i);
av_loop_force(i/0.5+1,1)=mean(M(loc,3));
end

plot(av_loop_force)
%plot(av_loop_force(2:end))

fatigue_life = 375;   % change this according to sample fatigue life
Num=2*fatigue_life;   % Num = 2 x fatigue life

%loading  
LoadNum=1:2:Num;     % extracting odd number rows
av_f_loading=av_loop_force(LoadNum); % vector of avg loading force for each cycle

F_initial = av_f_loading(2); % initial cycle average loading F
F_change = av_f_loading(end) - av_f_loading(2);  % change in average loading F
F_mean=mean(av_f_loading(2:end));     % mean of average loading F
Gradient_F = (F_change)/(fatigue_life-1); % Gradient of average loading F
%F_final = av_f_loading(end)  % Final cycle average loading F
%av_avf = mean(av_f_loading([2:139, 141:end]))

%Unloading
UnLoadNum=2:2:Num;  % extracting even number rows
av_f_unloading=av_loop_force(UnLoadNum);    % vector of avg unloading force for each cycle
av_avunf=mean(av_f_unloading(2:end));    % avg of avg unloading force
