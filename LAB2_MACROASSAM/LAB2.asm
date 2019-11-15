Factorial MACRO numero,resultado

PUSHA

XOR EAX,EAX
XOR ECX,ECX
MOV CL,numero
MOV EAX,1
FC:
	MUL ECX
LOOP FC
MOV resultado,EAX

POPA

ENDM

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
MSJ1 DB "FACTORIAL DE UN NUMERO",0,13,10h
MSJ2 DB "INGRESE EL NUMERO 3 CIFRAS: ",0,13,10h
MSJ3 DB "EL RESULTADO ES: ",0,13,10h
TEN DB 10
.DATA?
NUM1 DB 3 dup(?),0
NUM2 DB ?
RESULTADO DD ? 


.CODE

PROGRAM:

INVOKE StdOut, addr MSJ1
INVOKE StdOut,addr MSJ2
INVOKE StdIn, addr NUM1,10

MOV NUM2,0

XOR BL,BL

MOV BL,NUM1

XOR CL,CL

MOV CL,NUM1

MOV AL,NUM1[0]

SUB AL,30h

MUL TEN

MUL TEN

MOV NUM2,AL

XOR AL,AL

MOV AL,NUM1[1]

SUB AL,30h

MUL TEN

ADD NUM2,AL

XOR AL,AL

MOV AL,NUM1[2]

SUB AL,30h

ADD NUM2,AL

Factorial NUM2,RESULTADO
INVOKE StdOut, addr MSJ3

print str$(RESULTADO),10,13

INVOKE ExitProcess,0
END PROGRAM



