#include <stdio.h>
#include <curses.h>
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

    if(LINES < PROWS + 3 || COLS < PCOLS + 2) {
        endwin();
        print_error("Terminal too small.");
        printf("%d %d\n", LINES, COLS);
        return 1;
    }

    Dir playerdir = RIGHT;
    Snake *player = malloc(sizeof(Snake));
    if(player == NULL) {
        endwin();
        print_error("Error allocating memory.");
        return 2;
    }
    player->loc.x = 1;
    player->loc.y = 1;
    player->next = NULL;
    if(snake_add(player) == NULL) {
        endwin();
        print_error("Error allocating memory.");
        return 2;
    }

    srand(time(NULL));
    Coord *apple = malloc(sizeof(apple));
    if(apple == NULL) {
        endwin();
        free(player);
        print_error("Error allocating memory.");
        return 2;
    }
    apple->x = 0;
    apple->y = 0;
    new_apple(apple, player);

    long score = 0;
    drawscore(0, "Begin the game. Use the arrow keys to move. Eat food to grow.");
    char playing = 1;
    int rval = 0;
    while(playing) {
        switch(wgetch(playarea)) {
            case KEY_LEFT:
                playerdir = LEFT;
                break;
            case KEY_DOWN:
                playerdir = DOWN;
                break;
            case KEY_UP:
                playerdir = UP;
                break;
            case KEY_RIGHT:
                playerdir = RIGHT;
                break;
            case 'q':
                drawscore(score, "You quit.");
                playing = 0;
                break;
            default:
                break;
        }
        if(playing == 0) break;

        switch(snake_move(&player, playerdir, &score, apple)) {
            case 1:
                drawscore(score, "You hit a wall.");
                playing = 0;
                break;
            case 2:
                drawscore(score, "You hit yourself.");
                playing = 0;
                break;
            case 3:
                endwin();
                free(player);
                free(apple);
                print_error("Error allocating memory.");
                rval = 2;
                playing = 0;
                break;
        }
        if(playing == 0) break;

        drawgame(player, apple, score);
        usleep(125000);
    }

    snake_cleanup(player);
    free(apple);
    endwin();
    return rval;
}
