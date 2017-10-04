%Calcolo Ogiva

x=0:1e-3:1;                              %definizione del passo di integrazione
y=0.1*x.^(3/4);                          %approssimazione polinomina ogiva



A_it=0.3795;                            %valore di A(0) da iterare        
X_0=[0.001,A_it];                       %condizioni iniziali

[x_1,X]=ode45('Ogiva',x,X_0);
format long
eps=0.1-X(end,1)                        %errore tra soluzione esatta e calcolata

%Plot
figure(1)
hold on
grid on

plot(x,y,'k--')
plot(x,X(:,1),'k')

xlabel('x/l')
ylabel('y/l')
legend('y=Cx^{3/4}','Soluzione numerica')
title('y=f(x) Ogiva')

