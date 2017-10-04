function [X_prime] = Compressibile(eta,X )

global Ma gamma

f=X(1);
g=X(2);
F=X(3);
G=X(4);
H=X(5);

f_prime=F;
g_prime=G;
F_prime=H;
G_prime=G^2/g-f*g*G-(gamma-1)*Ma^2*H^2;
H_prime=G*H/g-f*H*g;


X_prime=[f_prime g_prime F_prime G_prime H_prime]';

end

