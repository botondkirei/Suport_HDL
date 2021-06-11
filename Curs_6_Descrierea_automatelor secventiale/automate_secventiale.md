<h1 align="center">
Descrierea automatelor secvențiale
</h1>

Există multe modalități de descriere a mașinilor secvențiale în VHDL.
Codul VHDL specifică modul în care se schimbă starea ca răspuns la semnalul
de intrare și de ieșire și modul în care sunt determinate semnalele de ieșire.
Unele moduri de scriere a codului VHDL secvențial folosesc direct tabelele de
stare sau ieșire.

Stilul CLAB4 de codare este abordat de Wakerly si este simplu de utilizat.
În majoritatea lucrărilor noastre, vom folosi editorul de stare Xilinx pentru a
produce codul VHDL al mașinii de stat. Facem acest lucru pentru a asigura
implementabilitatea.

Un proces este utilizat pentru a determina starea următoare. Răspunde
la modificările semnalului de ceas, în special, la o margine în creștere.

Valorile de ieșire sunt date de un set de declarații concomitente și sunt
externe procesului.

Se utilizează un tip de date pentru variabila de stare. Acest tip de date nu
este binar.

Software-ul de sinteză FPGA este folosit pentru a lua un fișier sursă VHDL
ca acesta și pentru a produce un fișier de biți pentru descărcare în hardware-ul
FPGA țintă. Software-ul are algoritmi care mapează designul într-o formă
adecvată arhitecturii FPGA, iar acest proces poate implica simplificarea
booleană, reducerea stării, optimizarea și alte operațiuni.

Teoria automatelor este baza din spatele modelului tradițional de calcul
și este utilizată în mai multe scopuri, altele decât proiectarea circuitului
controlerului, incluzând construcția compilatorului de programe de calculator,
dovezi ale complexității algoritmului și specificarea și clasificarea limbajului de
programare a computerului.

Deoarece automatele sunt modele matematice care produc valori
dependente de starea internă și posibil unele valori de intrare dependente,
acestea sunt denumite mașini de stare.

O mașină de stare poate permite un set finit sau infinit de stări posibile
și, în plus, acestea pot avea un comportament neterministic sau determinist. O
mașină cu stare deterministă este una ale cărei ieșiri sunt aceleași pentru o stare internă și valori de intrare. O mașină cu stare finită (FSM) este una în care
toate valorile posibile ale stării au făcut un set finit. Circuitele secvențiale
sincrone care se concentrează în această lucrare sunt modelate ca mașini cu
stare fină deterministă și sunt modelate ca mașini Mealy sau Moore.

Mașinile cu stare fină (FSM) constituie o tehnică specială de modelare a
circuitelor logice secvențiale. Un astfel de model poate fi de mare ajutor în
proiectarea anumitor tipuri de sisteme, în special a celor ale căror sarcini
formează o secvență bine definită.

Principala aplicație a unui FSM este realizarea operațiunilor care se
efectuează într-o succesiune de pași. Un sistem digital mare implică de obicei
algoritmi sau sarcini complexe, care pot fi exprimate ca o succesiune de acțiuni
bazate pe starea sistemului și comenzile externe. Un FSM poate funcționa ca un
circuit de control care coordonează și guvernează operațiunile altor unități ale
sistemului.

Figura urmatoare se prezintă structura generală a unei mașini cu stare
finită. Starea curentă a mașinii este stocată în registrul de memorie de stare, un
set de k-flip-flopuri ceasate de un singur semnal de ceas. Starea curentă este
valoarea stocată în prezent de registrul de memorie de stare. Următorul circuit
logic de stare al mașinii este o funcție a vectorului de stare și a intrărilor. Ieșirile
Mealy sunt o funcție a vectorului de stare și a intrărilor, în timp ce ieșirile
Moore sunt doar o funcție a vectorului de stare

