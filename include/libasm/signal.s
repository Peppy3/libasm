.ifndef LIBASM_SIGNAL_S_
.equiv LIBASM_SIGNAL_S_, 1

.include "libasm/core.s"



weak_equiv SIGABRT, 0x6
weak_equiv SIGALRM, 0xe
weak_equiv SIGBUS, 0x7
weak_equiv SIGCHLD, 0x11
weak_equiv SIGCONT, 0x12
weak_equiv SIGFPE, 0x8
weak_equiv SIGHUP, 0x1

weak_equiv SIGILL, 0x4
weak_equiv SIGINT, 0x2
weak_equiv SIGIO, 0x1d
weak_equiv SIGIOT, 0x6
weak_equiv SIGKILL, 0x9
weak_equiv SIGPIPE, 0xd

weak_equiv SIGPOLL, 0x1d

weak_equiv SIGPROF, 0x1b
weak_equiv SIGPWR, 0x1e
weak_equiv SIGQUIT, 0x3
weak_equiv SIGSEGV, 0xb
weak_equiv SIGSTKFLT, 0x10
weak_equiv SIGSTOP, 0x13
weak_equiv SIGTSTP, 0x14
weak_equiv SIGSYS, 0x1f

weak_equiv SIGTERM, 0xf
weak_equiv SIGTRAP, 0x5
weak_equiv SIGTTIN, 0x15
weak_equiv SIGTTOU, 0x16
weak_equiv SIGURG, 0x17
weak_equiv SIGUSR1, 0xa
weak_equiv SIGUSR2, 0xc
weak_equiv SIGVTALRM, 0x1a
weak_equiv SIGXCPU, 0x18

weak_equiv SIGXFSZ, 0x19

weak_equiv SIGWINCH, 0x1c



.endif /* LIBASM_SIGNAL_S_ */
