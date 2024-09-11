section .data
    ask db "Enter a number: ", 0
    asklen equ $-ask

    display db "The sum up to the given number is: ", 0
    displaylen equ $-display

    format db "%d", 0
    newline db 10, 0

section .bss
    num resb 10
    sum resd 1
    ans resb 10

section .text
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

    add byte [num + eax - 1], 0

    push num
    call atoi
    add esp, 4

    mov dword [sum], 0
    mov ecx, eax
    mov ebx, 1

begin:
    cmp ebx, ecx
    jg end

    mov eax, [sum]
    add eax, ebx
    mov [sum], eax

    inc ebx
    jmp begin

end:
    mov eax, 4
    mov ebx, 1
    mov ecx, display
    mov edx, displaylen
    int 0x80

    push dword [sum]
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
    mov edx, 1
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
