; Program pro experimentovani v NASM 

    bits 16
    %include "rw.asm"
;-------------------------------------------------
	segment code

;------------------------------------------------- jednotlive funkce
@program_quit:
    jmp @program_end
    ret

@max_seq:
    mov dx,msg_test1
    call Print_Str
    call WriteLn
    ret

@odd_num_seq:
    mov dx,msg_test2
    call WriteLn
    ret

;-------------------------------------------------
..start: 
	prologue        ; Macro z rw.asm

;------------------------------------------------- zacatek vlozeneho programu
;-- Vypis uvodni obrazovky
    mov dx, msg_uvod
    call Print_Str
    mov dx, msg_uvod2
    call Print_Str
    mov dx, msg_uvod3
    call Print_Str
    mov dx, msg_uvod4
    call Print_Str
;-- nacteni look-up tabulky a jeji velikosti
    mov bx, @case_table
    mov cx, [case_number]
;-- cyklicke nacitani hodnoty a volani funkce
@program_loop:
    mov dx, msg_wait
    call Print_Str
    call Read_Char
@switch_cycle:
    cmp al, [bx]
    jne @next
    call [bx + 1]
    jmp @switch_end
@next:
    add bx,3
    loop @switch_cycle
@default:                   ;--- default
    mov dx, msg_error
    call Print_Str
@switch_end:                ;--- switch_end
    jmp @program_loop
@program_end:

;------------------------------------------------- konec vlozeneho programu
	epilogue        ; Macro z rw.asm
;-------------------------------------------------

	segment DATA
; zacatek datove sekce
    msg_uvod:   db 'Ovladani proramu - jedna z nasledujicich klaves:',13,10,'$'
    msg_uvod2:  db 'm - pro vypis maxima posloupnosti',13,10,'$'
    msg_uvod3:  db 'l - pro vypis poctu lichych cisel dane posloupnosti',13,10,'$'
    msg_uvod4:  db 'k - pro ukonceni programu',13,10,'$'
    
    msg_test1:  db 'test1$'
    msg_test2:  db 'test2$'

    msg_wait:   db 'Stisknete vybranou klavesu...',13,10,'$'

    msg_error:  db 13,10,'Error - spatna volba... Pro ukonceni stisknete K...',13,10,'$'


@case_table:
    db 'm'
    dw @max_seq
    db 'l'
    dw @odd_num_seq
    db 'k'
    dw @program_quit

case_number:    dw 3
