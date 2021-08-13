.MODEL SMALL
.STACK 100
.DATA	
		str1 DB "Enter a digit(0-9): $"
		NL DB 10,13,"$"
		TWO DB 2
		TEN DB 10
		result DB ?
.CODE
MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
		
		;--print message
		MOV AH,09H
		LEA DX,str1
		INT 21H
		
		;--input digit
		MOV AH,01H
		INT 21H
		SUB AL,30H
		
		;--MUL
		MUL TWO
		MOV result,AL
		
		;--display 2 num (div)
		MOV AH,0
		MOV AL,result
		DIV TEN
		MOV BX,AX
		
		;--print NL
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		;--print result
		MOV AH,02H
		MOV DL,BL
		ADD DL,30H
		INT 21H
		
		MOV AH,02H
		MOV DL,BH
		ADD DL,30H
		INT 21H
		
		MOV AX,4c00H
		INT 21H
MAIN ENDP
END MAIN
		