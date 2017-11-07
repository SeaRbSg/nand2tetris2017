// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

  @pattern // @pattern = black (-1 == 0b1111111111111111 == 16 black pixels)
  M=-1
  @WHITE   // goto WHITE
  0;JMP

(SCAN)
  @KBD     // if KBD != 0 goto BLACK
  D=M
  @BLACK
  D;JNE
  @WHITE   // else goto WHITE
  0;JMP

(FILL)
  @8191    // sizeof(SCREEN) - 1 == (256 * 512 / 16) - 1 == 8191
  D=A      // @p = SCREEN + sizeof(SCREEN) - 1
  @SCREEN
  D=D+A
  @p
  M=D
(LOOP)
  @pattern // *p = @pattern
  D=M
  @p
  A=M
  M=D
  @SCREEN  // goto SCAN if p == SCREEN
  D=A
  @p
  D=M-D
  @SCAN
  D;JEQ
  @p       // p--
  M=M-1
  @LOOP    // goto LOOP
  0;JMP

(WHITE)
  @pattern // if @pattern == white (0) goto SCAN
  D=M
  @SCAN
  D;JEQ
  @pattern // @pattern = white (0)
  M=0
  @FILL    // goto FILL
  0;JMP

(BLACK)
  @pattern // if @pattern != white (0) goto SCAN
  D=M
  @SCAN
  D;JNE
  @pattern // @pattern = black (-1)
  M=-1
  @FILL    // goto FILL
  0;JMP
