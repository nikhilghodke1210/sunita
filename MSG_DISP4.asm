  .MODEL SMALL
  .DATA
     MSG1 DB 10,13,"ENTER VALUE1:$" 
     MSG2 DB 10,13,"ENTER VALUE2:$"
     
     .CODE
     MOV AX,@DATA
     MOV DS,AX
     
     MOV AH,09H
     LEA DX,MSG1
     INT 21H    
     
     
     MOV AH,01H
     INT 21H
     
     CMP AL,39H    ;COMPARE VALUE OF AL WITH 39H
     JBE X1          ;CONDITIONAL JUMP TO GIVEN LABEL NAME BELOW OR EQUAL WHICH CAN BE KNOWN FROM PREVIOUS COMPARISION INSTRUCTION
     
     SUB AL,07H
     X1:SUB AL,30H 
     
     MOV BH,AL
     
     
     MOV AH,09H
     LEA DX,MSG2
     INT 21H  
     
     CMP BH,09
     JBE X2
     
     ADD BH,07H
     X2:ADD BH,30H
     
     
     
     MOV AH,02H 
     MOV DL,BH
     INT 21H
     
     MOV AH,4CH
     INT 21H
     END