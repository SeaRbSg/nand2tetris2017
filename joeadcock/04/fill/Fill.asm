// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(MAIN_LOOP)
  @24576          // read keyboard
  D=M

  @BLACKEN_SCREEN // if keypress, BLACKEN_SCREEN()
  D;JGT

  @WHITEN_SCREEN  // else, WHITEN_SCREEN()
  0;JMP

  (MAIN_LOOP_CONT)

  @MAIN_LOOP
  0;JMP

(BLACKEN_SCREEN)
  @color  // color = -1
  M=-1

  @FILL_SCREEN
  0;JMP

(WHITEN_SCREEN)
  @color  // color = 0
  M=0

  @FILL_SCREEN
  0;JMP

(FILL_SCREEN)
  @8192  // i = 8192
  D=A
  @i
  M=D

  (FILL_SCREEN_LOOP)
    @i      // i -= 1
    MD=M-1

    @SCREEN // fill in RAM[SCREEN + i] with color
    D=A+D
    @cell
    M=D

    @color
    D=M
    @cell
    A=M
    M=D

    @i      // loop while i > 0
    D=M
    @FILL_SCREEN_LOOP
    D;JGT

    @MAIN_LOOP_CONT
    0;JMP
