clear all 
clc



Ma=12;
T_e=288;
p_e=1:100:10^5;
T_w=600;
mu_e=1.789*10^(-5);
mu_w=3.0156*10^-5;
C=(T_e/T_w)*(mu_w/mu_e);
R=287;
gamma=1.4;
a_e=sqrt(gamma*R*T_e);
x=zeros(length(p_e));
u_e=Ma*a_e;
for i=1:length(p_e);
rho_e=p_e(i)/(R*T_e);  
x(i)=C*Ma^6*mu_e/(rho_e*u_e);
end


figure(1)
loglog(x,p_e)
grid on
xlabel('x [m]')
ylabel('p_{\infty}')
title('Lunghezza di interazione viscosa forte al variare del p_{\infty}')

figure(2)
plot(p_e,x)
grid on
ylabel('x [m]')
xlabel('p_{\infty}')
title('Lunghezza di interazione viscosa forte al variare del p_{\infty}')
