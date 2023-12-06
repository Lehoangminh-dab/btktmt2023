#PROBLEM:
# NOTE1: THE ONLY WAY TO ASSIGN A FLOAT MEMORY REGISTER TO A FLOAT CONSTANT IS THROUGH
# ASSIGNING IT EQUAL TO A FLOAT VARIABLE. Or use XOR to init to 0.
# NOTE2: CHANGE RESULT VARIABLE TO DOUBLE.
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
