// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

  @0       // i = R0
  D=M
  @i
  M=D

  @2       // R2 = 0
  M=0

(LOOP)
  @i       // goto END if i == 0
  D=M
  @END
  D;JEQ

  @1       // R2 += R1
  D=M
  @2
  M=M+D

  @i       // i--
  M=M-1

  @LOOP    // goto LOOP
  0;JMP

(END)
