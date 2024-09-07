section .data
    ask db "Enter a number : ", 0
    asklen equ $-ask

    is_even db "even.", 0
    is_even_len equ $ -is_even

    is_odd db "odd." , 0
    is_odd_len equ $-is_odd


section .bss
    num resb 10
    a resd 1

section .text
    extern atoi
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

    mov [num], eax

    mov eax, [num]
    mov edx, 0
    mov ebx, 2
    div eax

    cmp edx, 0
    je even

    mov eax, 4
    mov ebx, 1
    mov ecx, is_odd
    mov edx, is_odd_len
    int 0x80

    jmp exit

even : 
    mov eax, 4
    mov ebx, 1
    mov ecx, is_even
    mov edx, is_even_len
    int 0x80

    jmp exit

exit:
    mov eax, 1
    mov ebx, 0
    int 0x80

    
