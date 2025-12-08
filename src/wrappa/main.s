.intel_syntax noprefix
.section .note.GNU-stack,"",@progbits

/**
 * I do not want to type these every time I want to create a function
 */
.macro proc name
.type \name,@function
\name:
.endm

.include "libasm/process.s"
.include "libasm/io.s"
.include "libasm/errno.s"

.section .rodata
fork_failed_msg:
.asciz "fork failed: "
.equiv fork_failed_msg_len, $ - fork_failed_msg - 1

.section .text

/**
 * Prints an error to stdout
 *
 * @rdi := negative error code
 */
proc print_error
    push r12
    push rbp
    mov rbp, rsp
    call strerror
    mov r12, rdx

    lea rsi, [rdx+9] /* + 1 for null term */
    and rsi, ~7

    sub rsp, rsi
    
    mov rdi, rsp
    mov rsi, rax
    /*mov rdx, rdx*/
    call memcpy
    
    // add newline char

    mov BYTE PTR [rax+r12], '\n

    lea rdx, [r12+1]
    mov rsi, rax
    mov edi, STDERR_FILENO
    call write

    mov rsp, rbp
    pop rbp
    pop r12
    ret


/**
 * Runs an executable and return its error code
 *
 * @rdi := null ternimated program name
 * @rsi := null terminated argument list
 * @rdx := null terminated environment
 *
 * @eax := exit code of executable
 */
proc run_exe

    call fork

    cmp rax, 0
    jl .run_exe.fork_fail
    
    cmp rax, 0
    jne .run_exe.parent

    mov edi, -ECHILD
    jmp exit

    .run_exe.parent:
    
    push rbx
    mov rax, rbx

    call waitpid
    
    pop rbx
    ret
    
    .run_exe.fork_fail:
    push rbx
    mov rbx, rax
    
    mov rsi, fork_failed_msg@GOTPCREL[rip]
    mov rdx, fork_failed_msg_len
    mov edi, STDERR_FILENO
    call write
    
    mov rdi, rbx
    call print_error
    
    mov rdi, rbx
    neg rdi
    call exit_group


.globl main
/**
 * Main funcion
 *
 * @rdi := argc
 * @rsi := argv
 * @rdx := null terminated environment
 *
 * @eax := error code
 */
proc main

    xor edi, edi /* Success */
    call print_error

    mov rdi, EHWPOISON
    call print_error

    mov rdi, ESTALE
    call print_error

    mov rdi, EHWPOISON-1
    call print_error

    xor eax, eax
    ret

