.section .data
a: .int 1, 2, 3, 4
c: .int 10
b: .int 12
output: .asciz "The value of c is %d\n"

.section .text
.globl main

main:
  xor %edx, %edx
  inc %edx

  mov b, %ebx
  while: cmp b, %edx
    jae endwhile
  do:
    mov a(, %edx, 4), %eax
    sub %eax, c
    inc %edx
  endwhile:
    mov c, %esi
    mov $output, %rdi
    mov $0x0, %eax
    call printf

  movl $0, %ebx
  movl $1, %eax
  int $0x80