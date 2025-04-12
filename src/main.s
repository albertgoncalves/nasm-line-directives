global main
extern puts
extern abort

section .rodata
    message db "Hello, world!", 10, 0

section .text

%line 10+0 "/path/to/foo.bar.main"
    main:
        mov     rdi, 123
        call    foo

        mov     rdi, message
        call    puts

        xor     eax, eax
        ret

%line 45+0 "/path/to/foo.bar.foo"
    foo:
        call    abort
        ret
