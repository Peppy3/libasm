.intel_syntax noprefix

.include "internal.def.s"


.section .text

.globl __libasm_init
/**
 * Initializes the library and gathers envionment variables
 * This function is caled from _start in crt/crt0.s
 *
 * @rdi argument count
 * @rsi argument vector
 * 
 * @rax environment vector
 */
proc __libasm_init
    /**
     * The environment variables is provided to us right behind the null 
     * terminated arg vector
     */

    lea rax, [rsi+rdi*8+8]

    ret

