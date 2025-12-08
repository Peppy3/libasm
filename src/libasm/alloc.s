.intel_syntax noprefix

.include "internal.def.s"

.include "libasm/syscall.s"
.include "libasm/mman.s"

/**
 * General purpose memory allocator
 */

.equiv PAGE_SIZE, 4096
.equiv PAGE_SHIFT, 12

.equiv REGION_SIZE, 64

.section .data

/**
 * List of heap structures.
 * each structure is 32 bytes long 
 * 
 * The heaps are divided up into 64 byte regions
 *
 * [0]  := address to beginning of heap
 * [8]  := length of heap (might grow)
 * [16] := start of linked list of allocations (-1 if no allocations)
 * [24] := number of free regions
 *
 *
 * [0]  := next allocation
 * [8]  := number of regions in this allocation
 */
.align 8
__libasm_general_allocator:
.quad 0 /* data     */
.quad 0 /* count    */
.quad 0 /* capacity */


.section .text


/**
 * Sets up the general purpose memory allocator
 *
 * @rax := error code or zero
 */
proc __libasm_alloc_setup
    
    xor r9d, r9d /* no file */
    mov r8d, -1 /* no file */
    mov ecx, MAP_PRIVATE | MAP_ANON
    mov edx, PROT_READ | PROT_WRITE
    mov esi, PAGE_SIZE
    xor edi, edi /* 0, we do not care */
    call mmap
    
    cmp rax, 0
    jl .__libasm_alloc_setup.end

    mov rcx, __libasm_general_allocator@GOTPCREL[rip]
    
    mov QWORD PTR [rcx], rax
    mov QWORD PTR [rcx+8], 0
    mov QWORD PTR [rcx+16], PAGE_SIZE/32
    
    xor eax, eax
    .__libasm_alloc_setup.end:
    ret
    



/**
 * Allocates a number of raw pages of memory and sets it up 
 * for the memory allocator
 *
 * @rdi := address to heap struct
 * @rsi := number of pages
 *
 * @rax := negative error or zero
 */
proc __libasm_make_heap
    push r12
    push rbx

    shl rsi, PAGE_SHIFT
    mov rbx, rdi
    mov r12, rsi
    
    xor edi, edi
    mov edx, PROT_READ | PROT_WRITE
    mov ecx, MAP_PRIVATE | MAP_ANON
    mov r8d, -1 /* no file */
    xor r9d, r9d /* no file */
    call mmap
    
    cmp rax, 0
    jl .__libasm_make_heap.end

    // make list in heap
    mov rsi, r12
    shr rsi, 4 /* rsi/16 (count of buckets) */
    mov QWORD PTR [rax], -1
    mov QWORD PTR [rax+8], rsi

    // initialize the heap struct in list
    mov QWORD PTR [rbx],    rax
    mov QWORD PTR [rbx+8],  r12
    mov QWORD PTR [rbx+16], -1
    mov QWORD PTR [rbx+24], rsi

    xor eax, eax
    .__libasm_make_heap.end:
    pop rbx
    pop r12
    ret




.global alloc
/**
 * Allocate memory
 * 
 * @rdi := size in bytes to allocate
 *
 * @rax := neative error code or positive address
 */
proc alloc
    push rbx
    mov rbx, rdi

    mov rsi, __libasm_general_allocator@GOTPCREL[rip]

    test rsi, rsi
    jnz .alloc.skip_setup
    
    mov rdi, rsi
    call __libasm_alloc_setup
    cmp rax, 0
    jl .alloc.end



    mov rsi, __libasm_general_allocator@GOTPCREL[rip]

    .alloc.skip_setup:

    

    .alloc.end:
    pop rbx
    ret

