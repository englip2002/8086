.MODEL SMALL
.STACK 100
.DATA
		CHAR1 DB ?
		CHAR2 DB ?
		STR1 DB "Enter 1st character: $"
		STR2 DB "Enter 2nd character: $"
		STR3 DB "You have enter $"
		NL DB 10,13,'$'
.CODE
MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
		
		;--output STR1
		MOV AH,09H
		LEA DX,STR1
		INT 21H
		
		;--INPUT A CHAR1
		MOV AH,01H
		INT 21H
		MOV CHAR1,AL
		
		;--output NL
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		;--output STR2
		MOV AH,09H
		LEA DX,STR2
		INT 21H
		
		;--INPUT A CHAR2
		MOV AH,01H
		INT 21H
		MOV CHAR2,AL
		
		;--output NL
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		;--OUTPUT STR3
		MOV AH,09H
		LEA DX,STR3
		INT 21H
		
		;--OUTPUT CHAR1,2
		MOV AH,02H
		MOV DL,CHAR1
		INT 21H
		
		MOV AH,02H
		MOV DL,CHAR2
		INT 21H
		
		
		MOV AX,4c00H
		INT 21H
MAIN ENDP
END MAIN