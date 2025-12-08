.intel_syntax noprefix

.include "internal.def.s"
.include "libasm/syscall.s"


.section .text

.globl fork
/**
 * Issues the fork syscall
 * This copies the current process
 * 
 *  @rax := Zero for child and process id number for parent.
 *          If error occurs, child is not created and a negative error
 *          code is returned
 */
proc fork
    mov eax, SYS_fork
    syscall
    ret


.globl execve
/**
 * Issues an execve
 * This exits the current process if not error occurs
 *
 * @rdi := null terminated path name to execute
 * @rsi := null terminated argument list
 * @rdx := null terminated environment list
 *
 * @rax := error code 
 */
proc execve
    mov eax, SYS_execve
    syscall
    ret


.globl waitpid
/**
 * Waits on a pid for a state change in the child process
 * specified in @rdi. See `man waitpid(2)` for more details
 *
 * The waitpid status struct is 2 bytes long
 * [1] := termination signal or zero for normal program exit
 * [2] := exit code or zero if signal was raised
 *
 * Arguments and returns:
 *
 * @rdi := pid to wait on
 * @rsi := address to a waitpid_status struct to be populated
 * @rdx := option flags
 *
 * @rax := id of the terminated child or negative error code
 */
proc waitpid
    push rbp
    mov rbp, rsp
    sub rsp, 16
    
    mov QWORD PTR [rbp-8], rsi

    mov rsi, rsp
    // set rusage pointer to null
    xor r10d, r10d
    mov eax, SYS_wait4
    syscall

    cmp rax, 0
    jl .waitpid.end

    mov rsi, QWORD PTR [rbp-8]
    mov edx, DWORD PTR [rbp-16]

    xor r10d, r10d
    mov edi, edx
    mov ecx, edx

    and ecx, 0xff00
    shr ecx, 8

    and edi, 0x7f
    cmovnz ecx, r10d

    mov BYTE PTR [rsi], dil
    mov BYTE PTR [rsi+1], cl

    .waitpid.end:
    mov rsp, rbp
    pop rbp
    ret

