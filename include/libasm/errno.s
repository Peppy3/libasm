.ifndef LIBASM_ERRNO_H_
.equiv LIBASM_ERRNO_H_, 1

.include "libasm/core.s"

/**
 * Linux error code definitions
 * I have added ESUCCESS just for completion 
 * (I always look for it anyways)
 */

weak_equiv ESUCCESS, 0      /* Success */
weak_equiv EPERM, -1        /* Operation not permitted */
weak_equiv ENOENT, -2       /* No such file or directory */
weak_equiv ESRCH, -3        /* No such process */
weak_equiv EINTR, -4        /* Interrupted system call */
weak_equiv EIO, -5          /* Input/output error */
weak_equiv ENXIO, -6        /* No such device or address */
weak_equiv E2BIG, -7        /* Argument list too long */
weak_equiv ENOEXEC, -8      /* Exec format error */
weak_equiv EBADF, -9        /* Bad file descriptor */
weak_equiv ECHILD, -10      /* No child processes */
weak_equiv EAGAIN, -11      /* Resource temporarily unavailable */
weak_equiv ENOMEM, -12      /* Cannot allocate memory */
weak_equiv EACCES, -13      /* Permission denied */
weak_equiv EFAULT, -14      /* Bad address */
weak_equiv ENOTBLK, -15     /* Block device required */
weak_equiv EBUSY, -16       /* Device or resource busy */
weak_equiv EEXIST, -17      /* File exists */
weak_equiv EXDEV, -18       /* Invalid cross-device link */
weak_equiv ENODEV, -19      /* No such device */
weak_equiv ENOTDIR, -20     /* Not a directory */
weak_equiv EISDIR, -21      /* Is a directory */
weak_equiv EINVAL, -22      /* Invalid argument */
weak_equiv ENFILE, -23      /* Too many open files in system */
weak_equiv EMFILE, -24      /* Too many open files */
weak_equiv ENOTTY, -25      /* Inappropriate ioctl for device */
weak_equiv ETXTBSY, -26     /* Text file busy */
weak_equiv EFBIG, -27       /* File too large */
weak_equiv ENOSPC, -28      /* No space left on device */
weak_equiv ESPIPE, -29      /* Illegal seek */
weak_equiv EROFS, -30       /* Read-only file system */
weak_equiv EMLINK, -31      /* Too many links */
weak_equiv EPIPE, -32       /* Broken pipe */
weak_equiv EDOM, -33        /* Numerical argument out of domain */
weak_equiv ERANGE, -34      /* Numerical result out of range */
weak_equiv EDEADLK, -35     /* Resource deadlock avoided */
weak_equiv ENAMETOOLONG, -36 /* File name too long */
weak_equiv ENOLCK, -37      /* No locks available */
weak_equiv ENOSYS, -38      /* Function not implemented */
weak_equiv ENOTEMPTY, -39   /* Directory not empty */
weak_equiv ELOOP, -40       /* Too many levels of symbolic links */
weak_equiv EWOULDBLOCK, -11 /* Resource temporarily unavailable */
weak_equiv ENOMSG, -42      /* No message of desired type */
weak_equiv EIDRM, -43       /* Identifier removed */
weak_equiv ECHRNG, -44      /* Channel number out of range */
weak_equiv EL2NSYNC, -45    /* Level 2 not synchronized */
weak_equiv EL3HLT, -46      /* Level 3 halted */
weak_equiv EL3RST, -47      /* Level 3 reset */
weak_equiv ELNRNG, -48      /* Link number out of range */
weak_equiv EUNATCH, -49     /* Protocol driver not attached */
weak_equiv ENOCSI, -50      /* No CSI structure available */
weak_equiv EL2HLT, -51      /* Level 2 halted */
weak_equiv EBADE, -52       /* Invalid exchange */
weak_equiv EBADR, -53       /* Invalid request descriptor */
weak_equiv EXFULL, -54      /* Exchange full */
weak_equiv ENOANO, -55      /* No anode */
weak_equiv EBADRQC, -56     /* Invalid request code */
weak_equiv EBADSLT, -57     /* Invalid slot */
weak_equiv EDEADLOCK, -35   /* Resource deadlock avoided */
weak_equiv EBFONT, -59      /* Bad font file format */
weak_equiv ENOSTR, -60      /* Device not a stream */
weak_equiv ENODATA, -61     /* No data available */
weak_equiv ETIME, -62       /* Timer expired */
weak_equiv ENOSR, -63       /* Out of streams resources */
weak_equiv ENONET, -64      /* Machine is not on the network */
weak_equiv ENOPKG, -65      /* Package not installed */
weak_equiv EREMOTE, -66     /* Object is remote */
weak_equiv ENOLINK, -67     /* Link has been severed */
weak_equiv EADV, -68        /* Advertise error */
weak_equiv ESRMNT, -69      /* Srmount error */
weak_equiv ECOMM, -70       /* Communication error on send */
weak_equiv EPROTO, -71      /* Protocol error */
weak_equiv EMULTIHOP, -72   /* Multihop attempted */
weak_equiv EDOTDOT, -73     /* RFS specific error */
weak_equiv EBADMSG, -74     /* Bad message */
weak_equiv EOVERFLOW, -75   /* Value too large for defined data type */
weak_equiv ENOTUNIQ, -76    /* Name not unique on network */
weak_equiv EBADFD, -77      /* File descriptor in bad state */
weak_equiv EREMCHG, -78     /* Remote address changed */
weak_equiv ELIBACC, -79     /* Can not access a needed shared library */
weak_equiv ELIBBAD, -80     /* Accessing a corrupted shared library */
weak_equiv ELIBSCN, -81     /* .lib section in a.out corrupted */
weak_equiv ELIBMAX, -82     /* Attempting to link in too many shared libraries */
weak_equiv ELIBEXEC, -83    /* Cannot exec a shared library directly */
weak_equiv EILSEQ, -84      /* Invalid or incomplete multibyte or wide character */
weak_equiv ERESTART, -85    /* Interrupted system call should be restarted */
weak_equiv ESTRPIPE, -86    /* Streams pipe error */
weak_equiv EUSERS, -87      /* Too many users */
weak_equiv ENOTSOCK, -88    /* Socket operation on non-socket */
weak_equiv EDESTADDRREQ, -89 /* Destination address required */
weak_equiv EMSGSIZE, -90    /* Message too long */
weak_equiv EPROTOTYPE, -91  /* Protocol wrong type for socket */
weak_equiv ENOPROTOOPT, -92 /* Protocol not available */
weak_equiv EPROTONOSUPPORT, 93 /* Protocol not supported */
weak_equiv ESOCKTNOSUPPORT, 94 /* Socket type not supported */
weak_equiv EOPNOTSUPP, -95  /* Operation not supported */
weak_equiv EPFNOSUPPORT, -96 /* Protocol family not supported */
weak_equiv EAFNOSUPPORT, -97 /* Address family not supported by protocol */
weak_equiv EADDRINUSE, -98  /* Address already in use */
weak_equiv EADDRNOTAVAIL, -99 /* Cannot assign requested address */
weak_equiv ENETDOWN, -100   /* Network is down */
weak_equiv ENETUNREACH, -101 /* Network is unreachable */
weak_equiv ENETRESET, -102 /* Network dropped connection on reset */
weak_equiv ECONNABORTED, -103 /* Software caused connection abort */
weak_equiv ECONNRESET, -104 /* Connection reset by peer */
weak_equiv ENOBUFS, -105    /* No buffer space available */
weak_equiv EISCONN, -106    /* Transport endpoint is already connected */
weak_equiv ENOTCONN, -107   /* Transport endpoint is not connected */
weak_equiv ESHUTDOWN, -108  /* Cannot send after transport endpoint shutdown */
weak_equiv ETOOMANYREFS, -109 /* Too many references: cannot splice */
weak_equiv ETIMEDOUT, -110  /* Connection timed out */
weak_equiv ECONNREFUSED, -111 /* Connection refused */
weak_equiv EHOSTDOWN, -112  /* Host is down */
weak_equiv EHOSTUNREACH, -113 /* No route to host */
weak_equiv EALREADY, -114   /* Operation already in progress */
weak_equiv EINPROGRESS, -115 /* Operation now in progress */
weak_equiv ESTALE, -116     /* Stale file handle */
weak_equiv EUCLEAN, -117    /* Structure needs cleaning */
weak_equiv ENOTNAM, -118    /* Not a XENIX named type file */
weak_equiv ENAVAIL, -119    /* No XENIX semaphores available */
weak_equiv EISNAM, -120     /* Is a named type file */
weak_equiv EREMOTEIO, -121  /* Remote I/O error */
weak_equiv EDQUOT, -122     /* Disk quota exceeded */
weak_equiv ENOMEDIUM, -123  /* No medium found */
weak_equiv EMEDIUMTYPE, -124 /* Wrong medium type */
weak_equiv ECANCELED, -125  /* Operation canceled */
weak_equiv ENOKEY, -126     /* Required key not available */
weak_equiv EKEYEXPIRED, -127 /* Key has expired */
weak_equiv EKEYREVOKED, -128 /* Key has been revoked */
weak_equiv EKEYREJECTED, 129 /* Key was rejected by service */
weak_equiv EOWNERDEAD, -130 /* Owner died */
weak_equiv ENOTRECOVERABLE, -131 /* State not recoverable */
weak_equiv ERFKILL, -132    /* Operation not possible due to RF-kill */
weak_equiv EHWPOISON, -133  /* Memory page has hardware error */
weak_equiv ENOTSUP, -95     /* Operation not supported */


/**
 * Returns an address to a null terminated ascii string that describes the 
 * negative error code passed in. All positive numbers will give ESUCCESS
 *
 * @rdi := negative error code
 *
 * @rax := string address
 * @rdx := string length
 */
.extern strerror


.endif /* LIBASM_ERRNO_H_ */

