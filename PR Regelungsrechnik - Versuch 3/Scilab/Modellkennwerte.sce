// Parameter fuer das Scicos-Modell des Heiluftgeblaeses
// Version vom 3.7.08
//
// ACHTUNG: die vereinfachte Modelltransferfunkion lautet nun
//
// G(s) = 2.259 / ((s + 0.29) * ( s + 3.12 ));
//

z = poly(0,'z');
heater_ap = 10;
temp_ap = 43;

dead_steps_cos = 7; // Zeitdauer der Totzeit in Schritten je 100ms

tmp.num =  - 0.0107332 + 0.0050914*z +  0.0061100*z^2 + 0.0120656*z^3 + 0.0131304*z^4 + 0.0142643*z^5 + 0.0040054*z^6;
tmp.den =  0.2698550 - 0.1978478*z^1 + 0.1237194*z^2 - 0.0958364*z^3 -  0.2337833*z^4 - 0.8443608*z^5 + z^6;
Gz_cos = tmp.num / tmp.den;
