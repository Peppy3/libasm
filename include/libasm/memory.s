.ifndef LIBASM_MEMORY_S_
.equiv LIBASM_MEMORY_S_, 1


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
.ifdef LIBASM_EXTERN_SYMBOLS
.extern memcpy
.endif


.endif /* LIBASM_MEMORY_S_ */
