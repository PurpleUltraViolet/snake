CC = gcc
MKDIR = mkdir -p
SRC = src
BUILD = build
BIN = bin
TARGET = $(BIN)/snake
CFLAGS = -Wall -Wpedantic -Werror
INCLUDE = include
LIB = -lncurses

$(TARGET) : $(patsubst $(SRC)/%.c, $(BUILD)/%.o, $(wildcard $(SRC)/*))
	@$(MKDIR) $(BIN)
	$(CC) $(CFLAGS) -I$(INCLUDE) -o $(TARGET) $^ $(LIB)

$(BUILD)/%.o : $(SRC)/%.c
	@$(MKDIR) $(BUILD)
	$(CC) -c $(CFLAGS) -I$(INCLUDE) -o $@ $^ $(LIB)

clean:
	$(RM) $(BUILD)/*
	$(RM) $(BIN)/*

depend: .depend

.depend:
	makedepend -I$(INCLUDE) $(SRC)/* &> /dev/null

include depend
# DO NOT DELETE

src/draw.o: /usr/include/curses.h /usr/include/ncurses_dll.h
src/draw.o: /usr/include/stdint.h /usr/include/bits/libc-header-start.h
src/draw.o: /usr/include/features.h /usr/include/stdc-predef.h
src/draw.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
src/draw.o: /usr/include/bits/long-double.h /usr/include/gnu/stubs.h
src/draw.o: /usr/include/bits/types.h /usr/include/bits/timesize.h
src/draw.o: /usr/include/bits/typesizes.h /usr/include/bits/time64.h
src/draw.o: /usr/include/bits/wchar.h /usr/include/bits/stdint-intn.h
src/draw.o: /usr/include/bits/stdint-uintn.h /usr/include/stdio.h
src/draw.o: /usr/include/bits/types/__fpos_t.h
src/draw.o: /usr/include/bits/types/__mbstate_t.h
src/draw.o: /usr/include/bits/types/__fpos64_t.h
src/draw.o: /usr/include/bits/types/__FILE.h /usr/include/bits/types/FILE.h
src/draw.o: /usr/include/bits/types/struct_FILE.h
src/draw.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
src/draw.o: /usr/include/unctrl.h /usr/include/unistd.h
src/draw.o: /usr/include/bits/posix_opt.h /usr/include/bits/environments.h
src/draw.o: /usr/include/bits/confname.h /usr/include/bits/getopt_posix.h
src/draw.o: /usr/include/bits/getopt_core.h /usr/include/bits/unistd_ext.h
src/draw.o: include/util.h include/snake.h include/draw.h
src/main.o: /usr/include/stdio.h /usr/include/bits/libc-header-start.h
src/main.o: /usr/include/features.h /usr/include/stdc-predef.h
src/main.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
src/main.o: /usr/include/bits/long-double.h /usr/include/gnu/stubs.h
src/main.o: /usr/include/bits/types.h /usr/include/bits/timesize.h
src/main.o: /usr/include/bits/typesizes.h /usr/include/bits/time64.h
src/main.o: /usr/include/bits/types/__fpos_t.h
src/main.o: /usr/include/bits/types/__mbstate_t.h
src/main.o: /usr/include/bits/types/__fpos64_t.h
src/main.o: /usr/include/bits/types/__FILE.h /usr/include/bits/types/FILE.h
src/main.o: /usr/include/bits/types/struct_FILE.h
src/main.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
src/main.o: /usr/include/curses.h /usr/include/ncurses_dll.h
src/main.o: /usr/include/stdint.h /usr/include/bits/wchar.h
src/main.o: /usr/include/bits/stdint-intn.h /usr/include/bits/stdint-uintn.h
src/main.o: /usr/include/unctrl.h /usr/include/stdlib.h
src/main.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
src/main.o: /usr/include/bits/floatn.h /usr/include/bits/floatn-common.h
src/main.o: /usr/include/sys/types.h /usr/include/bits/types/clock_t.h
src/main.o: /usr/include/bits/types/clockid_t.h
src/main.o: /usr/include/bits/types/time_t.h
src/main.o: /usr/include/bits/types/timer_t.h /usr/include/endian.h
src/main.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
src/main.o: /usr/include/bits/uintn-identity.h /usr/include/sys/select.h
src/main.o: /usr/include/bits/select.h /usr/include/bits/types/sigset_t.h
src/main.o: /usr/include/bits/types/__sigset_t.h
src/main.o: /usr/include/bits/types/struct_timeval.h
src/main.o: /usr/include/bits/types/struct_timespec.h
src/main.o: /usr/include/bits/pthreadtypes.h
src/main.o: /usr/include/bits/thread-shared-types.h
src/main.o: /usr/include/bits/pthreadtypes-arch.h /usr/include/alloca.h
src/main.o: /usr/include/bits/stdlib-float.h /usr/include/time.h
src/main.o: /usr/include/bits/time.h /usr/include/bits/types/struct_tm.h
src/main.o: /usr/include/bits/types/struct_itimerspec.h
src/main.o: /usr/include/bits/types/locale_t.h
src/main.o: /usr/include/bits/types/__locale_t.h /usr/include/unistd.h
src/main.o: /usr/include/bits/posix_opt.h /usr/include/bits/environments.h
src/main.o: /usr/include/bits/confname.h /usr/include/bits/getopt_posix.h
src/main.o: /usr/include/bits/getopt_core.h /usr/include/bits/unistd_ext.h
src/main.o: include/snake.h include/util.h include/draw.h
src/snake.o: /usr/include/stdlib.h /usr/include/bits/libc-header-start.h
src/snake.o: /usr/include/features.h /usr/include/stdc-predef.h
src/snake.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
src/snake.o: /usr/include/bits/long-double.h /usr/include/gnu/stubs.h
src/snake.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
src/snake.o: /usr/include/bits/floatn.h /usr/include/bits/floatn-common.h
src/snake.o: /usr/include/sys/types.h /usr/include/bits/types.h
src/snake.o: /usr/include/bits/timesize.h /usr/include/bits/typesizes.h
src/snake.o: /usr/include/bits/time64.h /usr/include/bits/types/clock_t.h
src/snake.o: /usr/include/bits/types/clockid_t.h
src/snake.o: /usr/include/bits/types/time_t.h
src/snake.o: /usr/include/bits/types/timer_t.h
src/snake.o: /usr/include/bits/stdint-intn.h /usr/include/endian.h
src/snake.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
src/snake.o: /usr/include/bits/uintn-identity.h /usr/include/sys/select.h
src/snake.o: /usr/include/bits/select.h /usr/include/bits/types/sigset_t.h
src/snake.o: /usr/include/bits/types/__sigset_t.h
src/snake.o: /usr/include/bits/types/struct_timeval.h
src/snake.o: /usr/include/bits/types/struct_timespec.h
src/snake.o: /usr/include/bits/pthreadtypes.h
src/snake.o: /usr/include/bits/thread-shared-types.h
src/snake.o: /usr/include/bits/pthreadtypes-arch.h /usr/include/alloca.h
src/snake.o: /usr/include/bits/stdlib-float.h include/util.h
src/snake.o: /usr/include/stdio.h /usr/include/bits/types/__fpos_t.h
src/snake.o: /usr/include/bits/types/__mbstate_t.h
src/snake.o: /usr/include/bits/types/__fpos64_t.h
src/snake.o: /usr/include/bits/types/__FILE.h /usr/include/bits/types/FILE.h
src/snake.o: /usr/include/bits/types/struct_FILE.h
src/snake.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
src/snake.o: include/snake.h
