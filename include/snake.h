#ifndef SNAKE_H_
#define SNAKE_H_

#include "util.h"

typedef struct _snake {
    Coord loc;
    struct _snake *next;
} Snake;

typedef enum _dir {LEFT, UP, RIGHT, DOWN} Dir;

Snake *snake_add(Snake *);

int snake_delend(Snake *);

char snake_checkifin(Snake *, long, long);

int snake_move(Snake **, Dir, long *, Coord *);

void snake_cleanup(Snake *);

void new_apple(Coord *, Snake *);

#endif
