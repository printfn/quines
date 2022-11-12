section .data
msg: DB 'section .data~\
msg: DB `, 0~\
~\
global start~\
~\
section .text~\
~\
putchar:~\
    push rbp~\
    mov rbp, rsp~\
    mov [rbp-4], edi~\
    mov rax, 1~\
    mov rdi, 1~\
    mov rsi, rbp~\
    sub rsi, 4~\
    mov rdx, 1~\
    syscall~\
    pop rbp~\
    ret~\
~\
printer:~\
    push rbp~\
    push r8~\
    push r9~\
    push r10~\
    mov rbp, rsp~\
    mov [rbp-4], edi~\
    ~\
    mov r8, msg~\
    mov r10, [rbp-4]~\
    cmp r10, 0~\
    je out~\
  loopstart:~\
    mov r9b, [r8]~\
    cmp r9b, 0~\
    je out~\
    cmp r9b, 96~\
    je backtick_rec~\
    cmp r9b, 126~\
    je tilde_ln~\
  normalprint:~\
    movzx edi, r9b~\
    call putchar~\
  incr:~\
    add r8, 1~\
    jmp loopstart~\
~\
  out:~\
    pop r10~\
    pop r9~\
    pop r8~\
    pop rbp~\
    ret~\
~\
  tilde_ln:~\
    mov r9b, 10~\
    cmp r10, 1~\
    je normalprint~\
    mov edi, 126~\
    call putchar~\
    mov edi, 92~\
    call putchar~\
    jmp normalprint~\
~\
  backtick_rec:~\
    cmp r10b, 0~\
    je normalprint~\
    mov edi, 39~\
    call putchar~\
    mov edi, 0~\
    call printer~\
    mov edi, 39~\
    call putchar~\
    jmp incr~\
~\
start:~\
    mov edi, 1~\
    call printer~\
    mov rax, 60~\
    mov rdi, 0~\
    syscall~\
    ret~\
', 0

global start

section .text

putchar:
    push rbp
    mov rbp, rsp
    mov [rbp-4], edi
    mov rax, 1
    mov rdi, 1
    mov rsi, rbp
    sub rsi, 4
    mov rdx, 1
    syscall
    pop rbp
    ret

printer:
    push rbp
    push r8
    push r9
    push r10
    mov rbp, rsp
    mov [rbp-4], edi
    
    mov r8, msg
    mov r10, [rbp-4]
    cmp r10, 0
    je out
  loopstart:
    mov r9b, [r8]
    cmp r9b, 0
    je out
    cmp r9b, 96
    je backtick_rec
    cmp r9b, 126
    je tilde_ln
  normalprint:
    movzx edi, r9b
    call putchar
  incr:
    add r8, 1
    jmp loopstart

  out:
    pop r10
    pop r9
    pop r8
    pop rbp
    ret

  tilde_ln:
    mov r9b, 10
    cmp r10, 1
    je normalprint
    mov edi, 126
    call putchar
    mov edi, 92
    call putchar
    jmp normalprint

  backtick_rec:
    cmp r10b, 0
    je normalprint
    mov edi, 39
    call putchar
    mov edi, 0
    call printer
    mov edi, 39
    call putchar
    jmp incr

start:
    mov edi, 1
    call printer
    mov rax, 60
    mov rdi, 0
    syscall
    ret
