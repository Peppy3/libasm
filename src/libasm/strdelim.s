.intel_syntax noprefix

.include "internal.def.s"


.section .text


.globl strdelim
/**
 * Advances the string to after the 8 bit delimiter or 
 * to a null character
 *
 * @rdi := address to string
 * @esi := unsinged 8 bit delimiter
 *
 * @rax := address to one after delimiter or to null byte
 */
proc strdelim
    movzx edx, BYTE PTR [rdi]

    cmp edx, 0
    je .strdelim.end

    inc rdi

    cmp edx, esi
    je .strdelim.end

    jmp strdelim

    .strdelim.end:
    mov rax, rdi
    ret

