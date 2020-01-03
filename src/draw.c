#include <curses.h>
#include <unistd.h>
#include <stdio.h>
#include "util.h"
#include "snake.h"
#include "draw.h"

#define S_HEAD '%'
#define S_BODY '#'
#define APPLE '*'

WINDOW *playarea = NULL;
WINDOW *scorearea = NULL;

WINDOW *init() {
    if(initscr() == NULL)
        return NULL;
    playarea = newwin(PROWS + 2, PCOLS + 2, 1, 0);
    if(playarea == NULL)
        return NULL;
    scorearea = newwin(1, PCOLS + 2, 0, 0);
    cbreak();
    noecho();
    keypad(playarea, TRUE);
    nodelay(playarea, TRUE);
    curs_set(0);
    return stdscr;
}

void drawgame(Snake *head, Coord *apple_ptr, long score) {
    werase(playarea);

    /* Draw score */
    mvwprintw(scorearea, 0, 0, "Score: %lu", score);

    /* Draw boundaries */
    wborder(playarea, 0, 0, 0, 0, 0, 0, 0, 0);
    touchwin(playarea);

    /* Draw snake */
    Snake *p = head;
    mvwaddch(playarea, p->loc.y + 1, p->loc.x + 1, S_HEAD);
    p = p->next;
    while(p != NULL) {
        mvwaddch(playarea, p->loc.y + 1, p->loc.x + 1, S_BODY);
        p = p->next;
    }

    /* Draw apple */
    mvwaddch(playarea, apple_ptr->y + 1, apple_ptr->x + 1, APPLE);

    wrefresh(playarea);
    wrefresh(scorearea);

    return;
}

void drawscore(long score, char *msg) {
    werase(playarea);
    mvwprintw(scorearea, 0, 0, "Score: %lu", score);
    wrefresh(scorearea);
    mvwprintw(playarea, 0, 0, msg);
    wrefresh(playarea);

    usleep(1000000);

    while(wgetch(playarea) != ERR) continue;
    mvwprintw(playarea, 2, 0, "Press any key to continue...");
    wrefresh(playarea);
    nodelay(playarea, FALSE);
    wgetch(playarea);
    nodelay(playarea, TRUE);
}
