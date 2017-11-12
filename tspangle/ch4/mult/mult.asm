// This script will take two inputs stored at R0 and R1, multipy them, 
//   and store the results in R2. To perform this operation we will treat R0 
//   as the counter and set the total, R2, to 0. If the counter is 0 then
//   we will jump to the end. Otherwise, we add R1 to the total and decrement
//   the counter.

// Set the total to 0
  @R2
  M=0

(STEP)
  // GoTo End when counter is 0
   @R0
   D=M
   @END
   D;JEQ

   //add R1 to total (R2)
     // Get R2, the total.
   @R2
   D=M
 
     // Add R1 to it.
   @R1
   D=D+M
 
     // Write result back to R2.
   @R2
   M=D

   // Reduce counter
   @R0
   D=M-1
   M=D

   @STEP
   0;JMP // GoTo begining
(END)
   @END
   0;JMP
