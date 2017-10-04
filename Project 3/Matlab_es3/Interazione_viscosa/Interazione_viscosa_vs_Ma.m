
clear all 
clc



Ma=2:0.1:20;
T_e=288;
p_e=2;
T_w=600;
mu_e=1.789*10^(-5);
mu_w=3.0156*10^-5;
C=(T_e/T_w)*(mu_w/mu_e);
R=287;
gamma=1.4;
a_e=sqrt(gamma*R*T_e);
x=zeros(length(Ma));
rho_e=p_e/(R*T_e);

for i=1:length(Ma);
u_e=Ma(i)*a_e;    
x(i)=C*Ma(i)^6*mu_e/(rho_e*u_e);
end
figure(1)
semilogx(x,Ma)
grid on
xlabel('x [m]')
ylabel('M_{\infty}')
title('Lunghezza di interazione viscosa forte al variare del M_{\infty}')

figure(2)
plot(Ma,x)
grid on
ylabel('x [m]')
xlabel('M_{\infty}')
title('Lunghezza di interazione viscosa forte al variare del M_{\infty}')
