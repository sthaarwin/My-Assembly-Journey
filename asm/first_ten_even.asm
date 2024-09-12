section .data
    count db 0         
    num db 0          
    newline db 10     

section .bss
    num_str resb 5    

section .text
    global main

main:
    mov byte [count], 0     

print_even_numbers:
    mov al, [count]         
    shl al, 1               
    mov [num], al           

    mov ecx, num            
    call convert_to_ascii

    mov eax, 4              
    mov ebx, 1              
    mov edx, 5              
    int 0x80

    mov eax, 4              
    mov ebx, 1              
    mov ecx, newline        
    mov edx, 1              
    int 0x80

    inc byte [count]

    cmp byte [count], 10
    jl print_even_numbers

    mov eax, 1              
    xor ebx, ebx            
    int 0x80

convert_to_ascii:
    movzx eax, al           
    mov edi, num_str        
    add edi, 4              
    mov byte [edi], 0       
    dec edi                 

convert_loop:
    movzx edx, al           
    mov ecx, 10             
    div ecx                 
    add dl, '0'             
    mov [edi], dl           
    dec edi                 
    test eax, eax           
    jnz convert_loop        

    ret
