# quines

## C

```sh
diff quine.c <(clang quine.c && ./a.out)
```

## C (`putchar`)

```sh
diff quine-putchar.c <(clang quine-putchar.c && ./a.out)
```

## Assembly (linux-x86_64)

```sh
nasm -f elf64 x86_64-linux.asm
ld -e start x86_64-linux.o
diff x86_64-linux.asm <(./a.out)
```
