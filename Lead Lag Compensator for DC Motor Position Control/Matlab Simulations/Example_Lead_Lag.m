clear all;clc;
% Example 6-8

% G 
s = tf('s');
G_OL = 4/(s*(s+0.5));
G_CL = feedback(G_OL,1);

% Response for Unit Ramp
G_CL_R_IP = series(G_CL,1/s);
t = 0:0.1:10;
SR = step(G_CL_R_IP,t);
figure; plot(t,SR); grid on;
hold on; line([0 10],[0 10]);

% Response for Unit Step I/P
figure; 
; grid on;
hold on; line([0 25],[1 1]);

motor = 0.0417/(s+1.667)





s = tf('s');
g = 25.04*(s+0.2)/(s*(s+5.02)*(s+0.01247))
gfb = feedback(g,1)
step(gfb)