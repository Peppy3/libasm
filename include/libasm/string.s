.ifndef LIBASM_STRING_S_
.equiv LIBASM_STRING_S_, 1

/**
 * Gets the length of an ascii string (null char not included)
 * Analogous to stdlibc strlen
 *
 * @rdi := null terminated ascii string
 *
 * @rax := length of string
 */
.ifdef LIBASM_EXTERN_SYMBOLS
.extern strlen
.endif


/**
 * Gets the length of a string up to a specified delimiter
 * Does not include the delimiter in the output
 *
 * @rdi := string
 * @esi := unsinged 8 bit delimiter
 *
 * @rax := length of string
 */
.ifdef LIBASM_EXTERN_SYMBOLS
.extern strlen_delim
.endif

/**
 * Compares two strings and gives the difference between them
 * Analogus to stdlibc strncmp
 *
 * @rdi := lhs
 * @rsi := rhs
 * @rdx := compare length
 *
 * @eax := difference between the two strings (given as signed 32 bit value)
 */
.ifdef LIBASM_EXTERN_SYMBOLS
.extern strncmp
.endif

.endif /* LIBASM_STRING_S_ */
