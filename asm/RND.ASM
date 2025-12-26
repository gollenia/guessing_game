RND PROC
  PUSH    BX CX DX ES
  MOV     AX, 40H
  MOV     ES, AX        ; BIOS Data Area in ES
  MOV     AX, ES:[6Ch]  ; Timestamp into AX
  XOR     DX, DX        ; DX to 0

  MOV     BX, 100       ; BX to 100
  DIV     BX            ; divide BX by AX, Rest (1-99) in DX
  MOV     AX, DX
  POP     ES DX CX BX
  RET
RND ENDP

