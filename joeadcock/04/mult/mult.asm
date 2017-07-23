// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Set initial R2 value to 0
@R2
M=0

// Done if R0 == 0
@R0
D=M
@END
D;JEQ

// while R1 > 0, decrement R1 and add R0 to R2
(LOOP)
  // break if R1 == 0
  @R1
  D=M
  @END
  D;JEQ

  // decrement R1
  @R1
  M=D-1

  // R2 += R0
  @R0
  D=M
  @R2
  M=M+D

  @LOOP
  0;JMP

(END)
  @END
  0;JMP
