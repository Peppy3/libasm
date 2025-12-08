.ifndef LIBASM_MMAN_S_
.equiv LIBASM_MMAN_S_, 1

.include "libasm/core.s"

/**
 * Linux memory protection flags
 */

weak_equiv PROT_NONE,   0
weak_equiv PROT_READ,   0x1
weak_equiv PROT_WRITE,  0x2
weak_equiv PROT_EXEC,   0x4

weak_equiv MAP_SHARED,          0x1
weak_equiv MAP_PRIVATE,         0x2
weak_equiv MAP_SHARED_VALIDATE, 0x3
weak_equiv MAP_FIXED,           0x10
weak_equiv MAP_ANON,            0x20 /* alias to MAP_ANONYMOUS */
weak_equiv MAP_ANONYMOUS,       0x20
weak_equiv MAP_FILE,            0 /* compatibility flag*/
weak_equiv MAP_32BIT,           0x40
weak_equiv MAP_GROWSDOWN,       0x100
weak_equiv MAP_LOCKED,          0x2000
weak_equiv MAP_NORESERVE,       0x4000
weak_equiv MAP_POPULATE,        0x8000
weak_equiv MAP_NONBLOCK,        0x10000
weak_equiv MAP_STACK,           0x20000
weak_equiv MAP_HUGETLB,         0x40000
weak_equiv MAP_SYNC,            0x80000
weak_equiv MAP_FIXED_NOREPLACE, 0x100000


/**
 * Maps memory. see `man mmap(2)´ for more details
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
 .extern mmap


/**
 * Unmap a range of memory mapped by mmap
 *
 * @rdi := address to unmap
 * @rsi := length to unmap
 * 
 * @rax := negative error code or zero for success
 */
.extern munmap


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
.extern mprotect


.endif /* LIBASM_MMAN_S_ */
