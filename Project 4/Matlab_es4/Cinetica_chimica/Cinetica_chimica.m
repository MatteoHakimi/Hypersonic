function [ X_dot] = Cinetica_chimica (t,X )

global T_e p_e rho_e a1 a2 a3 a4 a5 a6  R

%Definizione delle variabili incognite
alpha=X(1);

%Termini equazione
kf=7e15*T_e^(-1.6)*exp(-113200/T_e);
zp=1e4/T_e;
kc=a1*exp(a2+a3*zp+a4*zp^2+a5*zp^3+a6*zp^4);
kb=kf/kc;
W_dot=rho_e*(1+alpha)^2*(kf*(1-alpha)/(1+alpha)*p_e/(R*T_e)-4*kb*((alpha*p_e)/((1+alpha)*R*T_e))^2) ;

%Equazione differenziale
alpha_dot=W_dot/rho_e;

X_dot=alpha_dot;


end

