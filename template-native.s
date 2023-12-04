.section .data
  c: .int 4
  message: .asciz "The result is: "  # Added a message with a format specifier
.section .text
.globl main
main:
  # Print syscall for the message with the value of 'c'
  mov $4, %eax        # syscall number for write
  mov $1, %ebx        # file descriptor 1 (stdout)
  lea message, %ecx   # address of the message
  mov $16, %edx       # number of bytes to write (adjust as needed)
  int $0x80

  # Print syscall for the value of 'c'
  mov $4, %eax        # syscall number for write
  mov $1, %ebx        # file descriptor 1 (stdout)
  lea c, %ecx         # address of the variable 'c'
  mov $4, %edx        # number of bytes to write
  int $0x80

  # Exit syscall
  mov $1, %eax        # syscall number for exit
  xor %ebx, %ebx      # exit code 0
  int $0x80
