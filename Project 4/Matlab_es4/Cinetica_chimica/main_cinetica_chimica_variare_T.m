%Calcolo dell'andamento temporale del grado di dissociazione alpha al variare
%della temperatura T a pressione fissata p reazione di dissociazione N2 N
 

clear all
clc

global T_e p_e rho_e a1 a2 a3 a4 a5 a6 R

T_it=7000:1000:9000;

for i=1:length(T_it)
 
%Parametri di miscela
alpha_0=0;
R=8.314;
M_N=0.014067;
M_N2=2*M_N;
R_N2=alpha_0*R/M_N+(1-alpha_0)*R/M_N2;

%Temperatura e pressione 
T_e=T_it(i);
p_e=10^5;
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
xlabel('t [s]')
ylabel('\alpha')
grid on
hold on
legendInfo{i} = ['T_{0} = ' num2str(T_it(i)) 'K'];
legend(legendInfo,'southwest')
end