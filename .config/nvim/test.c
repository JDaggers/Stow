#include <stdio.h>
#include <stdlib.h>

#define STOPAT 10000000 /* finish when... */
struct woow {
    int wow;
};

int main(int argc, char *argv[]) {
    int old, older, new;
    int days;

    /* set up the first two days */
    old = older = 1;
    days = 2;

    /* and get into the swing of splitting */
    while (old < STOPAT) {
        days += 1;
        new = old + older;
        printf("%d, n = %d\n", new, days);
        /* now keep the records straight */
        older = old;
        old = new;
    }
    /* job done */
    return 0;
}

void wow(int wow) { printf("%d wow", wow); }
