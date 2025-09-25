clc, clear, close all

Ts = 0.1; 
t = 0:Ts:30;
u = ones(size(t));
y = cviceni02_2(u,t);

figure(1)
plot(t,y)
