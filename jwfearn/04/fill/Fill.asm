// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

  @color   // @color = black (1)
  M=1

  @WHITE   // goto WHITE
  0;JMP

(SCAN)
  // if key goto BLACK

(WHITE)
  @color   // if @color == white (0) goto SCAN
  D=M
  @SCAN
  D;JEQ

  @color   // @color = white (0)
  M=0

(FILL)
  // fill with @color

  @SCAN    // goto SCAN
  0;JMP

(BLACK)
  @color   // if @color != white (0) goto SCAN
  D=M
  @SCAN
  D;JNE

  @color   // @color = black (1)
  M=1

  @FILL    // goto FILL
  0;JMP
