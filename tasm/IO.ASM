SCAN PROC
  PUSH BX CX DX SI DS

  RESET_SCAN:
    MOV     AH, 3FH          ; Interrupt for input. Result to Address in DX
    MOV     BX, 0            ; Device Handle
    MOV     CX, 10           ; Buffer Size
    MOV     DX, OFFSET GUESS ; Target Address (Result is stored into GUESS!)
    INT     21H  

    MOV     SI, OFFSET GUESS ; Move Source Index to &GUESS
    XOR     BX, BX
    XOR     CX, CX

  PARSE_LOOP:
    
    MOV     CL, [SI]         ; Load Value from SI Address
    
    CMP     CL, 13           ; Return?
    JE      INPUT_SUCCESS    ; Jump if Equal (Zero Flag = 1)
    CMP     CL, 10           ; Linefeed?
    JE      INPUT_SUCCESS

    CMP     CL, 30H          ; Internally: SUB, so Carry Flag is 1
    JB      INPUT_ERROR

    CMP     CL, 39H          ; Carry Flag is 0
    JA      INPUT_ERROR
  
    SUB     CL, 30H          ; ASCII to Number, Result in BX
    MOV     AX, BX           ; Move old number from BX to AX
    MOV     DX, 10
    MUL     DX               ; AX * 10
    MOV     BX, AX
    ADD     BX, CX           ; Add last parsed number

    INC     SI               ; next char
    JMP     PARSE_LOOP

  INPUT_ERROR:
    MOV     AH, 09H
    MOV     DX, OFFSET MSG_ERROR
    INT     21H
    JMP     RESET_SCAN

  INPUT_SUCCESS:
    MOV     AX, BX
    POP     DS SI DX CX BX
    RET
SCAN ENDP

PRINT_NUM PROC
    PUSH    AX BX CX DX
    MOV     CX, 0
    MOV     BX, 10

    DIVIDE_LOOP:
      XOR    DX, DX
      DIV    BX
      PUSH   DX
      INC    CX
      CMP    AX, 0
      JNE    DIVIDE_LOOP

    PRINT_LOOP:
      POP    DX
      ADD    DL, 30H
      MOV    AH, 02H
      INT    21H
      LOOP   PRINT_LOOP

    POP DX CX BX AX
    RET
PRINT_NUM ENDP

