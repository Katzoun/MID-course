clc, clear, close all

Ts = 0.1; 
t = 0:Ts:20000;
N = length(t);
u = idinput(N, 'prbs', [0 1],[-1,1]);

[y, gt,tt] = cviceni03_1(u,t);

M = 300;

figure(1)
plot(tt(1:M), gt(1:M))
hold on
Ruu = zeros(M,1);
Ruy = zeros(M,1);

for k = 1: M
    for i = 1: N-k
        Ruy(k) = Ruy(k) +u(i)*y(i+k-1);
        Ruu(k) = Ruu(k) +u(i)*u(i+k-1);
    end
end
Ruy = Ruy./N;
Ruu = Ruu./N;



g = Ruy/Ruu(1)/Ts
plot(t(1:M),g)

% plot(t,u,t,y)