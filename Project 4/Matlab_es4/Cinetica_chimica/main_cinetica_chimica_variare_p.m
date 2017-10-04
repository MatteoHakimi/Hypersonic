%Calcolo dell'andamento temporale del grado di dissociazione alpha al variare
%della pressione p a temperatura fissata T reazione di dissociazione N2 N
 

clear all
clc

global T_e p_e rho_e a1 a2 a3 a4 a5 a6 R

p_it=0.25e5:0.25e5:1e5;

for i=1:length(p_it)
 
%Parametri di miscela
alpha_0=0;
R=8.314;
M_N=0.014067;
M_N2=2*M_N;
R_N2=alpha_0*R/M_N+(1-alpha_0)*R/M_N2;

%Temperatura e pressione 
T_e=9000;
p_e=p_it(i);
rho_e=p_e/(R_N2*T_e);

%Costanti kc
a1=1e6;
a2=3.898;
a3=-12.661;
a4=0.683;
a5=-0.118;
a6=0.006;

%Integrazione sistema di equazioni 
X_0=alpha_0;                                     %condizione iniziale
t_span=0:1e-6:2e-3;                              %passo di integrazione
[t,X]=ode45('Cinetica_chimica',t_span,X_0);

%Andamento del grado di dissociazione funzione del tempo
figure(1)
plot(t,X)
title('Andamento del grado funzione del tempo, al variare della pressione p')
xlabel('t [s]')
ylabel('\alpha')
grid on
hold on
legendInfo{i} = ['p_{0} = ' num2str(p_it(i)) 'Pa'];
legend(legendInfo,'southwest')
end