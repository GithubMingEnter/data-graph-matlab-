clc;
% mpc_state=xlsread('data2/mpc_state.csv');
% pur_state=xlsread('data2/pur_state.csv');
% rl_state =xlsread('data2/rl11/rl2_state.csv');
% mpc_state=xlsread('data2/New_Folder/mpc2_state.csv');
% pur_state=xlsread('data2/New_Folder/pur2_state.csv');
% rl_state =xlsread('data2/rl13/rl2_state.csv');
%第一条轨迹
mpc_state=xlsread('mpc_state.csv');
pur_state=xlsread('pur_state.csv');
rl_state =xlsread('data1/rl_state.csv');

record=300;%520;%
time_mpc=mpc_state(:,1);
time_pur=pur_state(:,1);
time_rl=rl_state(:,1);

s_mpc=mpc_state(:,8);
s_pur=pur_state(:,8);
s_rl=rl_state(:,8);

lateralError_mpc=mpc_state(:,2);
lateralError_pur=pur_state(:,2);
lateralError_rl=rl_state(:,2);

lang=2; %1中文

% Lateral error

figure(1);
% subplot(1,2,1);
plot(s_mpc,lateralError_mpc);
hold on;
plot(s_pur,lateralError_pur);
hold on;
plot(s_rl,lateralError_rl);
% 
% 
xlabel('Arc length(m)')
ylabel('Lateral error(m)')

legend('MPC','Pure Pursuit','Ours');
% 
figure(2);
% subplot(1,2,2);
mean_lateralError_pur=roundn(nanmean(lateralError_pur),-4); % 专门针对有nan的数据求平均值的函数
mean_lateralError_mpc=roundn(nanmean(lateralError_mpc),-4);
mean_lateralError_rl=roundn(nanmean(lateralError_rl),-4);
maxlength=max(max(length(lateralError_mpc),length(lateralError_pur)),length(lateralError_pur))

lateralError_mpc(record:length(lateralError_mpc))=[];
lateralError_pur(record:length(lateralError_pur))=[]; %为了拼接，删除向量元素
lateralError_rl(record:length(lateralError_rl))=[];


boxplot([lateralError_mpc,lateralError_pur,lateralError_rl],'Labels',{'MPC','Pure Pursuit','Ours'});
ylabel('Lateral error(m)','FontName','Times New Roman','FontSize',14);
if lang==1
    ylabel('横向误差(m)','FontSize',14);
end
hold on
plot([mean_lateralError_mpc,mean_lateralError_pur,mean_lateralError_rl],'o');
text(1,mean_lateralError_mpc,strcat(' \leftarrow ', num2str(mean_lateralError_mpc)));
text(2,mean_lateralError_pur,strcat(' \leftarrow ', num2str(mean_lateralError_pur)));
text(3,mean_lateralError_rl,strcat(' \leftarrow ', num2str(mean_lateralError_rl)));

% legend('Mean error','FontName','Times New Roman','FontSize',14,'LineWidth',1);

if lang==1
    legend('平均误差','FontSize',14,'LineWidth',1);
else
    legend('Mean error','FontName','Times New Roman','FontSize',14,'LineWidth',1);
end


% axis([0,18,0,20]);
% 'symbol',''   是为了取消显示异常值
% Head error
headError_mpc=mpc_state(:,3);
headError_pur=pur_state(:,3);
headError_rl=rl_state(:,3);

figure(3);

p1=plot(s_mpc,headError_mpc);
p1.Color='#A2142F'
hold on;
p2=plot(s_pur,headError_pur);
p2.Color="#77AC30"
hold on;
p3=plot(s_rl,headError_rl);
p3.Color="#0072BD"

xlabel('Arc length(m)');
ylabel('Heading error(deg)');
legend('MPC','Pure Pursuit','Ours');
figure(4);
headError_mpc(record:length(headError_mpc))=[];
headError_pur(record:length(headError_pur))=[]; %为了拼接，删除向量元素
headError_rl(record:length(headError_rl))=[];

mean_headError_mpc=roundn(nanmean(headError_mpc),-4); % 专门针对有nan的数据求平均值的函数
mean_headError_pur=roundn(nanmean(headError_pur),-4);
mean_headError_rl=roundn(nanmean(headError_rl),-4);
boxplot([headError_mpc,headError_pur,headError_rl],'Labels',{'MPC','Pure Pursuit','Ours'});
% ylabel('Heading error(deg)','FontName','Times New Roman','FontSize',14);
if lang==1
    ylabel('航向误差(deg)','FontSize',14);
else
    ylabel('Heading error(deg)','FontName','Times New Roman','FontSize',14);
end

hold on
plot([mean_headError_mpc,mean_headError_pur,mean_headError_rl],'o');
text(1,mean_headError_mpc,strcat(' \leftarrow ', num2str(mean_headError_mpc)));
text(2,mean_headError_pur,strcat(' \leftarrow ', num2str(mean_headError_pur)));
text(3,mean_headError_rl,strcat(' \leftarrow ', num2str(mean_headError_rl)));
if lang==1
    legend('平均误差','FontSize',14,'LineWidth',1);
else
    legend('Mean error','FontName','Times New Roman','FontSize',14,'LineWidth',1);
end
% 'symbol',''   是为了取消显示异常值
% angular
angular_mpc=mpc_state(:,4);
angular_pur=pur_state(:,4);
angular_rl=rl_state(:,4);
figure(5);
p31=plot(time_mpc,angular_mpc);
p31.Color='#A2142F'
hold on;
p32=plot(time_pur,angular_pur);
p32.Color="#77AC30"
hold on;
p33=plot(time_rl,angular_rl);
p33.Color="#0072BD"

xlabel('Time(s)')
ylabel('Yaw angular(deg)')

legend('MPC','Pure Pursuit','Ours','FontName','Times New Roman','FontSize',14,'LineWidth',1);




