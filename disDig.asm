.MODEL SMALL
.STACK 100
.DATA
		NUM DB 26
		TEN DB 10
.CODE
MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
		
		;26/10 ->AX/NUM2
		MOV AH,0
		MOV AL,NUM  ;AX=26
		DIV TEN     ;AH=06(Remainder),AL=02(Quotient)
		MOV BX,AX 
		
		;display quotient
		MOV AH,02H
		MOV DL,BL
		ADD DL,30H
		INT 21H
		
		;display remainder
		MOV AH,02H
		MOV DL,BH
		ADD DL,30H
		INT 21H
		
		MOV AX,4c00H
		INT 21H
MAIN ENDP
END MAIN