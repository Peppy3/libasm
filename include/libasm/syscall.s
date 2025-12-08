.ifndef LIBASM_SYSCALL_S_
.equiv LIBASM_SYSCALL_S_, 1

// Need core.s for weak_equiv
.include "libasm/core.s"


/**
 * Definitions for linux syscalls
 * Most of these will most likely be implemented as functions
 */

weak_equiv SYS_read, 0
weak_equiv SYS_write, 1
weak_equiv SYS_open, 2
weak_equiv SYS_close, 3

weak_equiv SYS_mmap, 9
weak_equiv SYS_mprotect, 10
weak_equiv SYS_munmap, 11

weak_equiv SYS_getpid, 34

weak_equiv SYS_fork, 57
weak_equiv SYS_vfork, 58
weak_equiv SYS_execve, 59
weak_equiv SYS_exit, 60 /* exits the current thread, use exit_group for all threads */
weak_equiv SYS_wait4, 61
weak_equiv SYS_kill, 62 /* signal to random thread, use tgkill for specific thread */

weak_equiv SYS_gettid, 186

weak_equiv SYS_exit_group, 231

weak_equiv SYS_tgkill, 234


.endif /* LIBASM_SYSCALL_S_ */

