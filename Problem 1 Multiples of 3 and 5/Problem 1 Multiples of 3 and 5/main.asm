; A simple template for assembly programs.
.386  ; Specify instruction set
.model flat, stdcall  ; Flat memory model, std. calling convention
.stack 4096 ; Reserve stack space
ExitProcess PROTO, dwExitCode: DWORD  ; Exit process prototype

.data ; data segment
	
	array DWORD 1000 DUP(0h)
	quo DWORD ?
	i DWORD 1
	max DWORD 1000
	sum DWORD ?

.code ; code segment

main PROC ; main procedure

	mov esi, 0

	testFiveThree:

		;div by 5 then test, jump to quoZero if true
		mov ebx, 5
		mov eax, i
		xor edx, edx
		div ebx
		mov quo, edx
		cmp quo, 0
		je remZero

		;div by 3 then test, jump to quoZero if true
		mov ebx, 3
		mov eax, i
		xor edx, edx
		div ebx
		mov quo, edx
		mov ecx, 0
		cmp ecx, quo
		je remZero
	    
		jmp increment

	increment:

		;increment i then jump to test if equal to max or jump to done if not
		inc i
		mov edx, i
		cmp edx, max
		je clearRegs
		jmp testFiveThree
		

	remZero:

		;incrment cnt then append to array
		lea ebx, array
		mov edx, i
		mov [ebx + TYPE array * esi], edx
		inc esi
		jmp increment

	clearRegs:
		mov edx, esi
		mov esi, 0
		jmp sumAll

	sumAll:

		;sum all items in array
		
		mov ecx, sum
		lea ebx, array
		mov eax, [ebx + TYPE array * esi]
		add eax, ecx
		mov sum, eax
		inc esi
		cmp esi, max
		jne sumAll
		jmp done

	done:
	INVOKE ExitProcess, 0 ; call exit function
  
main ENDP ; exit main procedure
END main  ; stop assembling