<br>
<div align="center">
<img src='https://github.com/botondkirei/Suport_HDL/blob/5e4e843c6676a2782488cf9137143d2f8c888171/Curs_6_Descrierea_automatelor%20secventiale/figures/current_state.png'>
</div>
<br>

O mașină cu stare finită este specificată de cinci entități: stări simbolice,
semnale de intrare, semnale de ieșire, funcția de stare următoare și funcția de
ieșire. Un stat specifică o condiție internă unică a unui sistem și pe măsură ce
timpul progresează, FSM trece de la o stare la alta. Noua stare este
determinată de funcția de stare următoare, care este o funcție a stării actuale
și a semnalelor de intrare.

### Există mai multe avantaje în utilizarea stilului unic la cald pentru a
proiecta o mașină de stare:

- mașinile cu o stare caldă sunt mai rapide. Viteza depinde de numărul de
tranziții într-o anumită stare;
- este la fel de „optim” pentru toate utilajele;
- mașinile cu o stare caldă sunt ușor de proiectat și codul HDL poate fi
scris direct din diagrama de stare fără a codifica un tabel de stare;
- adăugarea și ștergerea stărilor sau modificarea ecuațiilor de excitație
pot fi implementate cu ușurință fără a afecta restul mașinii de stare;
- sintetizat ușor din limbi HDL, VHDL sau Verilog;
- este ușor de depanat.

Un stil care se află între cele două stiluri de mai sus este stilul de codificare cu
două calduri, care prezintă doi biți activi per stare și, prin urmare, cu n flip-flops
pot fi codați până la n (n-1) / 2 stări

Stilurile de codificare și numărul de flip-flops necesare pentru o mașină cu stare
finită cu opt stări sunt prezentate mai jos:


<table>
  <caption>
    TABLE 1. STATE ENCODING OF A 8-STATE FSM
  </caption>
  <col>
  <col>
  <colgroup span="3"></colgroup>
  <thead>
    <tr>
      <th scope="col"></th>
      <th colspan="3" scope="colgroup" style="text-align: center;">ENCODING</th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <th>STATE</th>
      <td>BINARY STYLE</td>
      <td>ONE-HOT STYLE</td>
      <td>TWO-HOT STYLE</td>
    </tr>
    <tr>
      <th>STATE1</th>
      <td>000</td>
      <td>00000001</td>
      <td>00011</td>
    </tr>
    <tr>
    <th>STATE2</th>
    <td>001</td>
    <td>00000010</td>
    <td>00101</td>
    </tr>
    <tr>
    <th>STATE3</th>
      <td>010</td>
      <td>00000100</td>
      <td>01001</td>
    </tr>
    <tr>
    <th>STATE4</th>
      <td>011</td>
      <td>00001000</td>
      <td>10001</td>
    </tr>
    <tr>
    <th>STATE5</th>
      <td>100</td>
      <td>00010000</td>
      <td>00110</td>
    </tr>
    <tr>
    <th>STATE6</th>
      <td>101</td>
      <td>00100000</td>
      <td>01010</td>
    </tr>
    <tr>
    <th>STATE7</th>
      <td>110</td>
      <td>01000000</td>
      <td>10010</td>
    </tr>
    <tr>
    <th>STATE8</th>
      <td>111</td>
      <td>10000000</td>
      <td>01100</td>
    </tr>
    <tr>
    <th>FLIP-FLOPS NUMBER</th>
    <th>THREE FLIP-FLOPS</th>
    <th>EIGHT FLIP-FLOPS</th>
    <th>FIVE FLIP-FLOPS</th>
    </tr>


  </tbody>
</table>
<br>

Stilul unic-cald este recomandat în aplicațiile în care flip-flops-urile sunt
abundente, ca în circuitele FPGA. Circuitele CPLD au mai puține flip-flops-uri
disponibile pentru proiectant.

În timp ce codarea unică la cald este uneori preferată, deoarece este
ușoară, o mașină de stare mare va necesita un număr mare de flip-flops. Prin
urmare, atunci când se pun în aplicare mașini cu stare finită pe circuite CPLD,
pentru a conserva resursele disponibile, se recomandă utilizarea codificării
binare sau gri . Aceasta permite cel mai mare număr de state să fie
reprezentate de cât mai puține flipflops.

