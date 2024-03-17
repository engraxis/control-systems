
% only motor
EstimatedModel = tf([8*256],[1 2*1.1*16 256]);
feed_motor=feedback(EstimatedModel,1);
figure(1); title('Open loop motor');bode(feed_motor); 
figure(2); step(feed_motor); stepinfo(feed_motor)

% Lead_Lag
s=tf('s');
Lead_Lag = ( 43.73*(s+25)*(s+29.67) ) /( (s+583.75)*(s+17.68) );

% Open loop system of motor with Lead_Lag
com_motor=series(EstimatedModel,Lead_Lag);

% Feedback system of motor with Lead_Lag
closed=feedback(com_motor,1);
figure(3); bode(closed);
figure(4); step(closed); stepinfo(closed)

figure(5); rlocus(feed_motor);
figure(6); rlocus(closed); 