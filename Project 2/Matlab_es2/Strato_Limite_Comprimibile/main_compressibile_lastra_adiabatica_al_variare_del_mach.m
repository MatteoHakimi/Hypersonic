global Ma gamma


a=[10:12];

for i=1:length(a);
Ma=a(i);
gamma=1.4;

g_0=(1+(gamma-1)/2*Ma^2);
H_00=2.881619038488796;
H_01=3.17;
H_02=3.48;

if i==1;
    
    H_0=H_00;
    
elseif i==2;
    
    H_0=H_01;
    
else 
    
    H_0=H_02;
    
end
   

%    f(0) g(0) F(0) G(0) H(0)

X_0=[ 0   g_0   0    0   H_0]; 

eta_v=0:0.001:10;

[eta,X]=ode45('Compressibile',eta_v',X_0);
eps=X(end,3)-1;

VD=zeros(length(eta),1);
for j=1:length(eta)
trap=trapz(eta(1:j),X(1:j,2));
VD(j)=trap*sqrt(2);
end

figure(1)
plot(X(:,3),eta')
xlabel('u/u_{e}')
ylabel('\eta')
title('Profilo di velocità')
axis([0 1.2 0 2])
legend('Ma_{\infty}=10','Ma_{\infty}=11','Ma_{\infty}=12')
grid on
hold on

figure(2)
plot(X(:,2),eta')
xlabel('T/T_{e}')
ylabel('\eta')
title('Profilo di temperatura')
axis([0 30 0 6])
legend('Ma_{\infty}=10','Ma_{\infty}=11','Ma_{\infty}=12')
grid on
hold on

figure(3)
plot(X(:,3),VD)
xlabel('u/u_{e}')
ylabel('$$\frac{y}{x}\sqrt{Re_{x}}$$','Interpreter','latex','FontSize',13')
title('Profilo di velocità')
axis([0 1.5 0 35])
legend('Ma_{\infty}=10','Ma_{\infty}=11','Ma_{\infty}=12')
grid on
hold on

figure(4)
plot(X(:,2),VD)
xlabel('T/T_{e}')
ylabel('$$\frac{y}{x}\sqrt{Re_{x}}$$','Interpreter','latex','FontSize',13')
title('Profilo di temperatura')
axis([0 30 0 35])
legend('Ma_{\infty}=10','Ma_{\infty}=11','Ma_{\infty}=12')
grid on
hold on

end

