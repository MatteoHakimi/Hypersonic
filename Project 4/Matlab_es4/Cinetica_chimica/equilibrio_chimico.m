%Calcolo del grado di dissociazione di equilibrio alpha_eq



%coefficienti per il calcolo di Kc

a1=1e6;
a2=3.898;
a3=-12.661;
a4=0.683;
a5=-0.118;
a6=0.006;

%variabili di stato all'equilibrio

T_e=9000;
p_e=1e5;


zp=10000/T_e;

%costante universale
R_u=8.314;

%calcolo del Kc
K_ce=a1*exp(a2+a3*zp+a4*zp^2+a5*zp^3+a6*zp^4);

%calcolo del grado di dissociazione all'equilibrio

alpha_eq=sqrt((K_ce*R_u*T_e)/(4*p_e+K_ce*R_u*T_e));