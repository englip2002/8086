.MODEL SMALL
.STACK 100
.DATA
		num1 DB 19
		num2 DB 3
		num3 DB 5
		result DB ?
.CODE
MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
		
		;--mul num2 and num3
		MOV AL,num2
		MUL num3
		MOV result,AL
		
		;--sub num1 with result
		MOV DL,num1
		SUB DL,result
		
		;--output
		MOV AH,02H
		ADD DL,30H
		INT 21H
		
		
		MOV AX,4c00H
		INT 21H
MAIN ENDP
END MAIN