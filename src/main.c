#include <SDL2/SDL.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include "snake.h"
#include "draw.h"
#include "util.h"

int main(int argc, char **argv) {
    if(init() == NULL) {
        return 1;
    }

    Dir playerdir = RIGHT;
    Snake *player = malloc(sizeof(Snake));
    if(player == NULL) {
        cleanup();
        print_error("Error allocating memory.");
        return 2;
    }
    player->loc.x = 1;
    player->loc.y = 1;
    player->next = NULL;
    if(snake_add(player) == NULL) {
        cleanup();
        print_error("Error allocating memory.");
        return 2;
    }

    srand(time(NULL));
    Coord *apple = malloc(sizeof(apple));
    if(apple == NULL) {
        cleanup();
        free(player);
        print_error("Error allocating memory.");
        return 2;
    }
    apple->x = 0;
    apple->y = 0;
    new_apple(apple, player);

    Dir odir;
    long stime, etime, wtime;
    char playing = 1;
    int rval = 0;
    SDL_Event event;
    while(playing) {
        stime = gettimestamp();
        odir = playerdir;
        while(SDL_PollEvent(&event)) {
            switch(event.type) {
                case SDL_KEYDOWN:
                    switch(event.key.keysym.sym) {
                        case SDLK_k:
                        case SDLK_UP:
                            if(odir != DOWN)
                                playerdir = UP;
                            break;
                        case SDLK_j:
                        case SDLK_DOWN:
                            if(odir != UP)
                                playerdir = DOWN;
                            break;
                        case SDLK_h:
                        case SDLK_LEFT:
                            if(odir != RIGHT)
                                playerdir = LEFT;
                            break;
                        case SDLK_l:
                        case SDLK_RIGHT:
                            if(odir != LEFT)
                                playerdir = RIGHT;
                            break;
                        }
                    break;
                case SDL_QUIT:
                    cleanup();
                    drawend("You quit.");
                    playing = 0;
                    break;
                default:
                    break;
            }
        }
        if(playing == 0) break;

        switch(snake_move(&player, playerdir, apple)) {
            case 1:
                cleanup();
                drawend("You hit yourself.");
                playing = 0;
                break;
            case 2:
                cleanup();
                print_error("Error allocating memory.");
                rval = 2;
                playing = 0;
                break;
        }
        if(playing == 0) break;

        drawgame(player, apple);
        etime = gettimestamp();
        if(stime > etime) {
            wtime = etime + 86400000000 - stime;
        } else {
            wtime = etime - stime;
        }
        if(1000000/FRAMES - wtime > 0) {
            usleep((1000000/FRAMES) - wtime);
        }
    }

    snake_cleanup(player);
    free(apple);
    return rval;
}
