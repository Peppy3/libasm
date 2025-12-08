.intel_syntax noprefix

.include "internal.def.s"


.text


.globl memcpy
/**
 * Copies a buffer from one to another
 * Analogus to stdlibc memcpy
 * 
 * @rdi := destination
 * @rsi := source
 * @rdx := size
 *
 * @rax := start of destination buffer
 */
proc memcpy
    xor ecx, ecx
    
    cmp rdx, rcx
    je .memcpy.end

    .memcpy.xmm:
    cmp rdx, 16
    jb .memcpy.quad

    movups xmm0, XMMWORD PTR [rsi+rcx]
    movups XMMWORD PTR [rdi+rcx], xmm0
    sub rdx, 16
    add rcx, 16
    
    cmp rdx, 0
    je .memcpy.end
    cmp rdx, 16
    jae .memcpy.xmm

    .memcpy.quad:
    cmp rdx, 8
    jb .memcpy.dword

    mov rax, QWORD PTR [rsi+rcx]
    mov QWORD PTR [rdi+rcx], rax
    sub rdx, 8
    add rcx, 8
    
    cmp rdx, 0
    je .memcpy.end

    .memcpy.dword:
    cmp rdx, 4
    jb .memcpy.word

    mov eax, DWORD PTR [rsi+rcx]
    mov DWORD PTR [rdi+rcx], eax
    sub rdx, 4
    add rcx, 4

    cmp rdx, 0
    je .memcpy.end

    .memcpy.word:
    cmp rdx, 2
    jb .memcpy.byte

    movzx eax, WORD PTR [rsi+rcx]
    mov WORD PTR [rdi+rcx], ax
    sub rdx, 2
    add rcx, 2

    cmp rdx, 0
    je .memcpy.end
    
    .memcpy.byte:
    cmp rdx, 0
    je .memcpy.end

    movzx eax, BYTE PTR [rsi+rcx]
    mov BYTE PTR [rdi+rcx], al

    .memcpy.end:
    mov rax, rdi
    ret

