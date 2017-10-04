clc 
clear all



global rho R y g Cb1 Cb2

rho=1.22;
R=6371000;
y=1/8500;
g=9.81;
Cb1=1/276;
Cb2=1/431;%da cambiare (0 1/431)
theta=5.89;
theta1=theta*pi/180;
V=7400;
l=3.9;
mu=1.8e-5;
T=288;
a=sqrt(1.4*287*T);
r=4.69;
eps=0.8;
sigma=5.67e-8;
P0=101000;
%tempi per Cb2=0 t=350 Cb2=1/431 t=950

Legend=cell(length(V),1);
for i=1:length(V);
[tv,Y]=ode45('mysysfun',[0,950],[V(i),120000,theta1]);
D=-0.5*rho*exp(-y*Y(:,2)).*(Y(:,1)).^2*Cb1+g*sin(Y(:,3));
Re=(rho*exp(-y*Y(:,2)).*(Y(:,1))*l)/mu;
Ma=Y(:,1)/a;
T0=T*(1+0.2*Ma.^2);
Pstat=P0*exp(-y*Y(:,2));
Ptot=Pstat.*(1+0.2*Ma.^2).^(3.5);
Pristurto=pressione(Ptot,Ma);
qc=0.01113*sqrt(Pristurto/(10^5*r)).*(Y(:,1)).^2;
Tw=(qc/(eps*sigma)).^(1/4);
figure(1)
plot(Y(:,1)/1000,Y(:,2)/1000);
hold on
grid on
ylabel('h [km] ')
xlabel('V [km/s]')
title('Traiettoria')
figure(2)
semilogx(Re,Y(:,2)/1000)
grid on
xlabel('Re ')
ylabel('h [km]')
title('Numero di Reynolds Re funzione della quota')
figure(3)
plot(T0,Y(:,2)/1000)
grid on
xlabel('T_{0} [K] ')
ylabel('h [km]')
title('Temperatura totale T_{tot} funzione della quota')
figure(4)
semilogx(Pstat,Y(:,2)/1000,'b')
hold on
semilogx(Ptot,Y(:,2)/1000,'r')
hold on
semilogx(Pristurto,Y(:,2)/1000,'g')
grid on
xlabel('P [Pa] ')
ylabel('h [km]')
title('Pressione P funzione della quota')
legend('P_{stat}','P_{tot}','P_{02}')
figure(5)
plot(Tw,Y(:,2)/1000)
grid on
xlabel('T_{w} [K] ')
ylabel('h [km]')
title('Temperatura di parete T_{w} funzione della quota')
figure(6)
plot(Y(:,2)/1000,abs(D)/g)
grid on
ylabel('n_{x}')
xlabel('h [km]')
title('Fattore di carico n_{x} funzione della quota')
figure(7)
plot(tv,abs(D)/g)
grid on
ylabel('n_{x}')
xlabel('t [s]')
title('Fattore di carico n_{x} funzione del tempo')



Legend{i}=strcat('V_{0}=', num2str(V(i)/1000),'km/s');

end
 legend(Legend);
 title('Fattore di carico n_{x} al variare della velocità di rientro V_{0}')
