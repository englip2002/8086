.MODEL SMALL
.STACK 100
.DATA
		CHAR DB ?
		STR1 DB "Enter a character: $"
		STR2 DB "I Love $"
		NL DB 0DH,0AH,"$"
.CODE
MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
		
		;--output STR1
		MOV AH,09H
		LEA DX,STR1
		INT 21H
		
		;--input data
		MOV AH,01H
		INT 21H
		MOV CHAR,AL
		
		;--next line
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		;--output STR2
		MOV AH,09H
		LEA DX,STR2
		INT 21H
		
		;--print char entered twice
		MOV AH,02H
		MOV DL,CHAR
		INT 21H
		
		MOV AH,02H
		MOV DL,CHAR
		INT 21H
	
		MOV AX,4c00H
		INT 21H
MAIN ENDP
END MAIN