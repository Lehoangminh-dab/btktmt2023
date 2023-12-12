# Note: This file's target compiler is gcc.
#PROBLEM:

.section .data
  print_format: .string "%lf\n"
  result: .double 1.5
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
movsd result, %xmm0
mov $print_format, %edi
mov $1, %eax
call printf
mov $0, %eax
leave
ret

