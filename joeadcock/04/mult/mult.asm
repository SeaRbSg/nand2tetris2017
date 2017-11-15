// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// R2 = 0
@0
D=A
@R2
M=D

// i = R0
@R0
D=M
@i
M=D

// while i > 0
(LOOP)
  @i
  D=M
  @END
  D;JEQ

  // R2 = R2 + R1
  @R1
  D=M
  @R2
  M=D+M

  //i = i - 1
  @i
  MD=M-1

  @LOOP
  0;JMP

(END)
@END
0;JMP
