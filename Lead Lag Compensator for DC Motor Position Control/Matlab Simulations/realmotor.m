close all;clear all;clc;
% DC Motor Speed Control using PID Controller

% DC Motor Parameters
Ra = 0.46;
La = 2.87*10^-3;
Kt = 3.382;
Jm = 0.633;
Bm = 0.0538;
Kb = 3.13;

J = Jm;
B = Bm;
 
Motor_OL_TF_w_v = tf([Kt],[La*J Ra*J+La*B Ra*B+Kt*Kb]) %Open Loop w/v Transfer Function
bode(Motor_OL_TF_w_v); margin(Motor_OL_TF_w_v); step(Motor_OL_TF_w_v); stepinfo(Motor_OL_TF_w_v); pzmap(Motor_OL_TF_w_v)
Motor_CL_TF_w_v = feedback(Motor_OL_TF_w_v,1)
pzmap(Motor_CL_TF_w_v)
figure; step(Motor_CL_TF_w_v)                          %Step Response of w/V Close Loop Transfer Function
stepinfo(Motor_CL_TF_w_v)

s = tf('s');
Lead_Lag = 168.28*((s+103)/(s+790))*((s+85.478)/(s+56.608))
series = series(Motor_OL_TF_w_v,Lead_Lag)
CompensatedSystem = feedback(series,1)
step(CompensatedSystem)
stepinfo(CompensatedSystem)
pzmap(CompensatedSystem)


bode(CompensatedSystem)
margin(CompensatedSystem)
bandwidth(CompensatedSystem)