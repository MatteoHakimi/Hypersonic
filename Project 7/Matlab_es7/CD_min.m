%Calcolo Cd totale per un velivolo ipersonico

%parametri fisici gas a quota h=40000 m scelta come quota di volo
gamma=1.4;                      %rapporto calori specifici aria
R=287;                          %costante del gas aria considerata non reagente
T_1=219.58;                     %Temperatura del fluido indisturbato  
rho_1=0.0039;                   %Densità del fluido indisturbato  
a_1=sqrt(gamma*R*T_1);          %Calcolo velocità del suono   
mu_1=1.438e-5;                  %viscosità del fluido indisturbato

%Condizioni di volo
M_1=12;                         %Mach  
u_1=M_1*a_1;                    %Velocità di volo  

%Scelta del rapporto l/s
l_s=1:1:100;

%Calcolo Cd_{p} pressione
k=M_1./(2*l_s);           
p2_p1=1+(gamma*(k.^2)).*((gamma+1)/4+(sqrt(((gamma+1)/4)^2+1./(k.^2))));
Cd_f=2*p2_p1/(gamma*M_1^2);

%Calcolo Cd_{v} viscoso
A=(4.48*sqrt(mu_1))/(sqrt(sqrt(0.1))*sqrt(rho_1*u_1));
Cd_v=A*(l_s).^(3/4);

%Calcolo del Cd totale
Cd=Cd_f+Cd_v;

%Calcolo del Cd min e l/s t.c. Cd=Cd_min
Cd_min=min(Cd);
ls_min=l_s(find(Cd==Cd_min));


%Plot
figure(1)
grid on
hold on

plot(l_s,Cd,'k')
plot(l_s,Cd_f,'k--')
plot(l_s,Cd_v,'k-.')
plot(ls_min,Cd_min,'ko')

xlabel('l/s')
ylabel('C_{D}')
legend('C_{D_{tot}}','C_{D_{p}}','C_{D_{v}}')
title('Andamento del C_{D} al variare di l/s')