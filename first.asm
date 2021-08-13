.MODEL SMALL
.STACK 100
.DATA

		VAL1 DB 6
		VAL2 DB 3
		VAL3 DB 4
		RESULT DB ?
.CODE
MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
		
		;----save into register
		MOV BH,VAL2

		;----do calculation
		ADD BH,5
		SUB BH,VAL1
		ADD BH,VAL3
		
		;----CONVERT NUMBER TO ASCII
		MOV RESULT,BH
		ADD RESULT,30H
		
		;----DISPLAY ASCII
		MOV AH,02H  ;--AH is fixed and 02H is the function to display,03H,08H etc have diff func
		MOV DL,RESULT  ;--move to DL as when display it will find from DL
		INT 21H   ;--fixed to run the function
		
		;----STOP PROGRAM
		MOV AX,4C00H
		INT 21H
MAIN ENDP
END MAIN