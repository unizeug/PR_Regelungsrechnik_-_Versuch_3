// Boris: cd "/Users/borishenckell/Documents/eclipse workspace/PR_Regelungsrtechnik_-_Versuch_3/PR Regelungsrechnik - Versuch 3"
// Dirk: cd "/media/daten/workspace/PR_Regelungsrechnik_-_Versuch_3/PR Regelungsrechnik - Versuch 3/Scilab/"


s = poly(0,'s');


w = 2 + %pi * 0.3;
d = 1;

P =1/ (s^2+s*2*d/w + w^2);
polpaar = roots(P.den);

