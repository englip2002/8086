.MODEL SMALL
.STACK 100
.DATA
	n1 DB 5
	n2 DB 4
	n3 DB 8
	TEN DB 10
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	
	;(n1+n2)*n3-n2
	MOV AL,n1
	ADD AL,n2
	
	MOV BL,n3
	MUL BL
	
	SUB AL,n2
	
	;Display
	MOV AH,0H
	DIV TEN
	MOV BX,AX
	
	MOV AH,02H
	MOV DL,BL
	ADD DL,30H
	INT 21H
	
	MOV AH,02H
	MOV DL,BH
	ADD DL,30H
	INT 21H

	MOV AX,4C00H
	INT 21H
MAIN ENDP
	END MAIN