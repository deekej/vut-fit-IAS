; Program pro experimentovani v NASM 
; spousti se davkou: run exp-prog

	bits 16
        %include "rw.asm"

	segment code 
..start: 
	prologue
; zacatek vlozeneho programu
;         call Read_Char
;         call WriteLn
;         call Write_Char
;         call WriteLn
;         mov [znak],byte 1
;         mov [znak+1],al
;         mov dx,znak
;         call Read_String
;         call WriteLn
;         mov dx,znak
;         call Write_String
;         call WriteLn
         call Read_Byte
         call WriteLn
         inc al
         call Write_Byte
         call WriteLn
;         call Read_ShortInt
;         call WriteLn
;         call Write_ShortInt
;         call WriteLn
;         call Read_Word
;         call WriteLn
;         call Write_Word
;         call WriteLn
;         call Read_Integer
;         call WriteLn
;         call Write_Integer
;         call WriteLn
;         mov cx,30000
;         add cx,cx
;         call Write_Flags
;         call WriteLn
; konec vlozeneho programu
	epilogue

	segment DATA
znak    resb 256
