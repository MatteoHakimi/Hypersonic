H_0=0.284;
G_0=0.130;

%    f(0) g(0) F(0) G(0) H(0)

X_0=[ 0   0.238   0    G_0   H_0]; 

eta_v=0:0.0001:5;

[eta,X]=ode45('punto_di_ristagno',eta_v',X_0);
eps=X(end,3)-1
eps=X(end,2)-1


figure(1)
plot(X(:,3),eta')
xlabel('u/u_{e}')
ylabel('\eta')
title('Profilo di velocità')
axis([0 1.5 0 5])
grid on

figure(2)
plot(X(:,2),eta')
xlabel('T/T_{e}')
ylabel('\eta')
title('Profilo di temperatura')
axis([0 2 0 5])
grid on
