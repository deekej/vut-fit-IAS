@echo off

if not exist %1.obj goto j1
del %1.obj

:j1
if not exist %1.exe goto j2
del %1.exe

:j2
if not exist %1.lst goto j3
del %1.lst

:j3
if not exist %1.map goto j4
del %1.map

:j4
if not exist %1.asm goto input_err
if not exist NASM.EXE goto no_compiler

echo Pýeklad souboru "%1.asm" pomoc¡ NASM.EXE.
nasm -f obj %1.asm -l %1.lst

if not exist %1.obj goto compile_err

echo Pýeklad OK.
goto exit

:input_err
	echo Soubor %1.asm neexistuje.
	goto exit
:no_compiler
	echo Nemohu nal‚zt program NASM.EXE.
	goto exit
:compile_err
	echo Chyba pýi pýekladu programem NASM.EXE.
	goto exit
:exit   
	pause