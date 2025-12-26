.MODEL SMALL
.STACK 100H

.DATA
  
  COUNT     DW 0
  NUM       DW ?
  GUESS     DB 20 DUP(?)
  MSG_HELLO DB 13, 10, "Welcome to the Guessing Game.$"
  MSG_INSTR DB 13, 10, "Guess the secret number: $"
  MSG_ERROR DB 13, 10, "Only numbers are allowed"
  MSG_LOW   DB 13, 10, "Too low. Guess higher!$"
  MSG_HIGH  DB 13, 10, "Too high. Guess lower!$"
  MSG_WIN   DB 13, 10, "You win! You needed $"
  MSG_WINE  DB " guesses. Play again? (y/n) $"
  MSG_BYE   DB 13, 10, "Good bye!$"

.CODE

START:
  MOV   AX, @DATA
  MOV   DS, AX

  MOV   DX, OFFSET MSG_HELLO
  MOV   AH, 09H
  INT   21H

  NEW_GAME:
  
    MOV   COUNT, 0
    CALL  RND
    MOV   NUM, AX
    
  THE_LOOP:
    MOV   DX, OFFSET MSG_INSTR
    MOV   AH, 09H
    INT   21H  

    CALL  SCAN
    INC   COUNT
    CMP   AX, NUM
    JE    WIN
    JA    TOO_HIGH
    JB    TOO_LOW

    TOO_HIGH:
      MOV    AH, 09H
      MOV    DX, OFFSET MSG_HIGH
      INT    21H
      JMP    THE_LOOP

    TOO_LOW:
      MOV    AH, 09H
      MOV    DX, OFFSET MSG_LOW
      INT    21H
      JMP    THE_LOOP

    WIN:
      MOV    AH, 09H
      MOV    DX, OFFSET MSG_WIN
      INT    21H
      MOV    AX, COUNT
      CALL   PRINT_NUM
      MOV    AH, 09H
      MOV    DX, OFFSET MSG_WINE
      INT    21H 

    RETRY:
      MOV    AH, 01H
      INT    21H

      CMP    AL, 79H
      JZ     NEW_GAME

      CMP    AL, 6EH   
      JZ     QUIT
      JMP    RETRY

    QUIT:

      MOV    AH, 09H
      MOV    DX, OFFSET MSG_BYE
      INT    21H

      MOV    AH, 4CH
      MOV    AL, 0
      INT    21H

INCLUDE IO.ASM
INCLUDE RND.ASM

END START
