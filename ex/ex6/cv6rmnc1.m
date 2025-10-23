function TH = cv6rmnc1 (U,Y,P0,th0)
th = th0;
P = P0;
TH = zeros(4,length(U));
TH(:,1) = th0;
TH(:,2) = th0;

for k = 3:length(U) 
    phi = [-Y(k-1); -Y(k-2); U(k-1); U(k-2)]; %vektor regresnich prom. 
    e = Y(k)- phi'*th;
    K = (P*phi)/(1+phi'*P*phi);
    P = P - K*phi'*P;
    th = th + K*e;

    TH(:,k) = th;
end
end