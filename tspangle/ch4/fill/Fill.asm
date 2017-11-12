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

@8192 // (512 * 32) / 16
D=A
@MAX_SCREEN
M=D

(START)
 // Init
 //   PIXEL is the current pixel/location. We start with it set to @SCREEN
 @SCREEN
  D=A
  @PIXEL
  M=D

  @PAINT
  0;JMP

(PAINT)
  // Decide what color to paint the pixel.
  @KBD //keyboard input
  D=M

  @PIXEL
  A=M
  @WHITE  // 0 for no input, paint it white
  D;JEQ

  @BLACK  // else, paint it black.
  0;JMP

(WHITE)
  @PIXEL
  A=M
  M=0
  
  @NEXT
  0;JMP

(BLACK)
  @PIXEL
  A=M
  M=-1
  
  @NEXT
  0;JMP

(NEXT)
  // Increment pixel and set. If 
  @PIXEL
  D=M+1
  M=D

  @MAX_SCREEN
  D=D-M
  
  @START
  D;JEQ

  @PAINT
  0;JMP
