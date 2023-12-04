#PROBLEM:
# switch(eax){ 
# case 1: edx=ebx*r8d+34; break; 
# case 2: edx= ebx/r8d+34; break; 
# case 3: edx= ebx +34; break; 
# default: edx=12; 
# }
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
