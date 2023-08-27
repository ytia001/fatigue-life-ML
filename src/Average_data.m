clc
clear all

M=readtable('Raw Data/FPAAM0048_1.csv','NumHeaderLines',3); % import files
M=table2array(M);
fatigue_life = 869;
loc_M=M(:,4)<869; % change this according to fatigue life
%loc_M=M(:,4)<=213.5; % change this according to fatigue life
%loc_M=M(:,4)<=214; % change this according to fatigue life
newM=M(loc_M==1,:);
cyclic_num=0:0.5:max(newM(:,4));    

%% material parameters
width=20;
displacement=20; % change displacement according to experiment
stretch=(width+displacement)/width;

%% loading
his_load=[];
for i=1:2:length(cyclic_num)
loc=find(newM(:,4)==cyclic_num(i));
his_load=[his_load length(loc)];
end
num=min(his_load);

M_load=zeros(length(his_load),num);

for i=1:2:length(cyclic_num)
loc=find(newM(:,4)==cyclic_num(i));
force_loading=M(loc,3);
M_load(cyclic_num(i)+1,:)=force_loading(1:num)';
end

% formula to convert displacement to stretch
lambda=linspace(1,stretch,num);
force_ave=mean(M_load);
plot(lambda,force_ave)
hold on

%% unloading
his_unload=[];
for i=2:2:length(cyclic_num)
loc=find(newM(:,4)==cyclic_num(i));
his_unload=[his_unload length(loc)];
end
num_unload=min(his_unload);


M_unload=zeros(length(his_unload),num_unload);

for i=2:2:length(cyclic_num)-1
loc=find(newM(:,4)==cyclic_num(i));
force_unloading=newM(loc,3);
M_unload(cyclic_num(i)+0.5,:)=force_unloading(1:num_unload)';
end


unlambda=linspace(stretch,1,num_unload);
unforce_ave=mean(M_unload);
%plot(unlambda,unforce_ave)
hold on

%% plot all curves


    figure(2)
    plot(lambda,M_load,'r-')
    hold on
    plot(unlambda,M_unload,'b-')
    hold on

   maxf=M_load(:,300);  % change based on M_load column
   Fmax_initial = maxf(2);   %initial cycle max stretch force
   Fmax_change= maxf(end) - maxf(2); % change in max stretch force
   Fmax_mean = mean(maxf(2:end)); % average max stretch force
   %Gradient_Fmax = (Fmax_change)/(fatigue_life-1);
   
   col1 = transpose(force_ave);
   col2 = transpose(lambda);
   col3 = transpose(unforce_ave);
   col4 = transpose(unlambda);
   
   Fmax_initial = maxf(2);   
   Fmax_change= maxf(end) - maxf(2);
   Fmax_mean = mean(maxf(2:end)); 
   Gradient_Fmax = (Fmax_change)/(fatigue_life-1);
   