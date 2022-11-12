#include <stdio.h>

void printer(const char *s, char a, int recurse) {
    const char *s2 = s;
    char c;
    while ((c = *s++)) {
        if (c == 126 && recurse) putchar(a);
        else if (c == 96 && recurse) {
            putchar(34);
            printer(s2, '1', 0);
            putchar(34);
        }
        else putchar(c);
    }
}

int main(void) {
    const char *s = "#include <stdio.h>~~void printer(const char *s, char a, int recurse) {~    const char *s2 = s;~    char c;~    while ((c = *s++)) {~        if (c == 126 && recurse) putchar(a);~        else if (c == 96 && recurse) {~            putchar(34);~            printer(s2, '1', 0);~            putchar(34);~        }~        else putchar(c);~    }~}~~int main(void) {~    const char *s = `;~    printer(s, 10, 1);~}~";
    printer(s, 10, 1);
}
