// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// @color=black (1)
// goto WHITE
(SCAN)
  // if key goto BLACK
(WHITE)
  // if @color=white goto SCAN
  // @color=white (0)
(FILL)
  // fill with @color
  // goto SCAN
(BLACK)
  // if @color=black goto SCAN
  // @color=black (1)
  // goto FILL
