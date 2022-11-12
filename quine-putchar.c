#include <stdio.h>

static char *S = "#include <stdio.h>~\
~\
static char *S = `;~\
~\
void printer(int r) {~\
    char c, *s = S;~\
    while ((c = *s++)) {~\
        if (c == 126 && r) putchar(10);~\
        else if (c == 126) { putchar(126); putchar(92); putchar(10); }~\
        else if (c == 96 && r) { putchar(34); printer(0); putchar(34); }~\
        else putchar(c);~\
    }~\
}~\
~\
int main(void) {~\
    printer(1);~\
}~\
";

void printer(int r) {
    char c, *s = S;
    while ((c = *s++)) {
        if (c == 126 && r) putchar(10);
        else if (c == 126) { putchar(126); putchar(92); putchar(10); }
        else if (c == 96 && r) { putchar(34); printer(0); putchar(34); }
        else putchar(c);
    }
}

int main(void) {
    printer(1);
}
