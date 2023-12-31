#PROBLEM:
# ecx=a; 
# eax=0; 
# while(ecx>0) { eax+=ecx; ecx--;}
# Expected result: ecx = 4 -> eax = 1 + 2 + 3 + 4 = 10
.section .data
  print_format: .string "%d\n"
  result: .int 30
#DATA:
a: .int 4
.section .text
.globl main
main:
#SOLUTION:
mov a, %ecx
xor %eax, %eax
while:
  cmp $0, %ecx
  jle endwhile
then:
  add %ecx, %eax
  dec %ecx
  jmp while
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
