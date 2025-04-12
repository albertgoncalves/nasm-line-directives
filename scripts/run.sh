#!/usr/bin/env bash

set -eux

mkdir -p bin/

nasm -felf64 -Fdwarf src/main.s -o bin/main.o
clang -no-pie bin/main.o -o bin/main
objdump -M intel -l -d bin/main
./bin/main || coredumpctl debug -A '-q --readnow -ex "thread apply all backtrace full" -ex q'
