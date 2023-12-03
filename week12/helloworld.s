.section .data
  hello:     .asciz "Hello, World!\n"    # 'Hello, World!' plus a linefeed character

.section .text
.global _start

_start:
mov $4, %eax            # The system call for write (sys_write)
mov $1, %ebx            # File descriptor 1 - standard output
mov $hello, %ecx        # Put the address of hello in ecx
mov $14, %edx           # Length of the 'Hello, World!' string
int $0x80                # Call the kernel
mov $1, %eax            # The system call for exit (sys_exit)
mov $0, %ebx            # Exit with return "code" of 0 (no error)
int $0x80
