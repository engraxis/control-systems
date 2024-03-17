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
 
Motor_OL_TF_w_v = tf([Kt],[La*J Ra*J+La*B Ra*B+Kt*Kb]) %Open Loop w/v Transfer Function 
Motor_CL_TF_w_v = feedback(Motor_OL_TF_w_v,1)          %w/V Close Loop Transfer Function with Unity Feedback 
figure; pzmap(Motor_CL_TF_w_v)                         %pz-map of w/V Close Loop Transfer Function
figure; step(Motor_CL_TF_w_v)                          %Step Response of w/V Close Loop Transfer Function
stepinfo(Motor_CL_TF_w_v)                               
bode(Motor_CL_TF_w_v); grid on;
margin(Motor_CL_TF_w_v);
bandwidth(Motor_CL_TF_w_v)

s = tf('s')                                            %Lead-Lag Compensator
Lead_Lag = 3.6*((s+312)/(s+990))*((s+87.72)/(s+78.11))

%Result
forward = series(Motor_OL_TF_w_v,Lead_Lag)          % Forward Path of Closed Loop System with Lead-Lag Compensator
clsystem = feedback(forward,1)                      % Closed Loop System with Unity Feedback
pzmap(clsystem);                                    % PZ-Map of Closed Loop System with Unity Feedback
figure; step(clsystem)                              % Step Response
stepinfo(clsystem)

bode(Lead_Lag); hold on;
bode(Motor_OL_TF_w_v)
bode(clsystem)