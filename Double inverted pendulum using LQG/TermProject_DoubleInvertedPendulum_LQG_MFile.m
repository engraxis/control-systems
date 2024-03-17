clear all;
close all;
clc;

%% Double Inverted Pendulum System Model 
disp('Original System SSM using Langrangian Method');
disp('         x_dot = A x + B u      ');
disp('             y = C x + D u      ');
a = [ 0       1       0       0       0       0         ;
      0       0      -2.0495  0      -0.5813  0         ;
      0       0       0       1       0       0         ;
      0       0       46      0      -6.6086  0         ;
      0       0       0       0       0       1         ;
      0       0      -35.68   0       41.20   0      ]  ;
b = [ 0       0.8459  0      -2.5204  0      -0.2998 ]' ;
c = [ 1       0       0       0       0       0         ;
      0       0       1       0       0       0         ;
      0       0       0       0       1       0      ]  ;
d = zeros(3,1);
[n, m] = size(b)
Q = diag([10   0       10       0       10       0])
R = eye(m)
Kr = lqr(a, b, Q, R)
Bnoise = eye(n)
W = eye(n)
V = 0.01 * eye(3)
Estss = ss(a, [b Bnoise], c, zeros(3, 7))   % State space model of system with noise
[Kess, Ke] = kalman(Estss, W, V)            % Kalman Gain

%% References
