.MODEL SMALL
.STACK 100
.DATA
		STR1 DB 'Enter 1st digit: $'
		STR2 DB 'Enter 2nd digit: $'
		STR3 DB 'Total is $'
		NL DB 10,13,'$'
		NUM1 DB ?
		NUM2 DB ?
.CODE
MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
		
		;--OUTPUT STR1
		MOV AH,09H
		LEA DX,STR1
		INT 21H
		
		;--INPUT NUM1
		MOV AH,01H
		INT 21H
		SUB AL,30H
		MOV NUM1,AL
		
		;--OUTPUT NL
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		;--OUTPUT STR2
		MOV AH,09H
		LEA DX,STR2
		INT 21H
		
		;--INPUT NUM2
		MOV AH,01H
		INT 21H
		SUB AL,30H
		MOV NUM2,AL
		
		;--OUTPUT NL
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		;--OUTPUT STR3
		MOV AH,09H
		LEA DX,STR3
		INT 21H
		
		;--OUTPUT ANS
		MOV AH,02H
		MOV DL,NUM1
		ADD DL,NUM2
		ADD DL,30H
		INT 21H
		
		MOV AX,4c00H
		INT 21H
MAIN ENDP
END MAIN