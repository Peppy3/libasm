For contributors
================================

## AI stance

No direct copying or use of AI to modify the source code at all. 
If you use AI, make sure to at least understand what the byte pair 
encoding and matrix  multiplications are providing you.


## General guidelines

- Make sure to document your functions. This is crucial to know what arguments 
  are used and what the functions give back. Local functions that are small or 
  wrappers for system calls must not be documented.

- Try to keep lines to >= 80 columns long. It is okay to go over but keep it 
  fairly short. This is assembly so it barely happens.

- We use 4 spaces for indentation and keep the local labels on the same line as 
  the instructions. No double indenting of instructions, it does not make it 
  more readable.

- Frequent use of blank lines keeps the code easier to read and understand. 
  Divide it up into logical chunks. Always have a blank line before a local 
  label.

