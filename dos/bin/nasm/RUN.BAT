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
REM if not exist NASM.EXE goto no_compiler

echo Pýeklad souboru "%1.asm" pomoc¡ NASM.EXE.
nasm -f obj %1.asm -l %1.lst

if not exist %1.obj goto compile_err
REM if not exist LINK.EXE goto no_linker

echo Sestavov n¡ pomoc¡ LINK.EXE:
link %1.obj,%1.exe,%1.map,,nul.def

if not exist %1.exe goto link_err

echo SpuçtØn¡ %1.EXE:
%1.EXE
echo Program spr vnØ ukonŸen, ý¡zen¡ vr ceno operaŸn¡mu syst‚mu.
goto exit

:input_err
	echo Soubor %1.asm neexistuje.
	goto exit
:no_compiler
	echo Nemohu nal‚zt program NASM.EXE.
	goto exit
:no_linker
	echo Nemohu nal‚zt program LINK.EXE.
	goto exit
:compile_err
	echo Chyba pýi pýekladu programem NASM.EXE.
	goto exit
:link_err
	echo Chyba pýi sestavov n¡ programem LINK.EXE.
:exit   
	pause
