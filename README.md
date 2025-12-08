Libasm
====================================

General assembly library that makes writing things in assembly easier


## How to assemble the hello world example:

Right now, there is not way of incorporate the crt files so you need to do it
manually. A solution to this is in the works.
Why we even provide the crt files in the first place is for C functionality.

```sh
$ as -I./include examples/hello.s -o examples/hello.o
$ ld crt/crt0.o crt/crti.o examples/hello.o crt/crtn.o -o hello -L. -l:libasm.a
```

You can also link it dynamically using this linker command instead.
Note that the dynamic linker might not be found at this path described here.

```sh
$ ld crt/crt0.o crt/crti.o examples/hello.o crt/crtn.i -o hello \
    --dynamic-linker /usr/lib64/ld-linux-x86-64.so.2 -L. -rpath=$PWD -lasm
```


