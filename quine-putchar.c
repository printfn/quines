#include <stdio.h>

void printer(const char *s, int r) {
    const char *s2 = s;
    char c;
    while ((c = *s++)) {
        if (c == 126 && r) putchar(10);
        else if (c == 96 && r) {
            putchar(34);
            printer(s2, 0);
            putchar(34);
        }
        else putchar(c);
    }
}

int main(void) {
    const char *s = "#include <stdio.h>~~void printer(const char *s, int r) {~    const char *s2 = s;~    char c;~    while ((c = *s++)) {~        if (c == 126 && r) putchar(10);~        else if (c == 96 && r) {~            putchar(34);~            printer(s2, 0);~            putchar(34);~        }~        else putchar(c);~    }~}~~int main(void) {~    const char *s = `;~    printer(s, 1);~}~";
    printer(s, 1);
}
