; A simple template for assembly programs.
.386  ; Specify instruction set
.model flat, stdcall  ; Flat memory model, std. calling convention
.stack 4096 ; Reserve stack space
ExitProcess PROTO, dwExitCode: DWORD  ; Exit process prototype

.data ; data segment
	
	sum DWORD 2			;because first loop misses first two digits in sequeence
	last DWORD 1
	current DWORD 2


.code ; code segment

main PROC ; main procedure

	increment:
		mov eax, last
		mov ebx, current
		add eax, ebx
		mov ecx, last
		mov last, ebx
		mov current, eax
		
		mov ebx, 2
		mov eax, current
		xor edx, edx			
		div ebx					
		cmp edx, 0
		je check
		jmp increment
		

	check:
		;check if more than 4 million
		cmp current, 4000000
		;if it isnt then add
		jl addToSum
		;if it is jump to done
		jmp done
	
	addToSum:
		mov eax, current
		mov ebx, sum
		add eax, ebx
		mov sum, eax
		jmp increment

	done:
	INVOKE ExitProcess, 0 ; call exit function
  
main ENDP ; exit main procedure
END main  ; stop assembling