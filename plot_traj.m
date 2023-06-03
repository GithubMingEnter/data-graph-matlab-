clear all;
clc;
mpc_xy=xlsread('data2/New_Folder/mpc2_trajectory.csv');
pure_xy=xlsread('data2/New_Folder/pur2_trajectory.csv');
rl_xy=xlsread('data2/rl11/rl2_trajectory.csv');
% mpc_xy=xlsread('mpc_trajectory.csv');
% pure_xy=xlsread('pur_trajectory.csv');
% rl_xy=xlsread('data1/rl_trajectory.csv');

ref_x=rl_xy(:,1);
ref_y=rl_xy(:,2);
% MPC
x=mpc_xy(:,3);
y=mpc_xy(:,4);
pur_x=pure_xy(:,3);
pur_y=pure_xy(:,4);
rl_x=rl_xy(:,3);
rl_y=rl_xy(:,4);

plot(ref_x,ref_y,'k');
hold on;
plot(x,y,'r');
hold on;
plot(pur_x,pur_y,'g');
hold on;
plot(rl_x,rl_y,'m-.');

xlabel('X(m)','FontName','Times New Roman','FontSize',14);
ylabel('Y(m)','FontName','Times New Roman','FontSize',14);
% axis([-1 15 -1 20 ])
% axis equal  % 坐标轴等间距

% set (gca,'position',[0.1,0.1,0.8,0.8] )

legend('Reference Path','MPC','Pure Pursuit','Ours','Orientation','horizontal','FontName','Times New Roman','FontSize',14,'LineWidth',1);
zp = BaseZoom();
zp.plot;
zp.plot;

% axis([0,18,0,20]);




