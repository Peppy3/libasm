.intel_syntax noprefix

.include "internal.def.s"
.include "libasm/syscall.s"

.section .text


.globl exit
proc exit
    mov eax, SYS_exit
    syscall
    /* thread is ended here */



.globl exit_group
proc exit_group
    push rbx

    mov rbx, rdi
    
    call _fini
    
    mov rdi, rbx
    mov eax, SYS_exit_group
    syscall
    /* process is ended here */



