clc, clear, close all

Ts = 0.1; 
t = 0:Ts:30;
u = ones(size(t));
y = cviceni02_2(u,t);
tol = 1e-5
figure(1)
plot(t,y)
hold on
%% linearni sys
%vstup vynasobime napr 1000x a dostanu 10 vetsi vystup ale sum by se nemel
%zvetsit, nezavisi na vstupu

u_ex = 1000*u; 
y_ex = cviceni02_2(u_ex,t)./1000;
plot(t,y_ex)


K = mean(y_ex(end-2:end));
I = find(y_ex > tol,1);

d = (y_ex(I+3)-y_ex(I))/(Ts*3);
T = K/d;
Td = (I-2)*Ts

disp('Identifikovany prenos')
p = tf('p'); 
F = K / (T*p + 1) * exp(-Td*p)

yv =lsim(F,u,t);
plot(t,yv)

%% casove invariantni sys

%podivat se na reseni
%vpodstate se to dela tak ze si ve foru 100x vypocitam prubeh odezvy
%systemu a jednotlive prvky odezev zprumeruju 

