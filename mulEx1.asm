.MODEL SMALL
.STACK 100
.DATA
		RESULT DB ?
		VAL DB 2
.CODE
MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
		
		MOV AL,VAL
		MUL VAL
		MUL VAL
		MOV RESULT, AL
		
		MOV AH,02H
		MOV DL,RESULT
		ADD DL,30H
		INT 21H
		
		MOV AX,4c00H
		INT 21H
MAIN ENDP
END MAIN