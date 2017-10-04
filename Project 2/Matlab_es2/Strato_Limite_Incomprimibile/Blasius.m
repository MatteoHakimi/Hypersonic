function [X_prime] = Blasius(eta,X )

X_prime(1,1)=X(2);
X_prime(2,1)=X(3);
X_prime(3,1)=-X(1)*X(3);

end

