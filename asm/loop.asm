section .data

    count db 0

    msg db "Hello world" , 0
    msglen equ $-msg

    newline db 10, 0

section .text
    global _start

_start:


    begin_loop:
        inc byte[count]
        mov eax, 4
        mov ebx, 1
        mov ecx, msg
        mov edx, msglen
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, newline
        mov edx, 1
        int 0x80

        cmp byte[count], 10
        jne begin_loop
    
    mov eax, 1
    xor ebx, ebx
    int 0x80


