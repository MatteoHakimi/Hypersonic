function [ X_prime ] = Flusso_reagente_punto_di_ristagno( eta,X )

global a1 a2 a3 a4 a5 a6 R M_N M_N2 T_e h_e alpha_e alpha_w dh_N_0 T_w du_e_dx p_e

%Definizione delle variabili incognite
f=X(1);
F=X(2);
g=X(3);
alpha=X(4);
A=X(5);
B=X(6);
C=X(7);

%Termini equazione
Cp=alpha*(5/2)*R/M_N+(1-alpha)*(7/2)*R/M_N2;
theta=(g*h_e-alpha*dh_N_0)/(Cp*T_e);
p=p_e;
T=theta*T_e;
rho_e_su_rho=(1+alpha)/(1+alpha_e)*theta;
l=((1+alpha_w)/(1+alpha))*(T_w/T_e)/theta;

kf=7e15*T^(-1.6)*exp(-113200/T);
zp=1e4/T;
kc=a1*exp(a2+a3*zp+a4*zp^2+a5*zp^3+a6*zp^4);
kb=kf/kc;
W_dot=(1+alpha)^2*(kf*(1-alpha)/(1+alpha)*p/(R*T)-4*kb*((alpha*p)/(((1+alpha)*R*T)))^2);

b1=-0.5*rho_e_su_rho;
b3=W_dot/(2*du_e_dx);

%Sistema di equazioni
f_prime=F;
F_prime=A/l;
g_prime=B/l;
alpha_prime=C/l;
A_prime=-f*A/l+0.5*F^2+b1;
B_prime=-f*B/l;
C_prime=-f*C/l+b3;

X_prime=[f_prime F_prime g_prime alpha_prime A_prime B_prime C_prime]';












end
