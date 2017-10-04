function [X_prime] = Ogiva(x_1,X )

%definizione delle variabili di integrazione
y=X(1);
A=X(2);

%sistema di equazioni differenziali
y_prime=A;
A_prime=A^2*(1+A^2)/(y*(A^2-3));

X_prime=[y_prime A_prime]';

end
