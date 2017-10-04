%Calcolo flusso reagente su corpo tozzo in prossimità del punto di ristagno

clear all
clc

global a1 a2 a3 a4 a5 a6 R M_N M_N2 T_e h_e alpha_e alpha_w dh_N_0 T_w du_e_dx p_e


%Costanti di k_c(T)
a1=1e6;
a2=3.898;
a3=-12.661;
a4=0.683;
a5=-0.118;
a6=0.006;

%Parametri corpo
r=1;

%Condzioni sul corpo
T_w=1000;
alpha_w=0;

%Condizioni esterne strato limite
T_e=10000;
p_e=1000;
alpha_e=1;

%Parametri del gas
R=8.314;
M_N=0.0140067;
M_N2=2*M_N;
R_mix_e=alpha_e*R/M_N+(1-alpha_e)*R/M_N2;
dh_ref_N=472646/M_N;
c_p_N=5/2*R/M_N;
T0=298.15;
dh_N_0=dh_ref_N-c_p_N*T0;
Cp_e=(7+3*alpha_e)*R/(4*M_N);
Cp_w=(7+3*alpha_w)*R/(4*M_N);
h_e=(Cp_e*T_e+alpha_e*dh_N_0);
h_w=(Cp_w*T_w+alpha_w*dh_N_0);
du_e_dx=1/r*sqrt(R_mix_e*T_e);

%Condizioni iniziali
g_0=h_w/h_e;
alpha_0=alpha_w;
f_0=0;
F_0=0;
A_0=0.23017;                                               %Iterato
B_0=0.1780;                                                %Iterato
C_0=0.1812;                                                %Iterato


%Integrazione sistema di equazioni 
X_0=[f_0 F_0 g_0 alpha_0 A_0 B_0 C_0 ];                    %Condizioni iniziali
eta_span=0:0.0001:10;                                      %Passo di integrazione

[eta,X]=ode45('Flusso_reagente_punto_di_ristagno',eta_span,X_0');

%Andamento di g=h/he funzione di eta
figure(1)
plot(eta,X(:,3))
xlabel('\eta')
ylabel('h/h_{e}')
grid on
title('Andamento h/h_{e} al variare di \eta ')
axis([0 10 0 1.5])

%Andamento di F=u/ue funzione di eta
figure(2)
plot(eta,X(:,2))
xlabel('\eta')
ylabel('u/u_{e}')
grid on
title('Andamento u/u_{e} al variare di \eta ')
axis([0 10 0 1.5])

%Andamento di alpha grado di dissociazione funzione di eta
figure(3)
plot(eta,X(:,4))
xlabel('\eta')
ylabel('\alpha')
grid on
title('Andamento \alpha al variare di \eta ')
axis([0 10 0 1.5])

%Valori asintotici
format long
F_inf=X(end,2)
g_inf=X(end,3)
alpha_inf=X(end,4)