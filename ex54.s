# Note: This file's target compiler is gcc.
#PROBLEM:
# ecx=a; 
# ebx=0; 
# for(eax=1; eax<n; eax++) ebx+=ecx; ~ for (eax = n - 1, eax >=1, eax --)
# Expected: a = 4, n = 4 -> ebx = 12
.section .data
  print_format: .string "%d\n"
  result: .int 30
#DATA:
a: .int 4
n: .int 4
.section .text
.globl main
main:
#SOLUTION:
mov $1, %eax
xor %ebx, %ebx
while:
  cmp %eax, n
  jle endwhile
do:
  add a, %ebx
  inc %eax
  jmp while
endwhile:
  mov %ebx, result
#BOILERPLATE: STORE RESULT TO PRINTING VARIABLE
  # mov variable, result
#BOILERPLATE: PRINT RESULT
  pushq %rbp
  movq %rsp, %rbp
  movl result, %eax
  movl $print_format, %edi
  movl %eax, %esi
  xorl %eax, %eax
  call printf
  movl $0, %eax
  leave
  ret
