.MODEL SMALL
.STACK 100
.DATA
		NUM DB 4
		CHAR DB 'A'
.CODE
MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
		
		MOV AH,02H
		MOV DL,CHAR
		INT 21H
		
		MOV AH,02H
		MOV DL,NUM
		ADD DL,30H
		INT 21H
		
		MOV AH,02H
		MOV DL,CHAR
		INT 21H
		
		MOV AX,4c00H
		INT 21H
MAIN ENDP
END MAIN