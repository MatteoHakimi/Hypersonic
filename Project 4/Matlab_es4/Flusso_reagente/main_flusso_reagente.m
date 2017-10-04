%Calcolo flusso reagente di miscela N e N2

clear all
clc 

global R dh_N dh_N2 M_N M_N2 a1 a2 a3 a4 a5 a6


%Costanti di k_c(T)
a1=1e6;
a2=3.898;
a3=-12.661;
a4=0.683;
a5=-0.118;
a6=0.006;


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
gamma=1.4;
delta=(gamma-1)/2;

%Condizioni a monte dell'urto

M_1=25;
T_1=200;
p_1=2;
R_N2=R/M_N2;
rho_1=p_1/(R_N2*T_1);

%Condizioni a valle dell'urto

M_2=sqrt((1+delta*M_1^2)/(gamma*M_1^2-delta));
rho_2=rho_1*((gamma+1)*M_1^2)/(2+(gamma-1)*M_1^2);
p_2=p_1*(1+(2*gamma/(gamma+1))*(M_1^2-1));
T_2=T_1*((2*gamma/(gamma+1))*M_1^2-(gamma-1)/(gamma+1))*(2/((gamma+1)*M_1^2)+(gamma-1)/(gamma+1));
a_2_s=sqrt(gamma*R_N2*T_2);
u_2=M_2*a_2_s;
alpha_0=0;

%Integrazione delle equazioni
X_0=[p_2 rho_2 u_2 T_2 alpha_0 ];
x_span=0:1e-3:100;
[x,X]=ode45('Flusso_reagente',x_span,X_0');

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
title('Andamento della velocità u al variare di x')

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




%Valori asintotici
format long
alpha_eq_flux=X(end,5)
p_eq_flux=X(end,1)
T_eq_flux=X(end,4)
rho_eq_flux=X(end,2)
u_eq_flux=X(end,3)