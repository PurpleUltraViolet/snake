#ifndef DRAW_H_
#define DRAW_H_

#include "snake.h"

extern WINDOW *playarea;
extern WINDOW *scorearea;

WINDOW *init();

void drawgame(Snake *, Coord *, long);

void drawscore(long, char *);

#endif
