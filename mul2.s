#ProblemStatement:


.section .data

#ResultStorer:
result: .int 

#DataDeclaration:


#OutputTemplate:
output: .asciz "The result is %u\n" # Remember to change parameters so they match the ResultStorer.

#BOILERPLATE: MAIN DECLARATION
.section .text
.globl main
main:

#Solution:

#BOILERPLATE: PRINT OUTPUT
  mov result, %esi  
  mov $output, %rdi
  mov $0x0, %eax
  call printf
#BOILERPLATE: EXIT PROGRAM
  movl $0, %ebx
  movl $1, %eax
  int $0x80
 
