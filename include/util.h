#ifndef UTIL_H_
#define UTIL_H_

#include <stdio.h>

#ifndef PROWS
#define PROWS 21
#endif

#ifndef PCOLS
#define PCOLS 78
#endif

#define log(msg, ...) fprintf(stderr, msg, ##__VA_ARGS__);
#define print_error(msg) fprintf(stderr, "Error: %s\n", msg);

typedef struct _coord {
    long x;
    long y;
} Coord;

#endif
