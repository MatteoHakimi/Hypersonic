global Ma gamma

Ma=10;
gamma=1.4;

g_0=(1+(gamma-1)/2*Ma^2);
H_0=2.881619038488796;

%    f(0) g(0) F(0) G(0) H(0)

X_0=[ 0   g_0   0    0   H_0]; 

eta_v=0:0.001:10;

[eta,X]=ode45('Compressibile',eta_v',X_0);
eps=X(end,3)-1;


figure(1)
plot(X(:,3),eta')
xlabel('u/u_{e}')
ylabel('\eta')
title('Profilo di velocit�')
axis([0 1.5 0 6])
grid on

figure(2)
plot(X(:,2),eta')
xlabel('T/T_{e}')
ylabel('\eta')
title('Profilo di temperatura')
axis([0 22 0 6])
grid on

