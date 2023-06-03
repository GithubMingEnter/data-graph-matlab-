clc;
mpc_state=xlsread('ltv/Lmpc_state.csv');
pur_state=xlsread('phr/phr_nmpc_state.csv');
input_lmpc=xlsread('ltv/Lmpc_input.csv');
input_nmpc=xlsread('phr/phr_nmpc_input.csv');
% mpc_state=xlsread('mpc_state.csv');
% pur_state=xlsread('pur_state.csv');
% rl_state =xlsread('rl_state.csv');

record=520;%300 ;%
time_mpc=mpc_state(:,8);
time_pur=pur_state(:,8);

time_input_lmpc=input_lmpc(:,1);
time_input_lmpc(90:length(time_input_lmpc))=[];
time_input_nmpc=input_nmpc(:,1);
delta_input_lmpc=input_lmpc(:,3)*180/pi;
delta_input_lmpc(90:length(delta_input_lmpc))=[];

delta_input_nmpc=input_nmpc(:,3)*180/pi;



figure(1);
subplot(2,1,1);
p1=plot(time_input_lmpc,delta_input_lmpc);
p1.Color='#A2142F'
xlabel('时间(s)')
ylabel('转向角度(deg)')
legend('LMPC');
subplot(2,1,2)
p2=plot(time_input_nmpc,delta_input_nmpc);
p2.Color="#77AC30"
xlabel('时间(s)')
ylabel('转向角度(deg)')

legend('NMPC');

lateralError_mpc=mpc_state(:,2);
lateralError_pur=pur_state(:,2);
lateralError_mpc_mean=nanmean(lateralError_mpc)
lateralError_pur_mean=nanmean(lateralError_pur)
lateralError_mpc_max=max(lateralError_mpc)
lateralError_pur_max=max(lateralError_pur)
% Lateral error

figure(2);
subplot(2,1,1);
plot(time_mpc,lateralError_mpc);
hold on;
plot(time_pur,lateralError_pur);
xlabel('弧长(m)')
ylabel('横向误差(m)')

legend('LMPC','NMPC');

subplot(2,1,2);

% axis([0,18,0,20]);
% 'symbol',''   是为了取消显示异常值
% Head error
headError_mpc=mpc_state(:,5);
headError_pur=pur_state(:,5);

% figure(2);
p1=plot(time_mpc,headError_mpc);
p1.Color='#A2142F'
hold on;
p2=plot(time_pur,headError_pur);
p2.Color="#77AC30"
hold on;


xlabel('弧长(m)')
ylabel('速度(m/s)')
legend('LMPC','NMPC');






