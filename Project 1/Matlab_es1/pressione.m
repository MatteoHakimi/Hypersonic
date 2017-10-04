function [P02] = pressione(P01,M)
k=length(P01);
for i=1:k;
    if M(i)>1;
        P02(i)=P01(i)*(1+7/6*(M(i)^2-1))^(-2.5)*(2.4*M(i)^2/(0.4*M(i)^2+2))^(3.5);
    else
        P02(i)=P01(i);
    end
end    
P02=P02';
end

