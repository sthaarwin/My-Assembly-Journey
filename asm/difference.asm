section .data
    Ask db "Enter a number : ", 0
    Asklen equ $-Ask

    Display db "the difference is  : ", 0
    Displaylen equ $-Display

    format db "%d", 0
    newline db 10, 0

section .bss
    num resb 10
    a resd 1
    b resd 1
    result resb 12

section .text
    global _start
    extern atoi, sprintf

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, Ask
    mov edx, Asklen
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 10
    int 0x80

    mov byte[num + eax -1], 0
    push num
    call atoi
    add esp, 4

    mov [a], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, Ask
    mov edx, Asklen
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 10
    int 0x80

    mov byte[num + eax - 1], 0
    push num
    call atoi
    add esp, 4

    mov [b], eax

    mov eax, [a]
    mov ebx, [b]
    sub eax, ebx

    push eax
    push format
    mov ecx, result
    push ecx
    call sprintf
    add esp, 12

    mov eax, 4
    mov ebx, 1
    mov ecx, Display
    mov edx, Displaylen
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 12
    int 0x80

    ; mov eax, 4
    ; mov ebx, 1
    ; mov ecx, newline
    ; mov edx, 10
    ; int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
    
