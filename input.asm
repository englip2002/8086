.MODEL SMALL
.STACK 100
.DATA
		NUM DB ?
.CODE
MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
		
		;--input data
		MOV AH,01H
		INT 21H
		
		;--convert from char to int and Hexa
		SUB AL,30H
		;--input will be store in AL
		MOV DB,AL
		
		MOV AX,4c00H
		INT 21H
MAIN ENDP
END MAIN