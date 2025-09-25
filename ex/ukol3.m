clc, clear, close all

Ts = 0.1; 
t = 0:Ts:60;
u = ones(size(t));
y = cviceni02_3(u,t);


Ks = y(end) - y(1); 
y = y - y(1);
yn = y/Ks;

figure(1)
hold on
plot(t,y)
plot(t,yn)

[d, I] = max(diff(yn)/Ts);
yi = yn(I);
ti = t(I);

Tu = ti - yi/d;
Tn = 1/d; 

tau = Tu/Tn;

I = find(yn>0.72,1);
t1 = t(I);
T12 = t1/1.2564;
t2 = 0.3574*T12;
I = find(t>t2,1);
y2 = yn(I); 

tau2 = 0.2639 %podle y2 z tabulky

T1 = T12 / (1+tau2);
T2 = T12 - T1; 

disp('Identifikovany prenos')
p = tf('p'); 
F = Ks / ( (T1*p + 1) * (T2*p + 1) )

yv =lsim(F,u,t);
plot(t,yv)

