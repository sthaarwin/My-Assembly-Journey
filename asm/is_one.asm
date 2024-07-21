section .data
  Ask db 'Enter a number : ', 0
  Asklen equ $-Ask
  Equal db 'The number is 1', 0
  Equallen equ $-Equal
  NotEqual db 'The number is not 1', 0
  NotEquallen equ $-NotEqual
   
section .bss
  Num RESB 5

section .text
  global _start

_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, Ask
  mov edx, Asklen
  int 0x80

  mov eax, 3
  mov ebx, 2
  mov ecx, Num
  mov edx, 5
  int 0x80

  sub byte[Num], '0'

  cmp byte[Num], 01
  je equal

  mov eax, 4
  mov ebx, 1
  mov ecx, NotEqual
  mov edx, NotEquallen
  int 0x80

  mov eax, 1
  xor ebx, ebx
  int 0x80

equal:
  mov eax, 4
  mov ebx, 1
  mov ecx, Equal
  mov edx, Equallen
  int 0x80

  mov eax, 1
  xor ebx, ebx
  int 0x80
