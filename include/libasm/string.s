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
.extern strlen


/**
 * Gets the length of a string up to a specified delimiter
 * Does not include the delimiter in the output
 *
 * @rdi := string
 * @esi := unsinged 8 bit delimiter
 *
 * @rax := length of string
 */
.extern strlen_delim


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
.extern strncmp


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
.extern uquad_to_ascii


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
.extern iquad_to_ascii


.endif /* LIBASM_STRING_S_ */
