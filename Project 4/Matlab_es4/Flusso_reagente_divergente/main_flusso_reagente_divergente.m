%Calcolo flusso reagente di miscela N e N2 in un condotto divergente



clear all
clc 

global R dh_N dh_N2 M_N M_N2 a1 a2 a3 a4 a5 a6 beta C


%Costanti di k_c(T)
a1=1e6;
a2=3.898;
a3=-12.661;
a4=0.683;
a5=-0.118;
a6=0.006;

%Costante k_f(T)
C=7e15;


%Grado di dissociazione in gola
%alpha_0=0.138496539284502;
alpha_0=0.1434;

%Parametri
R=8.314;
T0=298.15;
M_N=0.0140067;
M_N2=M_N*2;
dh_ref_N=472646/M_N;
c_p_N=5/2*R/M_N;
c_p_N2=7/2*R/M_N2;
dh_N=dh_ref_N-c_p_N*T0;
dh_N2=-c_p_N2*T0;
R_mix_0=R*(alpha_0+1)/M_N2;
beta=5;                                                %espresso in gradi



%Condizioni in gola
p_0=1.5e6;                                             %input pressione
T_0=7000;                                              %input temperatura
rho_0=p_0/(R_mix_0*T_0);
u_0=1900;


%Integrazione delle equazioni
X_0=[p_0 rho_0 u_0 T_0 alpha_0 ];                      %condizioni iniziali
x_span=0:1e-5:1;                                       %passo di integrazione
[x,X]=ode45('Flusso_reagente_divergente',x_span,X_0');

%Calcolo della R e gamma di miscela
R_mix=(X(:,5)+1)*R/M_N2;
gamma_mix=1+2*(1+X(:,5))./(X(:,5)+5);

%Calcolo del numero di Mach
M=X(:,3)./sqrt(gamma_mix.*R_mix.*X(:,4));

%Andamento p pressione
figure(1)

plot(x,X(:,1))
xlabel('x [m]')
ylabel('p [Pa]')
grid on 
title('Andamento della pressione p al variare di x')

%Andamento rho densità
figure(2)

plot(x,X(:,2))
xlabel('x [m]')
ylabel('\rho [kg/m^{3}] ')
grid on 
title('Andamento della densità \rho al variare di x')

%Andamento u velocità
figure(3)

plot(x,X(:,3))
xlabel('x [m]')
ylabel('u [m/s]')
grid on 
title('Andamento della velocità al u variare di x')

%Andamento T temperatura
figure(4)

plot(x,X(:,4))
xlabel('x [m]')
ylabel('T [K]')
grid on 
title('Andamento della temperatura T al variare di x')

%Andamento alpha grado di dissociazione
figure(5)

plot(x,X(:,5))
xlabel('x [m]')
ylabel('\alpha ')
grid on 
title('Andamento del grado di dissociazione \alpha al variare di x')

%Andamento M Mach
figure(6)

plot(x,M)
xlabel('x [m]')
ylabel('M ')
grid on 
title('Andamento del numero di Mach M al variare di x')

%Valori asintotici
alpha_eq_flux=X(end,5)
p_eq_flux=X(end,1)
T_eq_flux=X(end,4)
rho_eq_flux=X(end,2)
u_eq_flux=X(end,3)