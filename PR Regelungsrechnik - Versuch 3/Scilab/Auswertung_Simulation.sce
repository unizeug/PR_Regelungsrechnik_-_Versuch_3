//Auswertung Simulation
load('./Documents/eclipse workspace/PR_Regelungsrechnik_-_Versuch_3/PR Regelungsrechnik - Versuch 3/Messwerte/Simulation/Nr_4_1_tau_0.dat');
load('./Documents/eclipse workspace/PR_Regelungsrechnik_-_Versuch_3/PR Regelungsrechnik - Versuch 3/Messwerte/Simulation/Nr_4_1_tau_04.dat');
load('./Documents/eclipse workspace/PR_Regelungsrechnik_-_Versuch_3/PR Regelungsrechnik - Versuch 3/Messwerte/Simulation/Nr_4_1_tau_08.dat');
load('./Documents/eclipse workspace/PR_Regelungsrechnik_-_Versuch_3/PR Regelungsrechnik - Versuch 3/Messwerte/Simulation/Nr_4_1_tau_12.dat');
load('./Documents/eclipse workspace/PR_Regelungsrechnik_-_Versuch_3/PR Regelungsrechnik - Versuch 3/Messwerte/Simulation/Nr_4_1_tau_16.dat');
load('./Documents/eclipse workspace/PR_Regelungsrechnik_-_Versuch_3/PR Regelungsrechnik - Versuch 3/Messwerte/Simulation/Sprung.dat');
//load('./Documents/eclipse workspace/PR_Regelungsrechnik_-_Versuch_3/PR Regelungsrechnik - Versuch 3/Messwerte/Simulation/Nr_4_1_tau_24.dat');

scf(1);clf(1);
plot2d(Nr_4_1_tau_0.time,Sprung.values);
plot2d(Nr_4_1_tau_0.time,Nr_4_1_tau_0.values);
plot2d(Nr_4_1_tau_0.time,Nr_4_1_tau_04.values,2);
plot2d(Nr_4_1_tau_0.time,Nr_4_1_tau_08.values,3);
plot2d(Nr_4_1_tau_0.time,Nr_4_1_tau_12.values,5);
plot2d(Nr_4_1_tau_0.time,Nr_4_1_tau_16.values,7);
//plot2d(Nr_4_1_tau_0.time,Nr_4_1_tau_20.values,5);
//plot2d(Nr_4_1_tau_0.time,Nr_4_1_tau_24.values,6);
xlabel('Zeit [s]');
ylabel('temp [°C]');
legend('Sprung','tau = 0 s','tau = 0.4 s','tau = 0.8 s','tau = 1.2 s','tau = 1.6 s',2);
//xtitel('Sprungantwort geschlossener Regelkreis lineare Strecke');
