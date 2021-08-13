.MODEL SMALL
.STACK 100
.DATA
		Divident DB ?
		Divisor DB ?
		StrDivident DB "Divident: $"
		StrDivisor DB "Divisor: $"
		StrQuotient DB "Quotient: $"
		StrRemainder DB "Remainder: $"
		NL DB 13,10,"$"
		
.CODE
MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
		
		;--display strDivident
		MOV AH,09H
		LEA DX,StrDivident
		INT 21H
		
		;--INPUT DIVIDENT
		MOV AH,01H
		INT 21H
		SUB AL,30H
		MOV Divident,AL
		
		;--display NL
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		;--display strDivisor
		MOV AH,09H
		LEA DX,StrDivisor
		INT 21H
		
		;--INPUT Divisor
		MOV AH,01H
		INT 21H
		SUB AL,30H
		MOV Divisor,AL
		
		;--display NL
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		;--DIV
		MOV AH,0
		MOV AL,Divident
		DIV Divisor
		MOV BX,AX

		;--display StrQuotient
		MOV AH,09H
		LEA DX,StrQuotient
		INT 21H
		
		;--display Quotient
		MOV AH,02H
		MOV DL,BL
		ADD DL,30H
		INT 21H
		
		;--display NL
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		;--display StrRemainder
		MOV AH,09H
		LEA DX,StrRemainder
		INT 21H
		
		;--display remiander
		MOV AH,02H
		MOV DL,BH
		ADD DL,30H
		INT 21H
		
		MOV AX,4c00H
		INT 21H
MAIN ENDP
END MAIN