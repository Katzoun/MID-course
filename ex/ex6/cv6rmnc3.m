function [TH, lbd] = cv6rmnc3 (U,Y,P0,th0,lbd0)
lbd = lbd0;
th = th0;
P = P0;
TH = zeros(4,length(U));
TH(:,1) = th0;
TH(:,2) = th0;

for k = 3:length(U)
    if abs(U(k) - U(k-1))> 10
        lbd = 0.95;
    end
    
%     lbd = 0.99*lbd+0.01;

    phi = [-Y(k-1); -Y(k-2); U(k-1); U(k-2)]; %vektor regresnich prom. 
    e = Y(k)- phi'*th;
    K = (P*phi)/(lbd*1+phi'*P*phi);
    P = (P - K*phi'*P)/lbd;
    th = th + K*e;

    TH(:,k) = th;
    lbd = 0.99*lbd+0.01;

end
end