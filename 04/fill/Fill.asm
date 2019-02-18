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

(START)
//Set Location to first screen value
@SCREEN
D=A
@Location
M=D
// Is keyboard pressed
@KBD
D=M
//If so turn black
@BLACKLOOP
D;JGT
//If not turn white
@WHITELOOP
D;JEQ


(BLACKLOOP)
//Go to location and turn black
@Location
D=M
A=D
M=-1
//Go to next address
@Location
D=M
M=D+1
D=M
//Check if loop is done
@KBD
D=A-D
@BLACKLOOP
D;JGT

(WHITELOOP)
@Location
D=M
A=D
M=0
//Increment
@Location
D=M
M=D+1
D=M
@KBD
D=A-D
@WHITELOOP
D;JGT

@START
0;JMP