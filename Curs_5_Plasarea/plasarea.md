# Plasare

## Definitie
Plasarea este o etapă în fluxul de proiectare a circuitelor integrate digitale. Intrarea de procesului deplasare este circuitul obținut în urma mapării tehnologice (o listă de porți și interonexiunile porților). Plasarea constă în a determina pozițiile modulelor, în timp ce luăm în considerare diferite obiective și constrângeri. Constrângerile fundamentale sunt că porțile nu se suprapun și că toate modulele sunt amplasate în aria desemnată de footprint. O altă constrângere a plasării este, de exemplu, alinierea modulelor în rânduri sau la o structură de grilă. Principalul obiectiv al plasării este minimizarea lungimii totale a firelor, adică minimizarea sumei de lungimile tuturor plaselor. Acest obiectiv este utilizat deoarece cu o lungime minimă de fir, circuitul este ușor de parcurs, frecvența maximă a semnalului de tact este mare, iar consumul de energie este redus. 

## Problema Plasării
Problema plasării este așezarea porților astfel încât:
    •  toate obiectivele relevante (de exemplu, lungimea totală a firului) sunt optime și
    •  toate constrângerile (de exemplu, nu se suprapun) sunt îndeplinite.
    Problema de plasare este o problemă combinatorică, despre care se știe că este o problemă NP-completă. Aceasta înseamnă că nu există un algoritm la zi, care să rezolve problema optimă cu complexitate de runtime polinomială. În cazul extrem, toate plasările posibile ttrebuie inspectate, pentru a găsi plasarea optim. Cu milioane de porți, numărul de plasărilor fezabile este destul de mare, adică, timpul de rulare nu este practicabil.
Prin urmare, pentru a obține soluții bune în timpul rulării polinomiale, problema plasării este rezolvată cu metode euristice. O metodă tradițională este de a utiliza doi pași pentru plasare: plasarea globală și cea finală. În plasarea globală, modulele sunt distribuite aproximativ pe cip, cu puține suprapuneri rămas. În plasarea finală, suprapunerea este eliminată, iar modulele sunt aliniate la structură grilă / rând. 
       Plasarea globală înseamnă a răspândi modulele aproximativ pe cip, rezultând o plasare cu câteva suprapuneri. În deceniile anterioare, au fost dezvoltați algoritmi pentru plasarea globală. Ele diferă în principal în modul în care este minimizată lungimea firului și în ce mod sunt răspândite porțile pe cip. Figura de mai jos clasifică diferite tehnici și prezintă sisteme de plasare de ultimă generație. 
<img src="Tehnici_de_plasare.png" alt="Tehnici_de_plasare "/>
       
## Tipuri de plasare

### Plasarea "Greedy" (metoda lacomă)

Plasarea bazat pe metode greedy sunt o metode iterative, pornind de la o suluție inițială acesta este modificat și se vor accepta plasări noi cu cost mai redus. Aici, plasarea de început poate fi aleatorie, iar costul plasării este o combinație a lungimilor de fire de interconexiune și suprapunere a modulelor. Datorită faptului că sunt acceptate doar soluții de plasare mai bune, este probabil ca plasarea greedy se blochează într-un minim local, adică probabil nu va găsi soluția optimă. PLasarea gready modifică amplasarea prin permutarea modulelor, fie a doar două sau mai multor module. Pentru circuite cu câteva module, toate posibilele pot fi testate. Pentru circuite mai mari, doar module vecine pot fi permutate în timpul de rulare finit. Prin urmare, euristica mutărilor a fost dezvoltată pentru a decide care module sunt cele mai bune pentru a permite o plasare mai bună. Principalul dezavantaj al plasării greedy este că nu fac decât o optimizare locală a plasării. Astfel, ei depind foarte mult la plasarea de început.

