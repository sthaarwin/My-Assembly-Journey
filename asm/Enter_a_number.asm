section .data
  ask db 'Enter a number : ', 0
  asklen equ $-ask

  display db 'You have entered : ', 0
  displaylen equ $-display

section .bss
  Num RESB 5

section .text 
  global _start

_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, ask
  mov edx, asklen
  int 0x80

  mov eax, 3
  mov ebx, 2
  mov ecx, Num
  mov edx, 5
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, display
  mov edx, displaylen
  int 0x80

  mov eax, 4
  mov ebx,1
  mov ecx, Num
  mov edx, 5
  int 0x80

  mov eax, 1
  xor edx, edx
  int 0x80
