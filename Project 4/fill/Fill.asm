// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.
// pseudocode:
// n = 8192
// LOOP:
//     if(KBD > 0) goto BLACK
//     goto LOOP
// BLACK:
//     b = 0
//     BLACKLOOP:
//         if (b == n) goto WAIT
//         screen + b = -1
//         b = b + 1
//         goto BLACKLOOP   
// WAIT:
//     if(KBD == 0) goto WHITE
//     goto WAIT
// WHITE:
//     w = 0
//     WHITELOOP:
//         if (w == n) goto LOOP
//         screen + w = -1
//         w = w + 1
//         goto WHITELOOP

@8192
D = A
@n
M = D
(LOOP)
    @KBD
    D = M
    @BLACK
    D; JGT
    @LOOP
    0; JMP
(BLACK)
    @b
    M = 0
(BLACKLOOP)
    @b
    D = M
    @n
    D = D - M
    @WAIT
    D; JEQ
    @b
    D = M
    @SCREEN
    A = A + D
    M = -1
    @b
    M = M + 1
    @BLACKLOOP
    0; JMP
(WAIT)
    @KBD
    D = M
    @WHITE
    D; JEQ
    @WAIT
    0; JMP
(WHITE)
    @w
    M = 0
(WHITELOOP)
    @w
    D = M
    @n
    D = D - M
    @LOOP
    D; JEQ
    @w
    D = M
    @SCREEN
    A = A + D
    M = 0
    @w
    M = M + 1
    @WHITELOOP
    0; JMP