# Note: This file's target compiler is gcc.
#PROBLEM:
# int a[8]={-1, 2,-3,9,-12,18,12,-3}, n=8;
# eax=0;
# ecx=0;
# while (ecx < n && a[ecx]>=0)  eax += a[ecx++] ;
# Expected: 0 
# Custom Expected: 3 
.section .data
  print_format: .string "%d\n"
  result: .int 30
#DATA:
n: .int 8
a: .int 1, 2, -3, 9, -12, 18, 12, -3
.section .text
.globl main
main:
#SOLUTION:
xor %eax, %eax
xor %ecx, %ecx
while:
  cmp $n, %ecx
  jge endwhile

  cmp $0, a(, %ecx, 4)
  jl endwhile

do: 
  add a(, %ecx, 4), %eax
  inc %ecx
  jmp while
endwhile:
  mov %eax, result
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
