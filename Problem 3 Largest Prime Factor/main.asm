; A simple template for assembly programs.
.386  ; Specify instruction set
.model flat, stdcall  ; Flat memory model, std. calling convention
.stack 4096 ; Reserve stack space
ExitProcess PROTO, dwExitCode: DWORD  ; Exit process prototype

.data ; data segment
	toFactor DWORD 600851475143
    x DWORD ?
    y DWORD ?
    d DWORD ?
    xMinusYAbs  DWORD ?
    ans DWORD ?
    

.code ; code segment

main PROC ; main procedure
	
    mainLoop:
    
    whileDEqua1:
        ;x <- g(x)
        ;y <- g(g(y))
        ;d <- gcd(|x-y|, n)
        ;if d = toFactor we fucked up
        ;else return d as ans

    
    whileANotEqualsB:
        ;cmp a and b
        ;if less jmp whileAGreaterB
        ;if greater than jmp whileBGreaterA
        ;cmp a and b
        ;if not equal jmp whileANotEqualsB
        ;else return a as gcd of a and b

    whileAGreaterB:
        ;c = a � b
        ;a = c


    whileBGreateA:
        ;c - b - a
        ;b = c

	INVOKE ExitProcess, 0 ; call exit function
  
main ENDP ; exit main procedure
END main  ; stop assembling



;Do While a <> b
;     Do While a > b
;         c = a � b
;         a = c
;     Loop
;     Do While b > a
;         c = b � a
;         b = c
;     Loop
; Loop

;A is gcd