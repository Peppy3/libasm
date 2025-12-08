.ifndef LIBASM_CORE_S_
/**
 * Make it weak so we do not end up with a bunch of 
 * definitions of this in the final output
 */
.weak LIBASM_CORE_S_
.equiv LIBASM_CORE_S_, 1

/**
 * Make a weak symbol with .equiv directive
 * Reduces object and shared/dynamic elf file size
 */
.macro weak_equiv name, expr
.weak \name
.equiv \name, \expr
.endm


.endif /* LIBASM_CORE_S_ */
