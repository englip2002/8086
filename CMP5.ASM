.MODEL SMALL
.STACK 100
.DATA
	ICODE DB ?
	IMSG DB "ENTER A CHARACTER: $"
	VMSG DB "VOVEL$"
	CMSG DB "CONSONANT$"

	NL DB 10,13,"$"
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	
	MOV AH,09H
	LEA DX,IMSG
	INT 21H
	
	MOV AH,01H
	INT 21H
	MOV ICODE, AL
	
	MOV AH,09H
	LEA DX,NL
	INT 21H
	
	CMP ICODE,'a'
	JE VOVEL
	
	CMP ICODE,'e'
	JE VOVEL
	
	CMP ICODE,'i'
	JE VOVEL
	
	CMP ICODE,'o'
	JE VOVEL
	
	CMP ICODE,'u'
	JE VOVEL
	
	MOV AH,09H
	LEA DX,CMSG
	INT 21H
	JMP EXIT
	
VOVEL:
	MOV AH,09H
	LEA DX,VMSG
	INT 21H
	JMP EXIT
	
	
EXIT:
	MOV AX,4C00H
	INT 21H
	
MAIN ENDP
	END MAIN