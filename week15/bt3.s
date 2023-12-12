# Note: This file's target compiler is gcc.
#PROBLEM:
# float a[5]={1.1, 2.2, 3.3, 4.4, 5.5}
# unsigned int n=5;
# xmm0=0;
# for(ecx=0; exc<n; ecx++)xmm0+=a[ecx];

.section .data
  print_format: .string "%d\n"
  result: .int 30
#DATA:

.section .text
.globl main
main:
#SOLUTION:

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
