; A simple template for assembly programs.
.386  ; Specify instruction set
.model flat, stdcall  ; Flat memory model, std. calling convention
.stack 4096 ; Reserve stack space
ExitProcess PROTO, dwExitCode: DWORD  ; Exit process prototype

.data ; data segment
	
	arr DWORD ?
	rem DWORD ?
	quo DWORD ?
	i DWORD 1
	cnt DWORD ?
	max DWORD 1000
	sum DWORD ?

.code ; code segment

main PROC ; main procedure

	mov ebx, 5
	mov ecx, 3

	testFiveThree:

		;div by 5 then test, jump to quoZero if true
		mov eax, i
		div ebx
		mov quo, edx
		cmp quo, 0
		je quoZero

		;div by 3 then test, jump to quoZero if true
		mov eax, i
		div ecx
		mov quo, edx
		mov ecx, 0
		cmp ecx, quo
		je quoZero
	    
		jmp increment

	increment:

		;increment i then jump to test if equal to max or jump to done if not
		inc i
		mov edx, i
		cmp edx, max
		je testFiveThree
		jmp done

	quoZero:

		;incrment cnt then append to array
		inc cnt
		lea ebx, arr
		mov [ebx + TYPE arr * cnt], i
		jmp increment

	done:
	INVOKE ExitProcess, 0 ; call exit function
  
main ENDP ; exit main procedure
END main  ; stop assembling