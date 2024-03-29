.MODEL SMALL
.STACK 100
.DATA
	STR1MSG DB "ENTER STRING1: $"
	STR2MSG DB "ENTER STRING2: $"
	NL DB 10,13,"$"
	SAME DB "SAME$"
	DIFF DB "DIFFERENT$"
	
	STR1 LABEL BYTE
	STR1MAXN DB 30
	STR1ACTN DB ?
	ISTR1 DB 30 DUP("$")
	
	STR2 LABEL BYTE
	STR2MAXN DB 30
	STR2ACTN DB ?
	ISTR2 DB 30 DUP("$")
	
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	
	MOV AH,09H
	LEA DX,STR1MSG
	INT 21H
	
	MOV AH,0AH
	LEA DX,STR1
	INT 21H
	
	MOV AH,09H
	LEA DX,NL
	INT 21H
	
	MOV AH,09H
	LEA DX,STR2MSG
	INT 21H
	
	MOV AH,0AH
	LEA DX,STR2
	INT 21H
	
	MOV AH,09H
	LEA DX,NL
	INT 21H
	
	MOV CX,30
	MOV SI,0
COMPARE:
	MOV BL,ISTR1[SI]
	CMP ISTR2[SI],BL
	JNE NOTEQ   ;--not equal
	LOOP COMPARE
	
	;--display same
	MOV AH,09H
	LEA DX,SAME
	INT 21H
	JMP EXIT
	
NOTEQ:
	MOV AH,09H
	LEA DX,DIFF
	INT 21H
	
EXIT:
	MOV AX,4C00H
	INT 21H
	
MAIN ENDP
	END MAIN