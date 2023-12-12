.section .data
  print_format: .string "%lf\n"
  result: .float 1.5   # Change to .float

.section .text
.globl main
main:
  #BOILERPLATE: STORE RESULT TO PRINTING VARIABLE
  # mov variable, result

  #BOILERPLATE: PRINT RESULT
  pushq %rbp
  movq %rsp, %rbp
  movss result, %xmm0   # Use movss for single-precision float
  mov $print_format, %edi
  mov $1, %eax
  call printf
  mov $0, %eax
  leave
  ret
