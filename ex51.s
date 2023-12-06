#PROBLEM:
# ecx=0; 
# for(eax=1;eax<n;eax++) ecx+=eax; 
# Expected Result: n = 4 -> ecx = 6
.section .data
  print_format: .string "%d\n"
  result: .int 30
#DATA:
n: .int 4
.section .text
.globl main
main:
#SOLUTION:
xor %ecx, %ecx
mov $1, %eax
while: 
  cmp %eax, n
  jna endwhile
then:
  add %eax, %ecx
  inc %eax
  jmp while
endwhile:
  mov %ecx, result
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
