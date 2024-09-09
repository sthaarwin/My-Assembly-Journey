section .data
    prompt db "Enter a number (n): ", 0
    prompt_len equ $-prompt

    newline db 10, 0

    result_msg db "The sum is: ", 0
    result_len equ $-result_msg

section .bss
    n resb 4
    sum resb 4
    input resb 10

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 10
    int 0x80

    mov eax, input
    sub eax, '0'
    mov [n], eax

    xor eax, eax
    mov [sum], eax

    mov ecx, [n]
    xor ebx, ebx

calc_sum:
    add ebx, ecx
    dec ecx
    jnz calc_sum

    mov [sum], ebx

    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, result_len
    int 0x80

    mov eax, [sum]
    add eax, '0'
    mov [sum], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, sum
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
