

.MODEL SMALL

PROMPT MACRO MSG
    MOV AH,09H
    LEA DX,MSG
    INT 21H
ENDM

.DATA
MSG1 DB 10,13,"ENTER 5 ELEMENTS IN TO THE ARRAY:$"
MSG2 DB 10,13,"THE ENTERED ELEMENTS ARE:$"
MSG3 DB 10,13,"AA-GRADE$"
MSG4 DB 10,13,"AB-GRADE$"
MSG5 DB 10,13,"BB-GRADE$"
MSG6 DB 10,13,"BC-GRADE$"
MSG7 DB 10,13,"CC-GRADE$"
MSG8 DB 10,13,"CD-GRADE$"  
MSG9 DB 10,13,"DD-GRADE$"
MSG10 DB 10,13,"FF-GRADE$"

ARR DB 05 DUP(0)  
SUM DW 00H

.CODE
MOV AX,@DATA
MOV DS,AX


PROMPT MSG1

LEA SI,ARR
MOV CL,05

L1:
CALL ACCEPT
MOV [SI],BL

INC SI
DEC CL
JNZ L1


PROMPT MSG2


LEA SI,ARR
MOV CL,05

L2:
MOV BL,[SI]
CALL DISP


INC SI
DEC CL
JNZ L2    


LEA SI,ARR
MOV CL,05

L3:
MOV BL,[SI]
MOV BH,00H
ADD SUM,BX


INC SI
DEC CL
JNZ L3 

MOV BL,05 
MOV AX,00H
MOV AX,SUM
DIV BL

CMP AL,5AH
JB LAB
PROMPT MSG3
JMP EXIT 

LAB:
;CMP AL,50H
;JB LBB
PROMPT MSG4


EXIT:
MOV AH,4CH
INT 21H
 
 
 
ACCEPT PROC

MOV AH,01H
INT 21H

CMP AL,39H
JBE X1
SUB AL,07H
X1:SUB AL,30H

MOV BL,AL
ROL BL,04H

MOV AH,01H
INT 21H

CMP AL,39H
JBE X2
SUB AL,07H
X2:SUB AL,30H

ADD BL,AL 

RET
ENDP



 
DISP PROC
MOV DL,BL
ROL DL,04H
AND DL,0FH

CMP DL,09H
JBE X3
ADD DL,07H
X3:ADD DL,30H

MOV AH,02H
INT 21H   

MOV DL,BL
AND DL,0FH

CMP DL,09H
JBE X4
ADD DL,07H
X4:ADD DL,30H

MOV AH,02H
INT 21H  

RET
ENDP

END


