section .data
    msg db "hello world", 0
    newline db 10, 0
    msglen equ $-msg
    newline_len equ $-newline

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msglen
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, newline_len
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
