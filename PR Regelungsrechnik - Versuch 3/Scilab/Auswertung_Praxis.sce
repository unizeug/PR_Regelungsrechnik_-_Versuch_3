// Boris: cd "/Users/borishenckell/Documents/eclipse workspace/PR_Regelungsrtechnik_-_Versuch_3/PR Regelungsrechnik - Versuch 3"
// Dirk: 
cd "/media/daten/workspace/PR_Regelungsrechnik_-_Versuch_3/PR Regelungsrechnik - Versuch 3/Scilab/"




load('../Messwerte/Praxis/K_tilde1.dat');
K_tilde1 = A
load('../Messwerte/Praxis/KposI1.dat');
KposI1 = A
load('../Messwerte/Praxis/K_tilde_sp1.dat');
K_tilde_sp1 = A


//[...].values(:,1) = Temperatur
//[...].values(:,2) = Heizleistung ???

scf(1);clf(1);
plot(K_tilde1.time-15,K_tilde1.values(:,1),'k');
plot(KposI1.time-15,KposI1.values(:,1),'r');
plot(K_tilde_sp1.time-15,K_tilde_sp1.values(:,1),'b');

xlabel('Zeit [s]');
ylabel('temp [°C]');
legend('PID','Pade-Approximation','Smith-Prädiktor',4);
title('Führungssprungantwort');


// --- pdf abspeichern --- //

xs2pdf(1,'../Bilder/5.pdf');
