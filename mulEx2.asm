.MODEL SMALL
.STACK 100
.DATA
		STR1 DB 'Enter a digit: $'
		NL DB 10,13,"$"
		RESULT DB ?
		VAL DB ?
.CODE
MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
		
		;--output str1
		MOV AH,09H
		LEA DX,STR1
		INT 21H
		
		;--input val
		MOV AH,01H
		INT 21H
		SUB AL,30H
		MOV VAL,AL
		
		;--output nl
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		;--mul
		MOV AL,VAL
		MUL VAL
		MOV RESULT,AL
		
		;--output result
		MOV AH,02H
		MOV DL,RESULT
		ADD DL,30H
		INT 21H
		
		MOV AX,4c00H
		INT 21H
MAIN ENDP
END MAIN