H=0.469774011299435;
X_0=[0,0,H];
eta_v=0:0.01:10;
[eta,X]=ode45('Blasius',eta_v,X_0);
eps=X(end,2)-1
plot(X(:,2),eta)
axis([0 1.5 0 6])
xlabel('u/u_{e}')
ylabel('\eta')
grid on
title('Profilo di velocità Blasius')

%H1=1      eps=0.655
%H2=0.5    eps=0.0428
%H3=0.45   eps=-0.0280
%Hint=0.4698 esp=2.95e-4