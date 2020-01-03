#include <sys/time.h>
#include "util.h"

long gettimestamp(void) {
    struct timeval t;
    gettimeofday(&t, NULL);
    return t.tv_sec * 1000000 + t.tv_usec;
}
