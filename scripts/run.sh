#!/usr/bin/env bash

set -eux

mkdir -p bin/

nasm -felf64 -Fdwarf src/main.s -o bin/main.o
mold -o bin/main -L "/usr/lib/" -lc -dynamic-linker "/usr/lib64/ld-linux-x86-64.so.2" bin/main.o
objdump -M intel -l -d bin/main
./bin/main || coredumpctl debug -A '-q --readnow -ex "thread apply all backtrace full" -ex q'
