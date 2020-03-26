#include <stdlib.h>
#include "util.h"
#include "snake.h"

Snake *snake_add(Snake *so) {
    Snake *s = so;
    while(s->next != NULL) {
        s = s->next;
    }
    Snake *r = malloc(sizeof(Snake));
    if(r == NULL)
        return NULL;
    r->loc.x = s->loc.x;
    r->loc.y = s->loc.y;
    r->next = NULL;
    s->next = r;
    return r;
}

int snake_delend(Snake *so) {
    if(so->next == NULL) {
        free(so);
        return 0;
    }
    Snake *s = so->next;
    Snake *p = so;
    while(s->next != NULL) {
        s = s->next;
        p = p->next;
    }
    free(s);
    p->next = NULL;
    return 1;
}

char snake_checkifin(Snake *so, long x, long y) {
    char rval = 0;
    Snake *s = so;
    while(s->next != NULL) {
        if(s->loc.x == x && s->loc.y == y) {
            rval = 1;
            break;
        }
        s = s->next;
    }
    return rval;
}

int snake_move(Snake **so, Dir dir, Coord *apple) {
    int nx, ny;
    Snake *s;
    switch(dir) {
        case RIGHT:
            nx = (*so)->loc.x + 1;
            ny = (*so)->loc.y;
            break;

        case LEFT:
            nx = (*so)->loc.x - 1;
            ny = (*so)->loc.y;
            break;

        case DOWN:
            nx = (*so)->loc.x;
            ny = (*so)->loc.y + 1;
            break;

        case UP:
            nx = (*so)->loc.x;
            ny = (*so)->loc.y - 1;
            break;
    }

    if(nx < 0)
        nx = PCOLS - 1;
    else if(nx >= PCOLS)
        nx = 0;
    else if(ny < 0)
        ny = PROWS - 1;
    else if(ny >= PROWS)
        ny = 0;

    if(snake_checkifin(*so, nx, ny))
        return 1;

    s = malloc(sizeof(Snake));
    if(s == NULL)
        return 2;

    s->loc.x = nx;
    s->loc.y = ny;
    s->next = *so;
    *so = s;
    if(s->loc.x != apple->x || s->loc.y != apple->y)
        snake_delend(*so);
    else
        new_apple(apple, *so);

    return 0;
}

void snake_cleanup(Snake *s) {
    while(snake_delend(s))
        continue;
    return;
}

void new_apple(Coord *apple, Snake *s) {
    long x, y;
    do {
        x = rand() % PCOLS;
        y = rand() % PROWS;
    } while(snake_checkifin(s, x, y));
    apple->x = x;
    apple->y = y;
    return;
}
