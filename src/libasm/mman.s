.intel_syntax noprefix

.include "internal.def.s"
.include "libasm/syscall.s"


.section .text


.globl mmap
/**
 * Maps memory. see `man mmap(2)' for more details
 *
 * @rdi := address hint (zero if no hint)
 * @rsi := length to malloc
 * @rdx := protection flags
 * @rcx := general flags
 * @r8d := file descriptor (-1 if not used)
 * @r9  := offset into the file (zero if not used)
 * 
 * @rax := negative error or address
 */
proc mmap
    // move from SysV to linux syscall calling conv
    mov r10, rcx

    mov eax, SYS_mmap
    syscall
    ret


.globl munmap
/**
 * Unmap a range of memory mapped by mmap
 *
 * @rdi := address to unmap
 * @rsi := length to unmap
 * 
 * @rax := negative error code or zero for success
 */
proc munmap
    mov eax, SYS_munmap
    syscall
    ret


.globl mprotect
/**
 * Change access protection for the calling process memory page containing
 * any part in the range [address, address+length-1].
 * NOTE: address must be aligned to a page boundary
 *
 * @rdi := address
 * @rsi := length
 * @rdx := protection flags
 *
 * @rax := negative error code or zero for sucess
 */
proc mprotect
    mov eax, SYS_mprotect
    syscall
    ret


