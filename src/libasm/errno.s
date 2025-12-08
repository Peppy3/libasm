.intel_syntax noprefix


.include "internal.def.s"

.include "libasm/string.s"
.include "libasm/errno.s"


.section .rodata

__libasm_unknown_err_string:
.asciz "Unknown error"
.equiv __libasm_unknown_err_string_len, $ - __libasm_unknown_err_string - 1


// DO NOT TOUCH!
// (For obvious reasons)

.macro errstr name, num, errorstring
.align 2
errstr_\name:
.asciz "\errorstring"
.equiv errstr_len_\name, $ - errstr_\name - 1
.endm


errstr ESUCCESS, 0, "Success"
errstr EPERM, 1, "Operation not permitted"
errstr ENOENT, 2, "No such file or directory"
errstr ESRCH, 3, "No such process"
errstr EINTR, 4, "Interrupted system call"
errstr EIO, 5, "Input/output error"
errstr ENXIO, 6, "No such device or address"
errstr E2BIG, 7, "Argument list too long"
errstr ENOEXEC, 8, "Exec format error"
errstr EBADF, 9, "Bad file descriptor"
errstr ECHILD, 10, "No child processes"
errstr EAGAIN, 11, "Resource temporarily unavailable"
errstr ENOMEM, 12, "Cannot allocate memory"
errstr EACCES, 13, "Permission denied"
errstr EFAULT, 14, "Bad address"
errstr ENOTBLK, 15, "Block device required"
errstr EBUSY, 16, "Device or resource busy"
errstr EEXIST, 17, "File exists"
errstr EXDEV, 18, "Invalid cross-device link"
errstr ENODEV, 19, "No such device"
errstr ENOTDIR, 20, "Not a directory"
errstr EISDIR, 21, "Is a directory"
errstr EINVAL, 22, "Invalid argument"
errstr ENFILE, 23, "Too many open files in system"
errstr EMFILE, 24, "Too many open files"
errstr ENOTTY, 25, "Inappropriate ioctl for device"
errstr ETXTBSY, 26, "Text file busy"
errstr EFBIG, 27, "File too large"
errstr ENOSPC, 28, "No space left on device"
errstr ESPIPE, 29, "Illegal seek"
errstr EROFS, 30, "Read-only file system"
errstr EMLINK, 31, "Too many links"
errstr EPIPE, 32, "Broken pipe"
errstr EDOM, 33, "Numerical argument out of domain"
errstr ERANGE, 34, "Numerical result out of range"
errstr EDEADLK, 35, "Resource deadlock avoided"
errstr ENAMETOOLONG, 36, "File name too long"
errstr ENOLCK, 37, "No locks available"
errstr ENOSYS, 38, "Function not implemented"
errstr ENOTEMPTY, 39, "Directory not empty"
errstr ELOOP, 40, "Too many levels of symbolic links"
errstr EWOULDBLOCK, 11, "Resource temporarily unavailable"
errstr ENOMSG, 42, "No message of desired type"
errstr EIDRM, 43, "Identifier removed"
errstr ECHRNG, 44, "Channel number out of range"
errstr EL2NSYNC, 45, "Level 2 not synchronized"
errstr EL3HLT, 46, "Level 3 halted"
errstr EL3RST, 47, "Level 3 reset"
errstr ELNRNG, 48, "Link number out of range"
errstr EUNATCH, 49, "Protocol driver not attached"
errstr ENOCSI, 50, "No CSI structure available"
errstr EL2HLT, 51, "Level 2 halted"
errstr EBADE, 52, "Invalid exchange"
errstr EBADR, 53, "Invalid request descriptor"
errstr EXFULL, 54, "Exchange full"
errstr ENOANO, 55, "No anode"
errstr EBADRQC, 56, "Invalid request code"
errstr EBADSLT, 57, "Invalid slot"
errstr EDEADLOCK, 35, "Resource deadlock avoided"
errstr EBFONT, 59, "Bad font file format"
errstr ENOSTR, 60, "Device not a stream"
errstr ENODATA, 61, "No data available"
errstr ETIME, 62, "Timer expired"
errstr ENOSR, 63, "Out of streams resources"
errstr ENONET, 64, "Machine is not on the network"
errstr ENOPKG, 65, "Package not installed"
errstr EREMOTE, 66, "Object is remote"
errstr ENOLINK, 67, "Link has been severed"
errstr EADV, 68, "Advertise error"
errstr ESRMNT, 69, "Srmount error"
errstr ECOMM, 70, "Communication error on send"
errstr EPROTO, 71, "Protocol error"
errstr EMULTIHOP, 72, "Multihop attempted"
errstr EDOTDOT, 73, "RFS specific error"
errstr EBADMSG, 74, "Bad message"
errstr EOVERFLOW, 75, "Value too large for defined data type"
errstr ENOTUNIQ, 76, "Name not unique on network"
errstr EBADFD, 77, "File descriptor in bad state"
errstr EREMCHG, 78, "Remote address changed"
errstr ELIBACC, 79, "Can not access a needed shared library"
errstr ELIBBAD, 80, "Accessing a corrupted shared library"
errstr ELIBSCN, 81, ".lib section in a.out corrupted"
errstr ELIBMAX, 82, "Attempting to link in too many shared libraries"
errstr ELIBEXEC, 83, "Cannot exec a shared library directly"
errstr EILSEQ, 84, "Invalid or incomplete multibyte or wide character"
errstr ERESTART, 85, "Interrupted system call should be restarted"
errstr ESTRPIPE, 86, "Streams pipe error"
errstr EUSERS, 87, "Too many users"
errstr ENOTSOCK, 88, "Socket operation on non-socket"
errstr EDESTADDRREQ, 89, "Destination address required"
errstr EMSGSIZE, 90, "Message too long"
errstr EPROTOTYPE, 91, "Protocol wrong type for socket"
errstr ENOPROTOOPT, 92, "Protocol not available"
errstr EPROTONOSUPPORT, 93, "Protocol not supported"
errstr ESOCKTNOSUPPORT, 94, "Socket type not supported"
errstr EOPNOTSUPP, 95, "Operation not supported"
/* errstr ENOTSUP, 95, "Operation not supported" (alias)*/
errstr EPFNOSUPPORT, 96, "Protocol family not supported"
errstr EAFNOSUPPORT, 97, "Address family not supported by protocol"
errstr EADDRINUSE, 98, "Address already in use"
errstr EADDRNOTAVAIL, 99, "Cannot assign requested address"
errstr ENETDOWN, 100, "Network is down"
errstr ENETUNREACH, 101, "Network is unreachable"
errstr ENETRESET, 102, "Network dropped connection on reset"
errstr ECONNABORTED, 103, "Software caused connection abort"
errstr ECONNRESET, 104, "Connection reset by peer"
errstr ENOBUFS, 105, "No buffer space available"
errstr EISCONN, 106, "Transport endpoint is already connected"
errstr ENOTCONN, 107, "Transport endpoint is not connected"
errstr ESHUTDOWN, 108, "Cannot send after transport endpoint shutdown"
errstr ETOOMANYREFS, 109, "Too many references: cannot splice"
errstr ETIMEDOUT, 110, "Connection timed out"
errstr ECONNREFUSED, 111, "Connection refused"
errstr EHOSTDOWN, 112, "Host is down"
errstr EHOSTUNREACH, 113, "No route to host"
errstr EALREADY, 114, "Operation already in progress"
errstr EINPROGRESS, 115, "Operation now in progress"
errstr ESTALE, 116, "Stale file handle"
errstr EUCLEAN, 117, "Structure needs cleaning"
errstr ENOTNAM, 118, "Not a XENIX named type file"
errstr ENAVAIL, 119, "No XENIX semaphores available"
errstr EISNAM, 120, "Is a named type file"
errstr EREMOTEIO, 121, "Remote I/O error"
errstr EDQUOT, 122, "Disk quota exceeded"
errstr ENOMEDIUM, 123, "No medium found"
errstr EMEDIUMTYPE, 124, "Wrong medium type"
errstr ECANCELED, 125, "Operation canceled"
errstr ENOKEY, 126, "Required key not available"
errstr EKEYEXPIRED, 127, "Key has expired"
errstr EKEYREVOKED, 128, "Key has been revoked"
errstr EKEYREJECTED, 129, "Key was rejected by service"
errstr EOWNERDEAD, 130, "Owner died"
errstr ENOTRECOVERABLE, 131, "State not recoverable"
errstr ERFKILL, 132, "Operation not possible due to RF-kill"
errstr EHWPOISON, 133, "Memory page has hardware error"




