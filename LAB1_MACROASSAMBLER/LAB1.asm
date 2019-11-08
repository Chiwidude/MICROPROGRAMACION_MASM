.386
;model
.model flat, stdcall				;flat es como small
option casemap:none
;includes
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\masm32rt.inc
;librerias
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.DATA
MSJ DB "INGRESE UN NUMERO:  ",0,13h,10h
MSJ1 DB "EL RESULTADO DE LA SUMA ES: ",0,13,10h
MSJ2 DB "EL RESULTADO DE LA RESTA ES: ",0,13,10h
MSJ3 DB "ESTE NUMERO ES EL MAYOR: ",0,13,10h
MSJ4 DB "LOS NUMEROS SON IGUALES ",0,13,10h
.DATA?

NUM1 Dw ?
NUM2 Dw ?

.code

PROGRAM:

MAIN PROC
;lee el primer numero
	INVOKE StdOut, addr MSJ
	INVOKE StdIn, addr NUM1,10	
	XOR BX,BX
	MOV BX,NUM1
	SUB BX,30h
; lee el segundo numero
	INVOKE StdOut, addr MSJ
	INVOKE StdIn, addr NUM2,10	
	SUB NUM2,30h
; realiza la suma
	ADD BX,NUM2	
	INVOKE StdOut, addr MSJ1
	print str$(BX),13,10
	SUB NUM1,30h	
	XOR BX,BX
	MOV BX,NUM1
; realiza la resta
	SUB BX,NUM2
	INVOKE StdOut, addr MSJ2
	print str$(BX),13,10
	XOR BX,BX
	MOV BX,NUM1
; realiza la comparacion
	CMP BX,NUM2
; N1 si NUM1 es mayor
	JG  N1
; N2 si NUM2 es mayor
	JL  N2
; N3 si son iguales
	JE  N3

N1:
INVOKE StdOut, addr MSJ3
print str$(BX),13,10
JMP FINAL
N2:
XOR BX,BX
MOV BX,NUM2
INVOKE StdOut, addr MSJ3
print str$(BX),13,10
JMP FINAL
N3:
INVOKE StdOut, addr MSJ4
JMP FINAL
FINAL:
	INVOKE ExitProcess,0

MAIN ENDP

END PROGRAM

