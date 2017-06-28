// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[3], respectively.)

        @R2  // Initialize R2 to zero
        M=0

// Start multiplication

(LOOP)
  // If R0 is 0 then jump to end
  @R0
  D=M
  @END
  D;JLE
        
  @R1 // Add R1 to R2
  D=M

  @R2
  M=D+M

  // Decrement R0
  @R0
  M=M-1
  D=M

  // Otherwise jump back to the start of the multiplication
  @LOOP
  0;JMP

(END)
   @END
   0;JMP
