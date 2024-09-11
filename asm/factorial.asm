section .data
    ask db "Enter a number : ", 0 
    asklen equ $- ask

    display db "the factorial is : ", 0
    displaylen equ $-display

    format db"%d", 0
    newline db 10, 0

section .bss
    num resb 10
    fact resb 10
    ans resb 10

section .data
    extern atoi
    extern sprintf
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, ask
    mov edx, asklen
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 10
    int 0x80

    add byte[num + eax - 1], 0
    push num
    call atoi
    add esp, 4

    mov dword[fact], 1

    mov ecx, eax
    mov ebx, 1

    begin:
        cmp ebx, ecx
        jg end

        mov eax, [fact]
        mul ebx
        mov [fact], eax
        inc ebx
        jmp begin

    end:
        mov eax, 4
        mov ebx, 1
        mov ecx, display
        mov edx, displaylen
        int 0x80

       push dword[fact]
       push format
       push ans
       call sprintf
       add esp, 12


        mov eax, 4
        mov ebx, 1
        mov ecx, ans
        mov edx, 10
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, newline
        mov edx, 10
        int 0x80

        mov eax, 1
        mov ebx, 0
        int 0x80