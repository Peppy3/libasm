.ifndef LIBASM_PROCESS_S_
.weak LIBASM_PROCESS_S_
.equiv LIBASM_PROCESS_S_, 1

.include "libasm/core.s"

/**
 * Exits the current thread (not the whole process).
 * If you want to exit the whole process, call exit_group instead.
 * NOTE: This does not clean things up when there is only one thread left
 *       (This *might* change in a future version when threading is added)
 * 
 * @rdi := return code
 */
.extern exit


/**
 * Exits the whole process. Not just the current thread
 * This is what the library calls after main has ended
 * 
 * @rdi := return code
 */
.extern exit_group


/**
 * Aborts the current thread
 */
.extern abort


/**
 * Issues the fork syscall
 * This copies the current process
 * 
 *  @rax := Zero for child and process id number for parent.
 *          If error occurs, child is not created and a negative error
 *          code is returned
 */
.extern fork


/**
 * Issues an execve
 * This exits the current process if not error occurs
 * NOTE: Does not do path resolution. 
 *       This is just a thin wrapper around the syscall
 *
 * @rdi := null terminated path name to execute
 * @rsi := null terminated argument list
 * @rdx := null terminated environment list
 *
 * @rax := error code 
 */
.extern execve


/**
 * waipid option flags. shoulbe ored together or zero
 */
weak_equiv WNOHANG, 1
weak_equiv WUNTRACED, 2
weak_equiv WCONTINUED, 8


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
.extern waitpid


.endif /* LIBASM_PROCESS_S_ */

