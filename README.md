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

Or when cross-compiling from e.g. `aarch64`:
```sh
sudo apt install nasm gcc-x86-64-linux-gnu qemu-user
nasm -f elf64 x86_64-linux.asm
x86_64-linux-gnu-ld -e start x86_64-linux.o
qemu-x86_64 ./a.out
```
