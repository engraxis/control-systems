close all;clear all;clc;
% DC Motor Speed Control using PID Controller

% DC Motor Transfer Function
Ra = 0.5;
La = 1.5*10^-3;
Kt = 0.05;
Jm = 0.00025;
Bm = 0.0001;
Kb = 0.05;

J = Jm;
B = Bm;

% Open Loop 
% Motor_OL_TF_w_v = tf([Kt/(J*La)],[1 (Ra/La)+(B/J) ((B*Ra)/(J*La))+((Kt*Kb)/(J*La))]);
Motor_OL_TF_w_v = tf([Kt],[La*J Ra*J+La*B Ra*B+Kt*Kb])
figure; pzmap(Motor_OL_TF_w_v);
figure; rlocus(Motor_OL_TF_w_v);
figure; bode(Motor_OL_TF_w_v); margin(Motor_OL_TF_w_v); grid on;
figure; step(Motor_OL_TF_w_v); stepinfo(Motor_OL_TF_w_v); grid on;
ess_OL = Kt/(Ra*B+Kt*Kb);

% Closed Loop without PID Controller and Unity Feedback
Motor_CL_TF_w_v = feedback(Motor_OL_TF_w_v,1)
figure; pzmap(Motor_CL_TF_w_v);
figure; rlocus(Motor_CL_TF_w_v);
figure; bode(Motor_CL_TF_w_v); margin(Motor_CL_TF_w_v); grid on;
figure; step(Motor_CL_TF_w_v); stepinfo(Motor_CL_TF_w_v)

% Lead-Lag Compensator
s = tf('s')
M_TF = Km/(s+)

-((B^2*La^2 - 2*B*J*La*Ra + J^2*Ra^2 - 4*Kb*Kt*J*La)^(1/2) + B*La + J*Ra)/(2*J*La)



s=tf('s')
g = 10/(s*(s+1)*(s+5))