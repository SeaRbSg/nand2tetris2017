// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

@newpattern    // force initial white fill
D=0
M=D
@pattern       // pattern = !newpattern
M=!D
@UPDATE        // goto UPDATE
0;JMP

(SCAN)
  @KBD         // newpattern = black if KBD != 0
  D=M
  @newpattern
  M=-1         // black (-1 == 16 black pixels)
  @UPDATE      // goto UPDATE
  D;JNE
  @newpattern  // newpattern = white
  M=0          // white (0 == 16 white pixels)
  @UPDATE      // goto UPDATE
  0;JMP

(FILL)
  @8191        // sizeof(SCREEN) - 1 == (256 * 512 / 16) - 1 == 8191
  D=A          // p = SCREEN + sizeof(SCREEN) - 1
  @SCREEN
  D=D+A
  @p
  M=D
(LOOP)
  @pattern     // *p = pattern
  D=M
  @p
  A=M
  M=D
  @SCREEN      // goto SCAN if p == SCREEN
  D=A
  @p
  D=M-D
  @SCAN
  D;JEQ
  @p           // p--
  M=M-1
  @LOOP        // goto LOOP
  0;JMP

(UPDATE)
  @pattern     // goto SCAN if newpattern == pattern
  D=M
  @newpattern
  D=M-D
  @SCAN
  D;JEQ
  @newpattern
  D=M
  @pattern     // pattern = newpattern
  M=D
  @FILL        // goto FILL
  0;JMP
