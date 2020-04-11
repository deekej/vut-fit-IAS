; Zadani 3. cv, ut-17
; -------------------
; Vytvorte interaktivni program, ktery od uzivatele prijme volbu
; a podle ni vykona prislusnou operaci.
; Vsechna vstupni data (krome volby) nacitejte z datoveho segmentu. Posloupnosti
; vzdy ukoncete nulovym bajtem, ktery do vypoctu nezahrnete.
; Zadani voleb:
; 1) Po stisknuti "m" vypiste maximum z posloupnosti v DS (1 bod)
; 2) Po stisknuti "l" vypiste pocet lichych cisel dane posloupnosti v DS (1 bod)
; 3) Po stisknuti "k" se program ukonci, ostatni volby ohlasi jako neplatne (1 bod)
; Hlidejte preteceni/podteceni u vsech operaci, kde je to mozne! (jinak -1 bod)
;
; Priklad po spusteni programu:
; ----------------------------
; Jednoduchy interaktivni program
; Moznosti:
; 1) Po stisku "x" provedu xxx
; 2) Po stisky "y" provedu yyy
; 3) Po stisku "k" se program ukonci
; Zadejte prosim volbu:


    bits 16
    %include "rw.asm"

;---------------
    segment code

..start:

    ;makro z rw.asm
    prologue

    ;  sem doplnte vas kod

    ;makro z rw.asm
    epilogue

;---------------
    segment DATA

    ; sem ukladejte pomocna data (retezce, apod.)
    msg_ukazka:    db 'Toto je ukazka retezce$'
    ; Posledni nula je dulezita! Jde o ukonceni libovolne dlouhe (max 255) posloupnosti.
    posloupnost:   db  10, 21, 3, 0
