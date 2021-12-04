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

Plasarea bazat pe metode greedy sunt o metode iterative, pornind de la o plasare inițială acesta este modificat și se vor păstra plasări mai optime. Aici, plasarea de început poate fi aleatoare, iar costul plasării este o combinație a lungimilor de fire de interconexiune și suprapunere a modulelor. Datorită faptului că sunt acceptate doar soluții de plasare mai bune, este probabil ca plasarea greedy se blochează într-un minim local, adică probabil nu va găsi soluția optimă. PLasarea gready modifică amplasarea prin permutarea modulelor, fie a doar două sau mai multor module. Pentru circuite cu câteva module, toate posibilele pot fi testate. Pentru circuite mai mari, doar module vecine pot fi permutate în timpul de rulare finit. Prin urmare, euristica mutărilor a fost dezvoltată pentru a decide care module sunt cele mai bune pentru a permite o plasare mai bună. Principalul dezavantaj al plasării greedy este că nu fac decât o optimizare locală a plasării. Astfel, ei depind foarte mult la plasarea de început.

### Creșterea grupurilor (cluster-growing)

Plasarea bazat pe creșterea grupurilor amplasează iterativ module noi în jurul modulelor deja plasate. Aici, primele module plasate pot fi aleatoare. Aceast tip e plasare poate fi privit o metodă de proiectare de jos în sus (buttum-up): pornind de la unele module plasate, module noi sunt plasare, până când toate modulele sunt plasate. Decizia, care module sunt grupate, este luată pe baza unor funcții de cost considerând lungimea firelor și suprapunerea modululelor. Această abordare are rezultate bune pentru circuite mici, dar se degradează odată cu creșterea numărului de module din circuit. Această este datorită unei „viziunii locale” a metodei și a dependenței mari de plasare inițilă.

### Plasarea prin decupare-minimă (min-cut)

Spre deosebire de natura de proiectare de jos în sus a plasării prin creșterea grupurilor, plasare prin decupare minimă au o natură de proiectare de sus în jos. Aici, aria de plasare și circuitul sunt împărțite recursiv. În acest sens, modulele circuitului sunt atribuite unor zone amplasate în aria chip-ului. Procesul recursiv se face până când fiecare modul este alocat unei zone unice a ariei de plasare, ceea ce are ca rezultat o plasare fără sau doar puțină suprapunere. Partiționarea circuitului este condusă de minimumizarea lungimii firelor. În principiu, minimizarea se realizează prin reducerea la minimum a numărului de fire tăiate (⇒ decupare minimă) în urma partiționării. Primele aplicații de plasare prin decupare-minimă au împărțit aria de plasare în două zone (bipartitionare) în fiecare etapă a procesului recursiv. Mai tărziu, partiționarea sa făcut în 4, ciar 8 bucăți. Aplicații ale plasării prin decupare minimă sunt: Capo [ J. A. Roy, D. A. Papa, S. N. Adya, H. H. Chan, A. N. Ng, J. F. Lu, I. L. Markov:
Capo: Robust and scalable open-source min-cut floorplacer, in: ACM/SIGDA International Symposium on Physical Design (ISPD), pages 224–226, 2005.], Dragon [ T. Taghavi, X. Yang, B.-K. Choi: Dragon2005: Large-scale mixed-size placement tool, in: ACM/SIGDA International Symposium on Physical Design (ISPD), pages 245–247, 2005.] și FengShui [A. R. Agnihorti, S. Ono, C. Li, M. C. Yildiz, A. Khathate, C.-K. Koh, P. H. Madden: Mixed block placement via fractional cut recursive bisection, IEEE Transactions on Computer-Aided Design of Circuits and Systems, volume 24(5), pages 748–761, May 2005.].

### Plasarea stohastică

