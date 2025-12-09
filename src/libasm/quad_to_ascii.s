.intel_syntax noprefix

.include "internal.def.s"


.section .text


.global uquad_to_ascii
/**
 * Places an unsigned quad onto the stack in null terminated ascii format.
 * NOTE: rsp will be moved and rbp will be untouched
 * aka. make sure to have actually allocated your local stack variables
 * 
 * This might or might now be callable in C, Depending on compiler
 *
 * @rdi := unsigned uquad to convert
 *
 * @rax := start of buffer (same as rsp)
 * @rdx := length of the array (not including null byte)
 */
proc uquad_to_ascii
    pop r9 /* store return address into r9 */

    /* move current rsp into r8, this is now the `stack to place number into´*/
    mov r8, rsp
    sub rsp, 24 /* 64 bit uint is max 20 chars */

    test rdi, rdi
    jz .uquad_to_ascii.do_zero
    
    xor ecx, ecx

    sub r8, 1
    mov BYTE PTR [r8], 0

    mov esi, 10
    mov rax, rdi
    .uquad_to_ascii.loop:
    // TODO: do fixed initeger div?
    xor edx, edx
    div rsi
    
    sub r8, 1
    or edx, '0
    mov BYTE PTR [r8], dl

    add rcx, 1

    cmp rax, 0
    jne .uquad_to_ascii.loop

    /* string copy */
    xor esi, esi
    mov rax, rsp

    .uquad_to_ascii.strcpy:

    movzx edx, BYTE PTR [r8+rsi]
    mov BYTE PTR [rax+rsi], dl
    add rsi, 1

    cmp rsi, rcx
    jl .uquad_to_ascii.strcpy

    mov BYTE PTR [rax+rsi], 0

    mov rdx, rcx
    push r9 /* restore return address so we can return */
    xor r9d, r9d
    ret
    
    .uquad_to_ascii.do_zero:
    mov WORD PTR [rsp], 0x0048
    mov edx, 2
    mov rdx, rsp
    push r9 /* restore return address so we can return */
    xor r9d, r9d
    ret



.global iquad_to_ascii
/**
 * Places a signed quad onto the stack in null terminated ascii format.
 * NOTE: rsp will be moved and rbp will be untouched
 * aka. make sure to have actually allocated your local stack variables
 * 
 * This might or might now be callable in C, Depending on compiler
 *
 * @rdi := signed uquad to convert
 *
 * @rax := start of buffer (same as rsp)
 * @rdx := length of the array (not including null byte)
 */
proc iquad_to_ascii
    pop r9 /* store return address into r9 */

    /* move current rsp into r8, this is now the "stack to place number into"*/
    mov r8, rsp
    sub rsp, 24 /* 64 bit uint is max 20 chars */

    test rdi, rdi
    jz .iquad_to_ascii.do_zero
    
    xor ecx, ecx

    sub r8, 1
    mov BYTE PTR [r8], 0

    mov r10, rdi
    neg rdi
    cmovs rdi, r10

    // get the sign bit
    shr r10, 63

    mov esi, 10
    mov rax, rdi
    .iquad_to_ascii.loop:
    // TODO: do fixed initeger div?
    xor edx, edx
    div rsi
    
    sub r8, 1
    or edx, '0
    mov BYTE PTR [r8], dl

    add rcx, 1

    cmp rax, 0
    jne .iquad_to_ascii.loop

    /* add negative sign if needed */
    test r10d, r10d
    jz .iquad_to_ascii.signed_skip

    sub r8, 1
    add rcx, 1
    mov BYTE PTR [r8], '-

    .iquad_to_ascii.signed_skip:

    /* string copy */
    xor esi, esi
    mov rax, rsp

    .iquad_to_ascii.strcpy:

    movzx edx, BYTE PTR [r8+rsi]
    mov BYTE PTR [rax+rsi], dl
    add rsi, 1

    cmp rsi, rcx
    jl .iquad_to_ascii.strcpy

    mov BYTE PTR [rax+rsi], 0

    mov rdx, rcx
    push r9 /* restore return address so we can return */
    xor r9d, r9d
    ret
    
    .iquad_to_ascii.do_zero:
    mov WORD PTR [rsp], 0x0048
    mov edx, 2
    mov rdx, rsp
    push r9 /* restore return address so we can return */
    xor r9d, r9d
    ret

