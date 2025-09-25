clc, clear, close all

Ts = 0.01
t = 0:Ts:10;
u = ones(size(t));


y = cviceni02_1(u,t);

%odkomenovat pro dopravni zpozdeni
y = [0;0;0;0;0;y];
t = 0:Ts:10.05;
u = ones(size(t));

figure(1);
plot(t,y);
hold on

K = mean(y(end-2:end));
I = find(y > 0,1);

d = (y(I)-y(I-1))/Ts;
T = K/d;
Td = (I-2)*Ts

disp('Identifikovany prenos')
p = tf('p'); 
F = K / (T*p + 1) * exp(-Td*p);

% ted zkusime odezvu naseho identifikovaneho sys

% jeste jina varianta
yv =lsim(F,u,t);
plot(t,yv)

legend('vystup systemu', 'vystup z lsim')
xlabel('t')
ylabel('y')
