.intel_syntax noprefix

.include "internal.def.s"
.include "libasm/syscall.s"
.include "libasm/io.s"


.section .text


.globl write
proc write
    mov eax, SYS_write
    syscall
    ret




.globl read
proc read
    mov eax, SYS_read
    syscall
    ret




.globl printstr
/**
 * Prints a string to the standard output
 * 
 * @rdi := address to null terminated ascii string
 *
 * @rax := negative error code or bytes written
 */
proc printstr
    push rbp

    mov rbp, rdi

    call strlen

    mov rdx, rax
    mov rsi, rbp
    mov rdi, STDOUT_FILENO

    mov eax, SYS_write
    syscall

    pop rbp
    ret


