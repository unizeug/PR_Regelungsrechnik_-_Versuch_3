// Regelungstechnik Versuch 3



s = poly(0, 's');

G_tilde = 2.259 / ((s + 0.29) * ( s + 3.12 ));


Kpid = 1.6;        // Verstärkung
s1   = -0.29;    // Polstellen der Strecke
s2   = -3.12;    // Polstellen der Strecke
p    =  -20         // Realisierbarkeitspole 
T    = 1/-p;
Ti   = -(s1+s2)/(s1*s2);
Td   = 1/-(s1+s2);

K_tilde = Kpid * (1/(1+T*s))*(1/Ti)*(1/s)*(s^2*Td*Ti+Ti*s+1);


// zum Vergleichen
w = 2 * %pi * 0.3;
d = 1;

P =1/ (s^2/w^2+s*2*d/w + 1);
polpaar = roots(P.den);


// Sprungantwort
GKgeschlossen_tilde = (G_tilde*K_tilde)/(1+G_tilde*K_tilde);

t1=[0:0.1:100];
//u=ones(1,length(t1))*0.1;
h1=csim('step',t1,GKgeschlossen_tilde);
h2=csim('step',t1,P);

clf(15);scf(15);
    plot2d(t1,h1)
    plot2d(t1,h2,2)
    legend('Sprungsantwort geschlossener Regelkreis',  'Sprungantwort P    T2 Glied',4);
    xtitle('Sprungantworten', 'Zeit[s]', 'Temperatur [°c]')


// Pade-Appriximation

tau=0.4; // 0.4

p1 = (1-tau/2*s)/(1+tau/2*s);
G_dach=G_tilde*p1;


// Reglerentwurf mit Polvorgabe


// erstellen der Streckenmatrix
G_dachI = G_dach*1/s
nI=length(roots(G_dachI.den));
AsI=zeros(2*nI,2*nI);
//As(Zeile,Spalte)
for k = 1:2*nI+1
    for l = 1:2*nI
        if k<nI+2 then
            if l < nI+1 then
                AsI(k+l-1,l) = coeff(G_dachI.den,nI+1-k);
            end
            if l > nI then
                AsI(k+l-1-nI,l) = coeff(G_dachI.num,nI+1-k);
            end
        end
    end
end

pol_G_dachI = roots(G_dachI.den);
qsoll= (s-pol_G_dachI(1))*(s-pol_G_dachI(2))*(s-pol_G_dachI(3))*(s-pol_G_dachI(4))*(s-polpaar(1))*(s-polpaar(2))*(s-2);

cvekI = coeff(qsoll)';

kcoeffI=inv(AsI)*cvekI;
KposI = syslin('c',kcoeffI(nI+1)*s^(nI-1)+kcoeffI(nI+2)*s^(nI-2) + kcoeffI(nI+3)*s^(nI-3)+kcoeffI(nI+4)*s^(nI-4),s*(kcoeffI(1)*s^(nI-1)+kcoeffI(2)*s^(nI-2)+kcoeffI(3)*s^(nI-3)+kcoeffI(4)*s^(nI-4)));

clean(KposI);

// Führungssprung
//GKgeschlossen = KposI*G_dach/(1+KposI*G_dach)

GKgeschlossen = syslin('c', KposI.num*G_dach.num/(KposI.den*G_dach.den + KposI.num*G_dach.num))

clean(GKgeschlossen);

GKgeschlossen = syslin('c', GKgeschlossen.num,GKgeschlossen.den);

S = syslin('c', KposI.den*G_dach.den/(KposI.den*G_dach.den + KposI.num*G_dach.num))

clean(S);


h3=csim('step',t1,GKgeschlossen);
h4=csim('step',t1,S);

figure(16);
plot2d(t1,h3);

figure(17);
plot2d(t1,h4);

 