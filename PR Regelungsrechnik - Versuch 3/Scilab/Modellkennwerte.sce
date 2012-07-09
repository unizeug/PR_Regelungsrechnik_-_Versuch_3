// Parameter fuer das Scicos-Modell des Heiluftgeblaeses
// Version vom 26.06.2012
//
// ACHTUNG: die vereinfachte Modelltransferfunkion lautet:
//
// s=poly(0,'s');   G = 2.259 / ((s + 0.29) * ( s + 3.12 ));


z = poly(0,'z');
heater_ap = 10;
temp_ap = 43;

dead_steps_cos = 4; // Zeitdauer der Totzeit in Schritten je 100ms

// NEU
tmp.num =  0.0003508 - 0.0435529*z + 0.0423176*z^2 + 0.0070704*z^3 + 0.0166357*z^4 + 0.0089772*z^5 + 0.0034504*z^6;
tmp.den =  0.1854364 - 0.0942036*z - 0.0273737*z^2 + 0.1482507*z^3 - 0.1232644*z^4 - 1.0744617*z^5 + z^6;

// Approximation der Strecke durch ein Polynom höherer Ordnung
Gz_cos = tmp.num / tmp.den;