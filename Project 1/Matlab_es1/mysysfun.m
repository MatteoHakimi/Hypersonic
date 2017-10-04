function f= mysysfun(t,Y)

global rho R y g Cb1 Cb2

f=zeros(3,1);
f(1,1)=-0.5*rho*exp(-y*Y(2))*(Y(1))^2*Cb1+g*sin(Y(3));
f(2,1)=-Y(1)*sin(Y(3));
f(3,1)=-0.5*rho*exp(-y*Y(2))*(Y(1))*Cb2+(g*cos(Y(3)))/(Y(1))-(Y(1))/(R+Y(2));



end

