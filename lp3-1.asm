.MODEL SMALL
.STACK 100
.DATA
	STR1 DB "ENTER A CHARACTER: $"
	STR2 DB "ENTER A NUMBER: $"
	NL DB 13,10,"$"
	CHAR DB ?
	NUM DB ?
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	
	;OUTPUT STR1
	MOV AH,09H
	LEA DX,STR1
	INT 21H
	
	;INPUT CHAR
	MOV AH,01H
	INT 21H
	MOV CHAR,AL
	
	;OUTPUT NL
	MOV AH,09H
	LEA DX,NL
	INT 21H
	
	;OUTPUT STR2
	MOV AH,09H
	LEA DX,STR2
	INT 21H
	
	;INPUT NUM
	MOV AH,01H
	INT 21H
	SUB AL,30H
	MOV NUM,AL
	
	;OUTPUT NL
	MOV AH,09H
	LEA DX,NL
	INT 21H
	
	;LOOP
	MOV CL,NUM
	MOV CH,0H
	L1:
		MOV AH,02H
		MOV DL,CHAR
		INT 21H
	LOOP L1
	
	MOV AX,4C00H
	INT 21H
MAIN ENDP
END MAIN