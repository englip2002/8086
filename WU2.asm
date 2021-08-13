.MODEL SMALL
.STACK 100
.DATA
		num1 DB 6
		num2 DB 3
		char1 DB '+'
		char2 DB '-'
		char3 DB '='
.CODE
MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
		
		;--show num2
		MOV AH,02H
		MOV DL,num2
		ADD DL,30H
		INT 21H
		
		;--show +
		MOV AH,02H
		MOV DL,char1
		INT 21H
		
		;--show 5 
		MOV AH,02H
		MOV DL,5
		ADD DL,30H
		INT 21H
		
		;--show -
		MOV AH,02H
		MOV DL,char2
		INT 21H
		
		;--show num1
		MOV AH,02H
		MOV DL,num1
		ADD DL,30H
		INT 21H
		
		;--show =
		MOV AH,02H
		MOV DL,char3
		INT 21H
		
		;--calculation
		MOV AH,02H
		MOV DL, num2
		ADD DL,5
		SUB DL,num1
		ADD DL,30H
		INT 21H
		
		MOV AX,4c00H
		INT 21H
MAIN ENDP
END MAIN