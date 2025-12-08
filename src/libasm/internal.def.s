.ifndef LIBASM_INTERNAL_S_
.weak LIBASM_INTERNAL_S_
.equiv LIBASM_INTERNAL_S_, 1

/**
 * Internal definition file.
 * This file should only contain macros and nothing else
 * except for stack protection section
 **/

// Needed to tell ld to shut up about not finding it
.section .note.GNU-stack,"",@progbits

// No one wants to write this out every time
.macro proc name
.type \name,@function
\name:
.endm

.endif /* LIBASM_INTERNAL_S_ */
