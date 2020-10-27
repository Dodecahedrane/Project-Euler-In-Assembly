; A simple template for assembly programs.
.386  ; Specify instruction set
.model flat, stdcall  ; Flat memory model, std. calling convention
.stack 4096 ; Reserve stack space
ExitProcess PROTO, dwExitCode: DWORD  ; Exit process prototype

.data ; data segment
	
	sum DWORD ?
	current DWORD ?


.code ; code segment

main PROC ; main procedure
	mov eax, 1
	mov ebx, 2

	increment:
		mov eax,
		mov ebx,
		add eax, ebx
		mov current, eax
		mov 
		
		;check if even
		mov ecx, 2
		div ecx
		xor edx, edx
		cmp edx, 0
		je check
		jmp increment
		


	check:
		;check if more than 4 million
		cmp edx, 4000000
		;if it isnt then add
		jne addToSum
		;if it is jump to done
		jmp done
	
	addToSum:
		mov eax, 

	done:
	INVOKE ExitProcess, 0 ; call exit function
  
main ENDP ; exit main procedure
END main  ; stop assembling