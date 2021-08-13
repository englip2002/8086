.MODEL SMALL
.STACK 100
.DATA	
		num1 DB ?
		num2 DB ?
		TEN DB 10
		result DB ?
		str1 DB "Please enter 1st digit: $"
		str2 DB "Please enter 2st digit: $"
		str3 DB "Total= $"
		NL DB 10,13,"$"
.CODE
MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
		
		;--print str1
		MOV AH,09H
		LEA DX,str1
		INT 21H
		
		;--enter num1
		MOV AH,01H
		INT 21H
		SUB AL,30H
		MOV num1,AL
		
		;--print NL
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		;--print str2
		MOV AH,09H
		LEA DX,str2
		INT 21H
		
		;--enter num2
		MOV AH,01H
		INT 21H
		SUB AL,30H
		MOV num2,AL
		
		;--print NL
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		;--cal mul
		MOV AL,num1
		MUL num2
		MOV result,AL
		
		;--display 2 num (div)
		MOV AH,0
		MOV AL,result
		DIV TEN
		MOV BX,AX
		
		;--display
		MOV AH,02H
		MOV DL,BL   ;(Quotient)
		ADD DL,30H
		INT 21H
		
		MOV AH,02H
		MOV DL,BH   ;(Remainder)
		ADD DL,30H
		INT 21H
		
		MOV AX,4c00H
		INT 21H
MAIN ENDP
END MAIN
		