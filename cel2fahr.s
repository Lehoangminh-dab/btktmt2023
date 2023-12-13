# Note: This file's target compiler is gcc.
#PROBLEM:
# double cel2fahr(float temp)
# {
#   return 1.8 * temp + 32;
# }

.section .data
  print_format: .string "%lf\n"
  result: .double 1.5
#DATA:
scale: .double 1.8
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

cel2fahr:
  # First argument is float temp -> float is xmm0.
  # To calculate, we must convert all arguments to double.
  # The returning result is stored in xmm0.
  mov $32, %eax
  cvtsi2sd %eax, %xmm1
  movsd scale, %xmm2
  cvtss2sd %xmm0, %xmm0
  mulsd %xmm1, %xmm0
  mulsd %xmm2, %xmm0
  ret