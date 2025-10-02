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
d = (y(2)-y(1))/Ts;
T = K/d;

disp('Identifikovany prenos')
p = tf('p'); 
F = K / (T*p + 1);

% ted zkusime odezvu naseho identifikovaneho sys
h = K*(1-exp(-t/T));
plot(t,h)

% jeste jina varianta
yv =lsim(F,u,t);
plot(t,yv)

legend('vystup systemu', 'vystup ident sys', 'vystup z lsim')
xlabel('t')
ylabel('y')
