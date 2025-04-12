global _start

extern abort
extern _exit
extern printf
extern puts

section .rodata
    message db "Hello, world!", 0
    format  db "%d, %u", 10, 0

section .bss
    object resq 2

section .text

%line 10+0 "/path/to/foo.bar.main"
    _start:
        call    foo

        mov     qword [object], -456
        mov     qword [object + 8], 123

        mov     rdx, [object + 8]
        mov     rsi, [object]
        mov     rdi, format
        xor     eax, eax
        call    printf

        xor     edi, edi
        call    _exit

%line 45+0 "/path/to/foo.bar.foo"
    foo:
        mov     rdi, message
        call    puts

        call    abort
        ret
