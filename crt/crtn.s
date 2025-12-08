.intel_syntax noprefix
.section .note.GNU-stack,"",@progbits

.section .init


.globl _init
    mov rsp, rbp
    pop rbp
    ret




.section .fini


.globl _fini
    mov rsp, rbp
    pop rbp
    ret


