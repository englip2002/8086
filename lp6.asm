.MODEL SMALL
.STACK 100
.DATA
	NUM DB 1
	TOTAL DB 0
	TEN DB 10
	
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX

	MOV CL,6
	MOV CH,0
DISPLAYNUM:
	MOV AH,02H
	MOV DL,NUM
	ADD TOTAL,DL
	ADD DL,30H
	INT 21H
	INC NUM
	LOOP DISPLAYNUM
	
	
;--NL
	
;--DISPLAY 2 NUM
	MOV AL,TOTAL
	MOV AH,0
	DIV TEN
	MOV BX,AX

;--DISPLAY 2 DIGIT
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