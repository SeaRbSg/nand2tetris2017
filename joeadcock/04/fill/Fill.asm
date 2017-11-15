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

@key_pressed
M=0

(KEYBOARD_LOOP)
  // @last_key_pressed = @key_pressed
  @key_pressed
  D=M
  @last_key_pressed
  M=D

  // @key_pressed = KEYBOARD
  @24576
  D=M
  @key_pressed
  M=D

  // next unless last_keypress != key_pressed
  @last_key_pressed
  D=M
  @key_pressed
  D=M-D
  @KEYBOARD_LOOP
  D;JEQ

  @key_pressed
  D=M

  // if key_pressed fill_black()
  @FILL_BLACK
  D;JNE

  // else fill_white()
  @FILL_WHITE
  D;JEQ

(FILL_BLACK)
  // @fill = black
  @fill
  M=-1

  // fill()
  @FILL
  0;JMP

(FILL_WHITE)
  // @fill = white
  @fill
  M=0

  // fill()
  @FILL
  0;JMP

(FILL)
  // i = 8192
  @8192
  D=A
  @i
  M=D

  // block = @SCREEN
  @SCREEN
  D=A
  @block
  M=D

  // while i > 0
(FILL_LOOP)
  @i
  D=M
  @KEYBOARD_LOOP
  D;JEQ

  // block = fill
  @fill
  D=M
  @block
  A=M
  M=D

  // @block + 1
  @block
  M=M+1

  // i = i-1
  @i
  M=M-1

  @FILL_LOOP
  0;JMP

(END)
@END
0;JMP