Plasarea stohastică combină lungimea firelor și suprapunerea modulelor într-o singură funcție de cost și minimizează această funcție de cost cu metode stocastice. Metodele stocastice înseamnă crearea aleatorie de seturi de plasări într-o succesiune de iterații. În final, se alege ca rezultat plasarea cu funcția de cost cel mai mic. Funcția de cost poate fi extins pentru a lua în considerare diferite obiective sau diverse constrângeri. Mai mult, plaserii stocastici sunt capabili să scape de minimele locale și chiar sunt capabili să găsească soluția optimă pentru problema de plasare. Cu toate acestea, optimizarea stocastică necesită, în general, o mulțime de eșantioane (plasări) și, prin urmare, plasarea stohastică este aplicabilă numai pentru circuite cu un număr redus de module. Există două metode principale de optimizare stocastică: calarea simulată (simulated anealing) și algoritmi evolutivi.

### Plasarea analitică

PLasarea analitică se bazează pe o funcție de cost analitică, care este continuă și diferențiabilă. Minimul funcției de cost analitic este determinat de optimizare numerică. În mare parte, funcția de cost reprezintă lungimea firului și, uneori, este o combinație de lungime a firului și suprapunere. În funcție de funcția de cost, plasarea analiticp poate fi liniar sau neliniar.

#### Plasarea liniară

Plasarea liniară folosește o funcție de cost liniară și elimină suprapunerea modulelor prin constrângeri liniare dintre module. Aceasta rezultă într-o problema de programare liniară. Astfel de programe au o complexitate de calcul ridicată. Prin urmare, aplicațiile de plasare liniare precum [ B. X. Weis, D. A. Mlynski: A new relative placement procedure based on MSST and linear programming, in: IEEE International Symposium on Circuits and Systems (ISCAS), pages 564–567, 1987. ] [ S. Reda, A. Chowdhary: Effective linear programming based placement methods, in: ACM/SIGDA International Symposium on Physical Design (ISPD) pages 186–191, 2006] pot fi utilizate numai pentru circuite cu un număr redus de module. Funcția de cost analitică în plasarea liniară poate fi nediferențială (de exemplu, folosind funcția de valoare absolută). În toate celelalte abordări de plasare analitică, funcția de cost este diferențiabilă.

#### Plasarea pătratică

Plasarea pătratică urmărește minimizarea lungimii totale a firului, unde lungemea firelor este exprimat de diferența pătratică a coordonatelor. Funcția de cost pătratică Γ este:
```math
Γ = 1/2*sum(w_ij * (x_i-x_j)^2 + w_ij * (y_i-y_j)^2)
```
unde perechea p_i=(x_i, y_i) reprezintă poziția modulului i, iar Wij este o pondere a laturii care conecteaz modulele i si j. 
Considerând vectorul  p = (x1, x2, ..., xN, y1, y2, ... yN)T fiind pozițiile tuturor N modulele, notarea sumei funcției de costuri quadratice (2.1) poate fi reprezentat cu operați matriciale.
```math
Γ = 1/2*pT*C*p + pT*d + const
```
Matricea C reprezintă conexiunile dintre modulele, iar vectorul d reflectă conexiunile dintre modulele și puncte fixe. Puncte fixe sunt de exemplu pini I/O (pini de intrare/ieșire). Prin minimizarea lui Γ, plasarea cvadratică rezultă pozițiile modulelor p astfel încît lungimea fierlor este minimizată, aceasta fiind o plasarea optimă. Deoarece plasarea pătratică nu ia in considerare dimensiunea modulelor, plasarea are nevoie de o metodă pentru a evita suprapunerea modulelor. În funcție de motoda de reducerea suprapunerilor, plasarea pătratică este împărțită în trei categorii: pe baza valorilor proprii, pe baza de partiționare și pe baza forțelor.

# Bibliografie
Peter Spindler, „Efficient Quadratic Placement of VLSI Circuits”, Thesis. Technischen Universit¨at M¨unchen zur Erlangung, 2007

