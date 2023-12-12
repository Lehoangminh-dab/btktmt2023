# Note: This file's target compiler is gcc.
#PROBLEM:
# int a=6,q=3,n=10; 
# ecx=a; 
# eax=1; 
# for(edx=2; edx<n; edx++) eax+=ecx*q;  
# Expected: 

.section .data
  print_format: .string "%d\n"
  result: .int 30
#DATA:
a: .int 6
q: .int 3
n: .int 10
.section .text
.globl main
main:
#SOLUTION:
mov a, %ecx
mov $1, %eax

mov $2, %edx
mov %eax, %ebx
while:
  cmp %edx, n
  jle endwhile
do: 
  mov q, %eax
  mul %ecx
  add %eax, %ebx
  xor %eax, %eax
  inc %edx
  jmp while
endwhile:
  mov %ebx, %eax
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
