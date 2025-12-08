.ifndef LIBASM_IO_S_
.equiv LIBASM_IO_S_, 1


.weak STDIN_FILENO
.equiv STDIN_FILENO, 0
.weak STDOUT_FILENO
.equiv STDOUT_FILENO, 1
.weak STDERR_FILENO
.equiv STDERR_FILENO, 2

/**
 * Writes to a file descriptor
 * 
 * @edi := file descriptor
 * @rsi := address to buffer
 * @rdx := size of buffer
 * 
 * @rax := neagtive error code or size written
 */
.ifdef LIBASM_EXTERN_SYMBOLS
.extern write
.endif


/**
 * Reads from a file descriptor
 * 
 * @edi := file descriptor
 * @rsi := address to buffer
 * @rdx := size of buffer
 * 
 * @rax := neagtive error code or size read
 */
.ifdef LIBASM_EXTERN_SYMBOLS
.extern read
.endif


/**
 * Prints a string to the standard output
 * 
 * @rdi := address to null terminated ascii string
 *
 * @rax := negative error code or bytes written
 */
.ifdef LIBASM_EXTERN_SYMBOLS
.extern printstr
.endif


.endif /* LIBASM_IO_S_ */
