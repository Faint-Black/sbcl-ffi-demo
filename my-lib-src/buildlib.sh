#!/bin/bash

# "gcc"           -> C compiler and linker
# "foo.c"         -> Input object source file
# "-o libfoo.so"  -> Output shared object lib file
# "-ansi"         -> Enforce C89 standard (optional)
# "-shared"       -> Shared library compilation
# "-fPIC"         -> Position Independent Code
# "-O2"           -> Enable optimizations
# "-Wall -Wextra" -> Enable compiler warnings
gcc foo.c -o libfoo.so -ansi -shared -fPIC -O2 -Wall -Wextra
