section .data
    ask db "Enter a number : ", 0
    asklen equ $-ask
    display db "the given string is converted to integer : ", 0
    displaylen equ $-display
    format db "%d", 0
    newline db 10, 0

section .bss
    num resb 10
    a resd 1
    result resb 12

section .text
    global _start
    extern atoi, sprintf

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

    mov byte[num + eax - 1], 0
    
    push num
    call atoi
    add esp, 4

    
    mov eax, num
    push eax
    push format
    mov ecx, result
    push ecx
    call sprintf
    add esp, 12

    mov  eax, 4
    mov ebx, 1
    mov ecx, display
    mov edx, displaylen
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 12
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 10
    int 0x80

    mov eax, 1
    mov ecx, 0
    int 0x80    