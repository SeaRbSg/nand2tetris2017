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
(BEGIN)
    @SCREEN
    D=A         // D=SCREEN
    @position
    M=D         // position=D
    @24576      // SCREEN + 32 * 256 number of 16 bit pixel lines
    D=A         // D=max
    @max
    M=D         // i=maximum
    @draw       // draw=0
    M=0
(READ)
    @KBD
    D=M
    @DRAW       // GOTO DRAW if kbd eq 0
    D;JEQ
    @draw       // set draw=-1
    M=-1
(DRAW)
    @draw       // D=draw
    D=M
    @position
    A=M         // move to position
    M=D         // set position value to draw
    @position
    MD=M+1      // Advance position
    @max
    D=M-D       // D=max-D
    @BEGIN      // GOTO BEGIN if max-position eq 0
    D;JEQ
    @READ       // GOTO READ
    0;JMP
