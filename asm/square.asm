section .data
    ask db "Enter a number : ", 0
    formatin db "%d", 0

    newline db 10, 0

    display db "The square is : ", 0
    formatout db "%d", 0

section .bss
    num resd 1

section .text
    global _start
    extern printf
    extern scanf
    extern exit

_start: 
    push dword ask
    call printf
    add esp, 4

    push dword num
    push dword formatin
    call scanf
    add esp, 8

    mov eax, [num]
    imul eax, eax
    mov [num], eax

    push dword display
    call printf
    add esp, 4

    push dword [num]
    push dword formatout
    call printf
    add esp, 8

    push dword newline
    call printf
    add esp, 4

    call exit
