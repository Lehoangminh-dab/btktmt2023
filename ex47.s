.section .data
  print_format: .string "%d\n"
  result: .int 30
#DATA:

.section .text
.globl main
  main:
#SOLUTION:

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
