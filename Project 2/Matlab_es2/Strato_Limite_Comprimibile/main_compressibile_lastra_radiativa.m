global Ma gamma
Ma=10;
gamma=1.4;
rho_e=1.3*10^(-3);
mu_e=1.7*10^(-5);
a_e=347;
u_e=Ma*a_e;
eps=0.8;
sigma=5.67*10^(-8);
T_e=299.67;
R=287;
p_e=rho_e*R*T_e;

l=1;

g_0=2.19915;% assegnare
Re_x=rho_e*u_e*l/mu_e;
A=1/sqrt(2)*gamma/(gamma-1)*Ma*a_e*p_e/(eps*sigma*T_e^4*sqrt(Re_x));
G_0=g_0*(g_0^4-1)/A;
H_0=2/((gamma-1)*Ma^2)*G_0;   

%    f(0) g(0) F(0) G(0) H(0)

X_0=[ 0   g_0   0    G_0   H_0]; 

eta_v=0:0.001:10;

[eta,X]=ode45('Compressibile',eta_v',X_0);
eps_1=X(end,2)-1
eps_2=X(end,3)-1


figure(1)
plot(X(:,3),eta')
xlabel('u/u_{e}')
ylabel('\eta')
title('Profilo di velocità')
axis([0 1.2 0 10])
grid on
hold on

figure(2)
plot(X(:,2),eta')
xlabel('T/T_{e}')
ylabel('\eta')
title('Profilo di temperatura')
axis([0 8 0 6])
grid on
hold on


