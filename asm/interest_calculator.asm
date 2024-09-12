section .data
    P_ask db "Enter principal : ", 0
    R_ask db "Enter rate : ", 0
    T_ask db "Enter time : ", 0

    display db "Interest amount : ", 0
    format db "%d", 0
    newline db 10, 0

section .bss
    principal resd 1
    rate resd 1
    time resd 1
    interest resd 1

section .text
    extern printf
    extern scanf
    extern exit
    global _start

_start:
    push dword P_ask
    call printf
    add esp, 4

    push dword principal
    push format
    call scanf
    add esp, 8

    push dword R_ask
    call printf
    add esp, 4

    push dword rate
    push format
    call scanf
    add esp, 8

    push dword T_ask
    call printf
    add esp, 4

    push dword time
    push format
    call scanf
    add esp, 8

    mov eax, [principal]
    mov ebx, [rate]
    imul eax, ebx
    mov ebx, [time]
    imul eax, ebx
    cdq
    mov ebx, 100
    idiv ebx
    mov [interest], eax

    push dword display
    call printf
    add esp, 4

    push dword [interest]
    push format
    call printf
    add esp, 8

    push dword newline
    call printf
    add esp, 4
    
    call exit