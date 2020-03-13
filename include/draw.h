#ifndef DRAW_H_
#define DRAW_H_

#include <SDL2/SDL.h>
#include "snake.h"

#define SQUARE_SIZE 10
#define SQUARE_GAP 2

extern SDL_Window *win;
extern SDL_Surface *screen;

SDL_Surface *init(void);

void drawgame(Snake *, Coord *);

void drawend(char *);

void cleanup(void);

#endif
