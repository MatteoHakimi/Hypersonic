function [X_prime ] = Flusso_reagente_divergente( x,X )

global R dh_N dh_N2 M_N M_N2 a1 a2 a3 a4 a5 a6 beta C

%Definizione delle variabili incognite
p=X(1);
rho=X(2);
u=X(3);
T=X(4);
alpha=X(5);

%Area dunzione di x dell'ugello  
R_x=0.03+x*tan(beta*pi/180);
A=pi*R_x^2;
A_prime=2*pi*R_x*tan(beta*pi/180);

%Termini equazione
b1=-rho*u/A*A_prime;
kf=C*T^(-1.6)*exp(-113200/T);
zp=1e4/T;
kc=a1*exp(a2+a3*zp+a4*zp^2+a5*zp^3+a6*zp^4);
kb=kf/kc;
W_dot=rho*(1+alpha)^2*(kf*(1-alpha)/(1+alpha)*p/(R*T)-4*kb*((alpha*p)/(((1+alpha)*R*T)))^2);

%Sistema di equazioni differenziali
p_prime=(((2*(alpha+1)/(3*alpha+7))*(3/4*R*T/M_N+dh_N-dh_N2)-R*T/M_N2)*W_dot/u-(p/rho*b1/u))/(2*(alpha+1)/(3*alpha+7)+p/(rho*u^2)-1);
rho_prime=p_prime/u^2+b1/u;
u_prime=-p_prime/(rho*u);
T_prime=2*T/p*(alpha+1)/(3*alpha+7)*p_prime-(3/4*R*T/M_N+dh_N-dh_N2)*W_dot/u*(2*T*(alpha+1)/(p*(3*alpha+7)));
alpha_prime=W_dot/(rho*u);

X_prime=[p_prime rho_prime u_prime T_prime alpha_prime]';




end

