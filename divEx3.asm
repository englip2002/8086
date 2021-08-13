.MODEL SMALL
.STACK 100
.DATA	
		n1 DB 7
		n2 DB 9
		n3 DB 4
		TEN DB 10
.CODE
MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
		
		;--MUL
		MOV AL,n2
		MUL n3
		MOV BL, AL
		;--ADD
		ADD BL,n1
		
		;--div with 10
		MOV AH,0   
		MOV AL,BL
		DIV TEN
		MOV BX,AX
		
		;--display quotient
		MOV AH,02H
		MOV DL,BL
		ADD DL,30H
		INT 21H
		
		;--display remainder
		MOV AH,02H
		MOV DL,BH
		ADD DL,30H
		INT 21H
		
		MOV AX,4c00H
		INT 21H
MAIN ENDP
END MAIN