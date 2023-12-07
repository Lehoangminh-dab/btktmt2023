#PROBLEM:
# ecx=a; 
# eax=0; 
# while(ecx>0) { eax+=ecx; ecx--;}
.section .data
  print_format: .string "%d\n"
  result: .int 30
#DATA:
a: .int 2
.section .text
.globl main
main:
#SOLUTION:
mov $a, %ecx
xor %eax, %eax
while:
  cmp $0, %eax
  jna endwhile
then:
  add %ecx, %eax
  dec %ecx
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
