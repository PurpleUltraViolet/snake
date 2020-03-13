#include <SDL2/SDL.h>
#include <unistd.h>
#include <stdio.h>
#include "util.h"
#include "snake.h"
#include "draw.h"

SDL_Window *win = NULL;
SDL_Surface *screen = NULL;

SDL_Surface *init(void) {
    if(SDL_Init(SDL_INIT_VIDEO)) {
        print_error("Init failed\n");
        return NULL;
    }

    win = SDL_CreateWindow("Snake",
                           SDL_WINDOWPOS_CENTERED,
                           SDL_WINDOWPOS_CENTERED,
                           SQUARE_SIZE * PCOLS + SQUARE_GAP * (PCOLS - 1),
                           SQUARE_SIZE * PROWS + SQUARE_GAP * (PROWS - 1),
                           0);
    if(!win) {
        print_error("Window creation failed\n");
        return NULL;
    }

    screen = SDL_GetWindowSurface(win);
    if(!screen) {
        print_error("Surface creation failed\n");
        SDL_DestroyWindow(win);
        return NULL;
    }

    return screen;
}

void drawgame(Snake *head, Coord *apple_ptr) {
    SDL_FillRect(screen, NULL, SDL_MapRGB(screen->format, 0, 0, 0));

    SDL_Rect square = {.x = 0, .y = 0, .w = SQUARE_SIZE, .h = SQUARE_SIZE};

    Snake *p = head;
    square.x = p->loc.x * SQUARE_SIZE + p->loc.x * SQUARE_GAP;
    square.y = p->loc.y * SQUARE_SIZE + p->loc.y * SQUARE_GAP;
    SDL_FillRect(screen, &square, SDL_MapRGB(screen->format, 0, 255, 0));
    p = p->next;
    while(p != NULL) {
        square.x = p->loc.x * SQUARE_SIZE + p->loc.x * SQUARE_GAP;
        square.y = p->loc.y * SQUARE_SIZE + p->loc.y * SQUARE_GAP;
        SDL_FillRect(screen, &square, SDL_MapRGB(screen->format, 0, 127, 0));
        p = p->next;
    }

    square.x = apple_ptr->x * SQUARE_SIZE + apple_ptr->x * SQUARE_GAP;
    square.y = apple_ptr->y * SQUARE_SIZE + apple_ptr->y * SQUARE_GAP;
    SDL_FillRect(screen, &square, SDL_MapRGB(screen->format, 255, 0, 0));

    SDL_UpdateWindowSurface(win);

    return;
}

void drawend(char *msg) {
    printf("%s\n", msg);
}

void cleanup(void) {
    SDL_DestroyWindow(win);
}
