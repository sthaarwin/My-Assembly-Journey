section .data
    count db 0 , 0
    num db 10
    newline db 10

section .text   
    global _start


_start:

    begin_loop:

        mov al , [count]
        add al, '0'
        mov[num], al

        mov eax, 4
        mov ebx, 1
        mov ecx, num
        mov edx, 10
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, newline
        mov edx, 10
        int 0x80

        inc byte[count]

        cmp byte[count], 10
        jne begin_loop

    mov eax, 1
    mov ebx, 0
    int 0x80