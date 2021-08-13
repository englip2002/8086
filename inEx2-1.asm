.MODEL SMALL
.STACK 100
.DATA
		NUM DB ?
		CHAR DB ? 
		STR1 DB "Enter a digit: $"
		STR2 DB "Enter a Charcter: $"
		NL DB 0DH,0AH,"$"
.CODE
MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
		
		;--output STR1
		MOV AH,09H
		LEA DX,STR1
		INT 21H
		
		;--input num | if int need to SUB AL,30H
		MOV AH,01H
		INT 21H
		SUB AL,30H
		MOV NUM,AL   ;--move to var
		
		;--next line
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		;--output str2
		MOV AH,09H
		LEA DX,STR2
		INT 21H
		
		;--input char | if char no need to SUB AL,30H
		MOV AH,01H
		INT 21H
		MOV CHAR, AL ;--move to var
				
		;--next line
		MOV AH,09H
		LEA DX,NL
		INT 21H
		
		;--print sum
		MOV AH,02H
		;--calculation
		MOV DL,NUM
		ADD DL,CHAR
		INT 21H
		
		MOV AX,4c00H
		INT 21H
MAIN ENDP
END MAIN