### Automate de stare de tip Moore și Mealy:
>   Există două tipuri de automate de stare: Moore și Mealy. În cazul
>  automatelor de stare Moore, ieșirile reprezintă funcții doar de starea prezentă.
>   Automatele de tip Mealy pot avea ieșiri care sunt funcții atât de starea
>   prezentă, cât și de intrările prezente. Deosebirea dintre cele două tipuri de
>   automate de stare este ilustrată în figura următoare: 

<br>
<div align="center">
<img src='https://github.com/botondkirei/Suport_HDL/blob/5e4e843c6676a2782488cf9137143d2f8c888171/Curs_6_Descrierea_automatelor%20secventiale/figures/b.png'>
<p style="color:#87CEEB"> Deosebirea dintre(a) automatele de stare de moore și (b) automatele de stare Mealy</p>
</div>
<br>

Operațiile suplimentare necesare pentru descrierea automatelor Mealy
față de cele necesare pentru descrierea automatelor Moore sunt minime.
Pentru implementarea unui automat de tip Mealy, trebuie să se descrie ieșirile
ca funcții atât de biții de stare, cât și de intrări. În general, utilitarele de sinteză
permit utilizarea ambelor tipuri de automate de stare.

Mealy sau Moore depinde de modul în care codificați rezultatele. Este
condus de logica combinatorială care depinde de starea curentă și de intrări.
Ieșirea se poate schimba imediat ce intrările se schimbă, indiferent de ceas,
astfel încât ieșirea este de tip Mealy.

Este posibil să se codifice ieșirile suplimentare pentru a fi sincron cu
ceasul și să depindă pur de starea curentă. Aceste rezultate ar fi Moore. Cu alte
cuvinte, puteți avea un mix de ieșiri Moore și Mealy într-o mașină de stare.

Fig. 9.1 și Fig. 9.2 sunt diagramele de stare pentru proiectele Mealy și
respectiv Moore. În Fig. 9.1 , ieșirea sistemului este setată la 1, ori de câte ori
sistemul este în stare „zero” și valoarea semnalului de intrare „nivel” este 1;
adică ieșirea depinde atât de starea cât și de intrare. În timp ce în Fig. 9.2 ,
puterea este setată la 1 ori de câte ori sistemul se află în „marginea” stării,
adică ieșirea depinde doar de starea sistemului.

<br>
<div align="center">
<img src='https://github.com/botondkirei/Suport_HDL/blob/5e4e843c6676a2782488cf9137143d2f8c888171/Curs_6_Descrierea_automatelor%20secventiale/figures/design.png'>
</div>
<br>

### Descrierea automatului de stare cu trei procese:
>Automatul de stare poate fi descris prin utilizarea a trei procese, dacă
>modelul automatului de stare este descompus în modul ilustrat în figura
>următoare. Procesul combinațional proc1 descrie logica stării următoare.
>Procesul secvențial proc2 conține descrierea registrului de stare, specificând
>sincronizarea tranzițiilor de stare cu semnalul de ceas. Procesul combinațional
>proc3 specifică semnalele de ieșire ale automatului de stare.

<br>
<div align="center">
<img src='https://github.com/botondkirei/Suport_HDL/blob/5e4e843c6676a2782488cf9137143d2f8c888171/Curs_6_Descrierea_automatelor%20secventiale/figures/numai.png'>
</div>
<br

În cazul acestui tip de descriere, vor fi necesare două semnale de stare,
unul pentru starea prezentă (StarePrez) și un altul pentru starea următoare
(StareUrm). Starea următoare este determinată ca o funcție de starea prezentă
și de intrări. Deci, lista de sensibilitate a primului proces trebuie să includă
aceste semnale:

    proc1: process (StarePrez, Ready, RW)
    begin
    ...
    end process proc1;

