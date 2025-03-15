00010  IDENTIFICATION DIVISION.
00020  PROGRAM-ID. guess.
00030  AUTHOR. .Thomas Gollenia.
00040  DATE-WRITTEN.  15/03/2025.
00050  DATE-COMPILED. 15/03/2025.
00060  DATA DIVISION.
00070      WORKING-STORAGE SECTION.
00080      01  guess-number PIC 9(2) VALUE 0.
00090      01  random-number PIC 9(2) VALUE 0.
00100      01  tries PIC 9(2) VALUE 0.
00111      01  win-msg PIC X(80).
00112      01  tries-string PIC X(2).
00120      01  again PIC X VALUE 'y'.
00110  PROCEDURE DIVISION.
00130       PERFORM UNTIL again = 'n'
00140           PERFORM GUESS-GAME
00150           DISPLAY 'Would you like to play again? (y/n)'
00160           ACCEPT again
00170       END-PERFORM.
00080       DISPLAY "Goodbye!"
00180       STOP RUN.

00121   GUESS-GAME.
00210       DISPLAY 'Welcome to the number guessing game!'
00220       DISPLAY 'I have chosen a number between 1 and 100.'
00230       DISPLAY 'Can you guess what it is?'
00240       ACCEPT random-number FROM TIME.
00250       COMPUTE random-number = FUNCTION MOD(random-number, 100) + 1.
00260       MOVE 0 TO tries. *> Reset Versuchszähler

00270       PERFORM UNTIL guess-number = random-number
00280           ADD 1 TO tries
00290           DISPLAY 'Enter your guess: '
00300           ACCEPT guess-number
00310           IF guess-number < random-number
00320               DISPLAY 'Too low!'
00330           ELSE IF guess-number > random-number
00340               DISPLAY 'Too high!'
00350           END-IF
00360       END-PERFORM.

00370       MOVE tries TO tries-string.
00371       INSPECT tries-string REPLACING LEADING '0' BY ' '.
00380       MOVE FUNCTION TRIM(tries-string) TO tries-string.

00390       STRING 'Congratulations! You guessed the number in ' 
00400              tries-string 
00410              'tries.'
00420           DELIMITED BY SIZE 
00430           INTO win-msg.
00440       DISPLAY win-msg.
