// Regelungstechnik Versuch 3


s = poly(0, 's');

Kpid = 1;
s1   = -0.2974;
s2   = -2.6652;
p    =         // Realisierbarkeitspol
T    = 1/-p;
Ti   = -(s1+s2)/s1*s2;
Td   = 1/-(s1+s2);

K = Kpid * (1/1+T*s)*(1/Ti)*(1/s)*(s^2*Td*Ti+1);

//Nullstellen von K
x = [pol(3);pol(4)]

//Parameter von K
T = 2;
Td = (x(2)-x(1))/(x(1)^2-x(2)^2);
Ti = (-1)/(x(1)+Td*x(1)^2);
Kp = 18;

K = Kp*((1+Ti*s+Ti*Td*s^2)/(Ti*s*(1+T*s)));
