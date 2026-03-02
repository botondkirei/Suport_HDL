#Instructiuni pentru simulare cu GHDL (sub Windows)

1. Se descarc utilitarele de pe github (git clone https://github.com/botondkirei/Suport_HDL.git).
2. Se descarca instalatorul GHDL: https://github.com/ghdl/ghdl/releases/download/v0.37/ghdl-0.37-mingw32-mcode.zip
3. Se adauga calea catre ghdl/bin/ghdl.exe la variabile de mediu sub Windows
4. Se adauga calea GtkWave/bin/gtkwave.exe
5. Se descarca editorul Geany : https://download.geany.org/geany-1.38_setup.exe; se intaleaza
6. In Geany setam comenzile Build->Set build Commands
    * analyze : ghdl -a --std=08 %f
    * run : ghdl --elab-run --std=08 %e --wave=sim.ghw
    * waver : gtkwave sim.ghw --autosavename
7. Se creaza un director unde sunt salvate sursele VHDL

