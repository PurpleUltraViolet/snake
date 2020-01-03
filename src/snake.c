#include <stdlib.h>
#include "util.h"
#include "snake.h"

Snake *snake_add(Snake *so) {
    Snake *s = so;
    while(s->next != NULL) {
        s = s->next;
    }
    Snake *r = malloc(sizeof(Snake));
    if(r == NULL) {
        return NULL;
    }
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

int snake_move(Snake **so, Dir dir, long *score, Coord *apple) {
    int rval;
    Snake *s;
    switch(dir) {
        case RIGHT:
            if((*so)->loc.x + 1 >= PCOLS) {
                rval = 1;
                break;
            }
            if(snake_checkifin(*so, (*so)->loc.x + 1, (*so)->loc.y)) {
                rval = 2;
                break;
            }
            s = malloc(sizeof(Snake));
            if(s == NULL) {
                rval = 3;
                break;
            }
            s->loc.x = (*so)->loc.x + 1;
            s->loc.y = (*so)->loc.y;
            s->next = *so;
            *so = s;
            if(s->loc.x != apple->x || s->loc.y != apple->y) {
                snake_delend(*so);
            } else {
                (*score)++;
                new_apple(apple, *so);
            }
            rval = 0;
            break;

        case LEFT:
            if((*so)->loc.x - 1 < 0) {
                rval = 1;
                break;
            }
            if(snake_checkifin(*so, (*so)->loc.x - 1, (*so)->loc.y)) {
                rval = 2;
                break;
            }
            s = malloc(sizeof(Snake));
            if(s == NULL) {
                rval = 3;
                break;
            }
            s->loc.x = (*so)->loc.x - 1;
            s->loc.y = (*so)->loc.y;
            s->next = *so;
            *so = s;
            if(s->loc.x != apple->x || s->loc.y != apple->y) {
                snake_delend(*so);
            } else {
                (*score)++;
                new_apple(apple, *so);
            }
            rval = 0;
            break;

        case DOWN:
            if((*so)->loc.y + 1 >= PROWS) {
                rval = 1;
                break;
            }
            if(snake_checkifin(*so, (*so)->loc.x, (*so)->loc.y + 1)) {
                rval = 2;
                break;
            }
            s = malloc(sizeof(Snake));
            if(s == NULL) {
                rval = 3;
                break;
            }
            s->loc.x = (*so)->loc.x;
            s->loc.y = (*so)->loc.y + 1;
            s->next = *so;
            *so = s;
            if(s->loc.x != apple->x || s->loc.y != apple->y) {
                snake_delend(*so);
            } else {
                (*score)++;
                new_apple(apple, *so);
            }
            rval = 0;
            break;

        case UP:
            if((*so)->loc.y - 1 < 0) {
                rval = 1;
                break;
            }
            if(snake_checkifin(*so, (*so)->loc.x, (*so)->loc.y - 1)) {
                rval = 2;
                break;
            }
            s = malloc(sizeof(Snake));
            if(s == NULL) {
                rval = 3;
                break;
            }
            s->loc.x = (*so)->loc.x;
            s->loc.y = (*so)->loc.y - 1;
            s->next = *so;
            *so = s;
            if(s->loc.x != apple->x || s->loc.y != apple->y) {
                snake_delend(*so);
            } else {
                (*score)++;
                new_apple(apple, *so);
            }
            rval = 0;
            break;
    }

    return rval;
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