Procesul proc1 este un proces combinațional, astfel încât este important
să se specifice starea următoare în toate condițiile, utilizând clauze else, pentru
a se evita inserarea circuitelor latch de către utilitarul de sinteză.

După ce ne-am familiarizat cu mașinile de stat în termeni generali, acum
petrecem ceva timp cu blocurile de construcție ale mașinilor de stat, adică
elemente de memorie. Elementele de memorie permit sistemelor digitale să-și
amintească rezultatele evenimentelor anterioare. Cipul Xilinx 4000E FPGA
conține flip-flops-uri în IOB-uri și CLB-uri

Mai exact, ne uităm acum la zăvoare și flip-flops .

După cum vom vedea, zăvoarele sunt elemente de memorie fără nici o
intrare de ceas, în timp ce flip-flops-urile sunt elemente de memorie care
răspund la o intrare de ceas.

Există o serie de tipuri de zăvoare / flip-flops:
1. SR (setare resetată)
2. D (date)
3. T (comutare)
4. JK

### Declanșarea este o problemă-cheie; elementul de memorie poate fi:
1. de ceas (sincron) sau de ceas (asincron)
2. nivelul sau marginea declanșate

O mașină cu stare finită este o descriere abstractă a structurii digitale și,
prin urmare, instrumentele de sinteză necesită coduri de stat ale automatului
ca valori binare sau instrumentul de sinteză în sine va transforma starea într-o
descriere binară. Modul în care sunt atribuite valorile binare se numește codare
de stare.

Majoritatea instrumentelor de sinteză selectează implicit un cod binar,
cu excepția faptului că proiectantul specifică explicit un alt cod. Din toate
posibilitățile de codare a stării se folosește frecvent cod unic, care este necesar
pentru circuite optimizate cu viteză.

<table>
  <col>
  <col>
  <colgroup span="3"></colgroup>
  <thead>
    <tr>
      <th colspan="3" scope="colgroup" style="text-align: center;">STATE ENCODING</th>
    </tr>
    <tr>
      <th colspan="3" scope="colgroup">TYPE STATE_TYPE IS (S0, S1, S2) ;<P>SIGNAL STATE: STATE TYPE ;</P></th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <th>BINARY CODE</th>
      <th>ONE-HOT CODE</th>
      <th>GRAY CODE</th>
    </tr>
    <tr>
      <td>s0 -> "00"</td>
      <td>s0 -> "001"</td>
      <td>s0 -> "10"</td>
    </tr>
    <tr>
      <td>s1 -> "01"</td>
      <td>s1 -> "010"</td>
      <td>s1 -> "01"</td>
    </tr>
    <tr>
      <td>s2 -> "10"</td>
      <td>s2 -> "100"</td>
      <td>s2 -> "11"</td>
    </tr>

  </tbody>
</table>
<br>

### Concluzii:

Această lucrare arată relația dintre mașinile cu stare finită și codul VHDL
/ Verilog. O motivație fundamentală pentru a utiliza VHDL sau Verilog este
aceea că ambele sunt un limbaj standard, independent de tehnologie și, prin
urmare, sunt portabile și reutilizabile.

De exemplu se arată că pentru designul Mealy se necesită mai puține
stări decât pentru designul Moore. Mai mult, designul Mealy generează bifa de
ieșire imediat ce este detectată marginea în creștere; în timp ce designul
Moore generează marcajul de ieșire după o întârziere a unui ciclu de ceas. Prin
urmare, desenele Mealy sunt preferate pentru proiectele sincrone. 

### Biblografie:

1. http://users.cecs.anu.edu.au/~Matthew.James/engn3213-2002/notes/seqnode9.html
2. http://www.dasconference.ro/cd2010/data/papers/C80.pdf
3. http://users.utcluj.ro/~baruch/ssc/labor/Automate-Stare.pdf
4. https://vhdlguide.readthedocs.io/en/latest/vhdl/fsm.html