.section .data


.macro errvec_str, name, num
.quad errstr_\name
.quad errstr_len_\name
.endm

.align 8
__libasm_strerr_vector:
errvec_str ESUCCESS, 0      /* Success */
errvec_str EPERM, 1         /* Operation not permitted */
errvec_str ENOENT, 2        /* No such file or directory */
errvec_str ESRCH, 3         /* No such process */
errvec_str EINTR, 4         /* Interrupted system call */
errvec_str EIO, 5           /* Input/output error */
errvec_str ENXIO, 6         /* No such device or address */
errvec_str E2BIG, 7         /* Argument list too long */
errvec_str ENOEXEC, 8       /* Exec format error */
errvec_str EBADF, 9         /* Bad file descriptor */
errvec_str ECHILD, 10       /* No child processes */
errvec_str EAGAIN, 11       /* Resource temporarily unavailable */
errvec_str ENOMEM, 12       /* Cannot allocate memory */
errvec_str EACCES, 13       /* Permission denied */
errvec_str EFAULT, 14       /* Bad address */
errvec_str ENOTBLK, 15      /* Block device required */
errvec_str EBUSY, 16        /* Device or resource busy */
errvec_str EEXIST, 17       /* File exists */
errvec_str EXDEV, 18        /* Invalid cross-device link */
errvec_str ENODEV, 19       /* No such device */
errvec_str ENOTDIR, 20      /* Not a directory */
errvec_str EISDIR, 21       /* Is a directory */
errvec_str EINVAL, 22       /* Invalid argument */
errvec_str ENFILE, 23       /* Too many open files in system */
errvec_str EMFILE, 24       /* Too many open files */
errvec_str ENOTTY, 25       /* Inappropriate ioctl for device */
errvec_str ETXTBSY, 26      /* Text file busy */
errvec_str EFBIG, 27        /* File too large */
errvec_str ENOSPC, 28       /* No space left on device */
errvec_str ESPIPE, 29       /* Illegal seek */
errvec_str EROFS, 30        /* Read-only file system */
errvec_str EMLINK, 31       /* Too many links */
errvec_str EPIPE, 32        /* Broken pipe */
errvec_str EDOM, 33         /* Numerical argument out of domain */
errvec_str ERANGE, 34       /* Numerical result out of range */
errvec_str EDEADLK, 35      /* Resource deadlock avoided */
errvec_str ENAMETOOLONG, 36 /* File name too long */
errvec_str ENOLCK, 37       /* No locks available */
errvec_str ENOSYS, 38       /* Function not implemented */
errvec_str ENOTEMPTY, 39    /* Directory not empty */
errvec_str ELOOP, 40        /* Too many levels of symbolic links */
errvec_str EWOULDBLOCK, 11  /* Resource temporarily unavailable */
errvec_str ENOMSG, 42       /* No message of desired type */
errvec_str EIDRM, 43        /* Identifier removed */
errvec_str ECHRNG, 44       /* Channel number out of range */
errvec_str EL2NSYNC, 45     /* Level 2 not synchronized */
errvec_str EL3HLT, 46       /* Level 3 halted */
errvec_str EL3RST, 47       /* Level 3 reset */
errvec_str ELNRNG, 48       /* Link number out of range */
errvec_str EUNATCH, 49      /* Protocol driver not attached */
errvec_str ENOCSI, 50       /* No CSI structure available */
errvec_str EL2HLT, 51       /* Level 2 halted */
errvec_str EBADE, 52        /* Invalid exchange */
errvec_str EBADR, 53        /* Invalid request descriptor */
errvec_str EXFULL, 54       /* Exchange full */
errvec_str ENOANO, 55       /* No anode */
errvec_str EBADRQC, 56      /* Invalid request code */
errvec_str EBADSLT, 57      /* Invalid slot */
errvec_str EDEADLOCK, 35    /* Resource deadlock avoided */
errvec_str EBFONT, 59       /* Bad font file format */
errvec_str ENOSTR, 60       /* Device not a stream */
errvec_str ENODATA, 61      /* No data available */
errvec_str ETIME, 62        /* Timer expired */
errvec_str ENOSR, 63        /* Out of streams resources */
errvec_str ENONET, 64       /* Machine is not on the network */
errvec_str ENOPKG, 65       /* Package not installed */
errvec_str EREMOTE, 66      /* Object is remote */
errvec_str ENOLINK, 67      /* Link has been severed */
errvec_str EADV, 68         /* Advertise error */
errvec_str ESRMNT, 69       /* Srmount error */
errvec_str ECOMM, 70        /* Communication error on send */
errvec_str EPROTO, 71       /* Protocol error */
errvec_str EMULTIHOP, 72    /* Multihop attempted */
errvec_str EDOTDOT, 73      /* RFS specific error */
errvec_str EBADMSG, 74      /* Bad message */
errvec_str EOVERFLOW, 75    /* Value too large for defined data type */
errvec_str ENOTUNIQ, 76     /* Name not unique on network */
errvec_str EBADFD, 77       /* File descriptor in bad state */
errvec_str EREMCHG, 78      /* Remote address changed */
errvec_str ELIBACC, 79      /* Can not access a needed shared library */
errvec_str ELIBBAD, 80      /* Accessing a corrupted shared library */
errvec_str ELIBSCN, 81      /* .lib section in a.out corrupted */
errvec_str ELIBMAX, 82      /* Attempting to link in too many shared libraries */
errvec_str ELIBEXEC, 83     /* Cannot exec a shared library directly */
errvec_str EILSEQ, 84       /* Invalid or incomplete multibyte or wide character */
errvec_str ERESTART, 85     /* Interrupted system call should be restarted */
errvec_str ESTRPIPE, 86     /* Streams pipe error */
errvec_str EUSERS, 87       /* Too many users */
errvec_str ENOTSOCK, 88     /* Socket operation on non-socket */
errvec_str EDESTADDRREQ, 89 /* Destination address required */
errvec_str EMSGSIZE, 90     /* Message too long */
errvec_str EPROTOTYPE, 91   /* Protocol wrong type for socket */
errvec_str ENOPROTOOPT, 92  /* Protocol not available */
errvec_str EPROTONOSUPPORT, 93 /* Protocol not supported */
errvec_str ESOCKTNOSUPPORT, 94 /* Socket type not supported */
errvec_str EOPNOTSUPP, 95   /* Operation not supported */
/*errvec_str ENOTSUP, 95      Operation not supported (alias)*/
errvec_str EPFNOSUPPORT, 96 /* Protocol family not supported */
errvec_str EAFNOSUPPORT, 97 /* Address family not supported by protocol */
errvec_str EADDRINUSE, 98   /* Address already in use */
errvec_str EADDRNOTAVAIL, 99 /* Cannot assign requested address */
errvec_str ENETDOWN, 100    /* Network is down */
errvec_str ENETUNREACH, 101 /* Network is unreachable */
errvec_str ENETRESET, 102   /* Network dropped connection on reset */
errvec_str ECONNABORTED, 103 /* Software caused connection abort */
errvec_str ECONNRESET, 104  /* Connection reset by peer */
errvec_str ENOBUFS, 105     /* No buffer space available */
errvec_str EISCONN, 106     /* Transport endpoint is already connected */
errvec_str ENOTCONN, 107    /* Transport endpoint is not connected */
errvec_str ESHUTDOWN, 108   /* Cannot send after transport endpoint shutdown */
errvec_str ETOOMANYREFS, 109 /* Too many references: cannot splice */
errvec_str ETIMEDOUT, 110   /* Connection timed out */
errvec_str ECONNREFUSED, 111 /* Connection refused */
errvec_str EHOSTDOWN, 112   /* Host is down */
errvec_str EHOSTUNREACH, 113 /* No route to host */
errvec_str EALREADY, 114    /* Operation already in progress */
errvec_str EINPROGRESS, 115 /* Operation now in progress */
errvec_str ESTALE, 116      /* Stale file handle */
errvec_str EUCLEAN, 117     /* Structure needs cleaning */
errvec_str ENOTNAM, 118     /* Not a XENIX named type file */
errvec_str ENAVAIL, 119     /* No XENIX semaphores available */
errvec_str EISNAM, 120      /* Is a named type file */
errvec_str EREMOTEIO, 121   /* Remote I/O error */
errvec_str EDQUOT, 122      /* Disk quota exceeded */
errvec_str ENOMEDIUM, 123   /* No medium found */
errvec_str EMEDIUMTYPE, 124 /* Wrong medium type */
errvec_str ECANCELED, 125   /* Operation canceled */
errvec_str ENOKEY, 126      /* Required key not available */
errvec_str EKEYEXPIRED, 127 /* Key has expired */
errvec_str EKEYREVOKED, 128 /* Key has been revoked */
errvec_str EKEYREJECTED, 129 /* Key was rejected by service */
errvec_str EOWNERDEAD, 130  /* Owner died */
errvec_str ENOTRECOVERABLE, 131 /* State not recoverable */
errvec_str ERFKILL, 132     /* Operation not possible due to RF-kill */
errvec_str EHWPOISON, 133   /* Memory page has hardware error */
.equiv __libasm_strerr_vector_len, (. - __libasm_strerr_vector)/16



.section .text


.globl strerror
/**
 * Returns an address to a null terminated ascii string that describes the 
 * negative error code passed in. All positive numbers will give ESUCCESS
 *
 * @rdi := negative error code
 *
 * @rax := string address
 * @rdx := string length
 */
proc strerror
    // make positive so we can use it to index
    neg rdi


    cmp rdi, __libasm_strerr_vector_len
    jge .strerror.get_unknown

    cmp rdi, 0
    jl .strerror.get_unknown

    shl rdi, 4
    mov rsi, __libasm_strerr_vector@GOTPCREL[rip]

    mov rax, QWORD PTR [rsi+rdi]
    mov rdx, QWORD PTR [rsi+rdi+8]

    ret

    .strerror.get_unknown:
    mov rax, __libasm_unknown_err_string@GOTPCREL[rip]
    mov rdx, __libasm_unknown_err_string_len
    ret

