.MODEL SMALL
.STACK 100
.DATA
	DNAME DB "AACS"
	DPSW DB "3064"
	INAME DB 4 DUP(0)
	IPSW DB 4 DUP(0)
	STR1 DB 10,13,"USERNAME: $"
	STR2 DB 10,13,"PASSWORD: $"
	VMSG DB 10,13,"ACCESS GRANTED$"
	IMSG DB 10,13,"ACCESS DENIED$"
	COUNT DB 0
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX

START:
	CMP COUNT,3
	JE EXIT
	
	;--OUTPUT STR1
	MOV AH,09H
	LEA DX,STR1
	INT 21H
	
	;--INPUT BYTE
	MOV CX,4 ;LOOP 4 TIMES
	MOV SI,0
	
GETINAME:
	MOV AH,01H   ;07H TO HIDE
	INT 21H
	MOV INAME[SI],AL
	INC SI
	LOOP GETINAME
	
	;--OUTPUT STR2
	MOV AH,09H
	LEA DX,STR2
	INT 21H
	
	;--INPUT BYTE PSW
	MOV CX,4 ;LOOP 4 TIMES
	MOV SI,0
	
GETIPSW:
	MOV AH,01H
	INT 21H
	MOV IPSW[SI],AL
	INC SI
	LOOP GETIPSW

;---------------------------------------
	MOV SI,0
CHECKN:
	CMP SI,4
	JE PRINTV
	MOV BL,DNAME[SI]
	CMP BL,INAME[SI]
	JE CHECKP
	JNE PRINTI

NEXT:
	INC SI
	JMP CHECKN

CHECKP:
	MOV BL,DPSW[SI]
	CMP BL,IPSW[SI]
	JE NEXT
	JNE PRINTI
	
PRINTV:
	MOV AH,09H
	LEA DX,VMSG
	INT 21H
	JMP EXIT

PRINTI:
	MOV AH,09H
	LEA DX,IMSG
	INT 21H
	INC COUNT
	JMP START

EXIT:	
	MOV AX,4C00H
	INT 21H
MAIN ENDP
	END MAIN
	