CC = gcc
MKDIR = mkdir -p
SRC = src
BUILD = build
BIN = bin
TARGET = $(BIN)/snake
CFLAGS = -Wall -Wpedantic -Werror
INCLUDE = include
LIB = -lSDL2

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

src/draw.o: /usr/include/SDL2/SDL.h /usr/include/SDL2/SDL_main.h
src/draw.o: /usr/include/SDL2/SDL_stdinc.h /usr/include/SDL2/SDL_config.h
src/draw.o: /usr/include/SDL2/SDL_platform.h /usr/include/SDL2/begin_code.h
src/draw.o: /usr/include/SDL2/close_code.h /usr/include/sys/types.h
src/draw.o: /usr/include/features.h /usr/include/stdc-predef.h
src/draw.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
src/draw.o: /usr/include/bits/long-double.h /usr/include/gnu/stubs.h
src/draw.o: /usr/include/bits/types.h /usr/include/bits/timesize.h
src/draw.o: /usr/include/bits/typesizes.h /usr/include/bits/time64.h
src/draw.o: /usr/include/bits/types/clock_t.h
src/draw.o: /usr/include/bits/types/clockid_t.h
src/draw.o: /usr/include/bits/types/time_t.h
src/draw.o: /usr/include/bits/types/timer_t.h /usr/include/bits/stdint-intn.h
src/draw.o: /usr/include/endian.h /usr/include/bits/endian.h
src/draw.o: /usr/include/bits/endianness.h /usr/include/bits/byteswap.h
src/draw.o: /usr/include/bits/uintn-identity.h /usr/include/sys/select.h
src/draw.o: /usr/include/bits/select.h /usr/include/bits/types/sigset_t.h
src/draw.o: /usr/include/bits/types/__sigset_t.h
src/draw.o: /usr/include/bits/types/struct_timeval.h
src/draw.o: /usr/include/bits/types/struct_timespec.h
src/draw.o: /usr/include/bits/pthreadtypes.h
src/draw.o: /usr/include/bits/thread-shared-types.h
src/draw.o: /usr/include/bits/pthreadtypes-arch.h
src/draw.o: /usr/include/bits/struct_mutex.h
src/draw.o: /usr/include/bits/struct_rwlock.h /usr/include/stdio.h
src/draw.o: /usr/include/bits/libc-header-start.h
src/draw.o: /usr/include/bits/types/__fpos_t.h
src/draw.o: /usr/include/bits/types/__mbstate_t.h
src/draw.o: /usr/include/bits/types/__fpos64_t.h
src/draw.o: /usr/include/bits/types/__FILE.h /usr/include/bits/types/FILE.h
src/draw.o: /usr/include/bits/types/struct_FILE.h
src/draw.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
src/draw.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
src/draw.o: /usr/include/bits/waitstatus.h /usr/include/bits/floatn.h
src/draw.o: /usr/include/bits/floatn-common.h /usr/include/alloca.h
src/draw.o: /usr/include/bits/stdlib-float.h /usr/include/string.h
src/draw.o: /usr/include/bits/types/locale_t.h
src/draw.o: /usr/include/bits/types/__locale_t.h /usr/include/strings.h
src/draw.o: /usr/include/wchar.h /usr/include/bits/wchar.h
src/draw.o: /usr/include/bits/types/wint_t.h
src/draw.o: /usr/include/bits/types/mbstate_t.h /usr/include/inttypes.h
src/draw.o: /usr/include/stdint.h /usr/include/bits/stdint-uintn.h
src/draw.o: /usr/include/ctype.h /usr/include/math.h
src/draw.o: /usr/include/bits/math-vector.h
src/draw.o: /usr/include/bits/libm-simd-decl-stubs.h
src/draw.o: /usr/include/bits/flt-eval-method.h /usr/include/bits/fp-logb.h
src/draw.o: /usr/include/bits/fp-fast.h
src/draw.o: /usr/include/bits/mathcalls-helper-functions.h
src/draw.o: /usr/include/bits/mathcalls.h
src/draw.o: /usr/include/bits/mathcalls-narrow.h
src/draw.o: /usr/include/bits/iscanonical.h /usr/include/SDL2/SDL_assert.h
src/draw.o: /usr/include/SDL2/SDL_atomic.h /usr/include/SDL2/SDL_audio.h
src/draw.o: /usr/include/SDL2/SDL_error.h /usr/include/SDL2/SDL_endian.h
src/draw.o: /usr/include/SDL2/SDL_mutex.h /usr/include/SDL2/SDL_thread.h
src/draw.o: /usr/include/SDL2/SDL_rwops.h /usr/include/SDL2/SDL_clipboard.h
src/draw.o: /usr/include/SDL2/SDL_cpuinfo.h /usr/include/SDL2/SDL_events.h
src/draw.o: /usr/include/SDL2/SDL_video.h /usr/include/SDL2/SDL_pixels.h
src/draw.o: /usr/include/SDL2/SDL_rect.h /usr/include/SDL2/SDL_surface.h
src/draw.o: /usr/include/SDL2/SDL_blendmode.h
src/draw.o: /usr/include/SDL2/SDL_keyboard.h /usr/include/SDL2/SDL_keycode.h
src/draw.o: /usr/include/SDL2/SDL_scancode.h /usr/include/SDL2/SDL_mouse.h
src/draw.o: /usr/include/SDL2/SDL_joystick.h
src/draw.o: /usr/include/SDL2/SDL_gamecontroller.h
src/draw.o: /usr/include/SDL2/SDL_quit.h /usr/include/SDL2/SDL_gesture.h
src/draw.o: /usr/include/SDL2/SDL_touch.h /usr/include/SDL2/SDL_filesystem.h
src/draw.o: /usr/include/SDL2/SDL_haptic.h /usr/include/SDL2/SDL_hints.h
src/draw.o: /usr/include/SDL2/SDL_loadso.h /usr/include/SDL2/SDL_log.h
src/draw.o: /usr/include/SDL2/SDL_messagebox.h /usr/include/SDL2/SDL_power.h
src/draw.o: /usr/include/SDL2/SDL_render.h /usr/include/SDL2/SDL_sensor.h
src/draw.o: /usr/include/SDL2/SDL_shape.h /usr/include/SDL2/SDL_system.h
src/draw.o: /usr/include/SDL2/SDL_timer.h /usr/include/SDL2/SDL_version.h
src/draw.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
src/draw.o: /usr/include/bits/environments.h /usr/include/bits/confname.h
src/draw.o: /usr/include/bits/getopt_posix.h /usr/include/bits/getopt_core.h
src/draw.o: /usr/include/bits/unistd_ext.h include/util.h include/snake.h
src/draw.o: include/draw.h
src/main.o: /usr/include/SDL2/SDL.h /usr/include/SDL2/SDL_main.h
src/main.o: /usr/include/SDL2/SDL_stdinc.h /usr/include/SDL2/SDL_config.h
src/main.o: /usr/include/SDL2/SDL_platform.h /usr/include/SDL2/begin_code.h
src/main.o: /usr/include/SDL2/close_code.h /usr/include/sys/types.h
src/main.o: /usr/include/features.h /usr/include/stdc-predef.h
src/main.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
src/main.o: /usr/include/bits/long-double.h /usr/include/gnu/stubs.h
src/main.o: /usr/include/bits/types.h /usr/include/bits/timesize.h
src/main.o: /usr/include/bits/typesizes.h /usr/include/bits/time64.h
src/main.o: /usr/include/bits/types/clock_t.h
src/main.o: /usr/include/bits/types/clockid_t.h
src/main.o: /usr/include/bits/types/time_t.h
src/main.o: /usr/include/bits/types/timer_t.h /usr/include/bits/stdint-intn.h
src/main.o: /usr/include/endian.h /usr/include/bits/endian.h
src/main.o: /usr/include/bits/endianness.h /usr/include/bits/byteswap.h
src/main.o: /usr/include/bits/uintn-identity.h /usr/include/sys/select.h
src/main.o: /usr/include/bits/select.h /usr/include/bits/types/sigset_t.h
src/main.o: /usr/include/bits/types/__sigset_t.h
src/main.o: /usr/include/bits/types/struct_timeval.h
src/main.o: /usr/include/bits/types/struct_timespec.h
src/main.o: /usr/include/bits/pthreadtypes.h
src/main.o: /usr/include/bits/thread-shared-types.h
src/main.o: /usr/include/bits/pthreadtypes-arch.h
src/main.o: /usr/include/bits/struct_mutex.h
src/main.o: /usr/include/bits/struct_rwlock.h /usr/include/stdio.h
src/main.o: /usr/include/bits/libc-header-start.h
src/main.o: /usr/include/bits/types/__fpos_t.h
src/main.o: /usr/include/bits/types/__mbstate_t.h
src/main.o: /usr/include/bits/types/__fpos64_t.h
src/main.o: /usr/include/bits/types/__FILE.h /usr/include/bits/types/FILE.h
src/main.o: /usr/include/bits/types/struct_FILE.h
src/main.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
src/main.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
src/main.o: /usr/include/bits/waitstatus.h /usr/include/bits/floatn.h
src/main.o: /usr/include/bits/floatn-common.h /usr/include/alloca.h
src/main.o: /usr/include/bits/stdlib-float.h /usr/include/string.h
src/main.o: /usr/include/bits/types/locale_t.h
src/main.o: /usr/include/bits/types/__locale_t.h /usr/include/strings.h
src/main.o: /usr/include/wchar.h /usr/include/bits/wchar.h
src/main.o: /usr/include/bits/types/wint_t.h
src/main.o: /usr/include/bits/types/mbstate_t.h /usr/include/inttypes.h
src/main.o: /usr/include/stdint.h /usr/include/bits/stdint-uintn.h
src/main.o: /usr/include/ctype.h /usr/include/math.h
src/main.o: /usr/include/bits/math-vector.h
src/main.o: /usr/include/bits/libm-simd-decl-stubs.h
src/main.o: /usr/include/bits/flt-eval-method.h /usr/include/bits/fp-logb.h
src/main.o: /usr/include/bits/fp-fast.h
src/main.o: /usr/include/bits/mathcalls-helper-functions.h
src/main.o: /usr/include/bits/mathcalls.h
src/main.o: /usr/include/bits/mathcalls-narrow.h
src/main.o: /usr/include/bits/iscanonical.h /usr/include/SDL2/SDL_assert.h
src/main.o: /usr/include/SDL2/SDL_atomic.h /usr/include/SDL2/SDL_audio.h
src/main.o: /usr/include/SDL2/SDL_error.h /usr/include/SDL2/SDL_endian.h
src/main.o: /usr/include/SDL2/SDL_mutex.h /usr/include/SDL2/SDL_thread.h
src/main.o: /usr/include/SDL2/SDL_rwops.h /usr/include/SDL2/SDL_clipboard.h
src/main.o: /usr/include/SDL2/SDL_cpuinfo.h /usr/include/SDL2/SDL_events.h
src/main.o: /usr/include/SDL2/SDL_video.h /usr/include/SDL2/SDL_pixels.h
src/main.o: /usr/include/SDL2/SDL_rect.h /usr/include/SDL2/SDL_surface.h
src/main.o: /usr/include/SDL2/SDL_blendmode.h
src/main.o: /usr/include/SDL2/SDL_keyboard.h /usr/include/SDL2/SDL_keycode.h
src/main.o: /usr/include/SDL2/SDL_scancode.h /usr/include/SDL2/SDL_mouse.h
src/main.o: /usr/include/SDL2/SDL_joystick.h
src/main.o: /usr/include/SDL2/SDL_gamecontroller.h
src/main.o: /usr/include/SDL2/SDL_quit.h /usr/include/SDL2/SDL_gesture.h
src/main.o: /usr/include/SDL2/SDL_touch.h /usr/include/SDL2/SDL_filesystem.h
src/main.o: /usr/include/SDL2/SDL_haptic.h /usr/include/SDL2/SDL_hints.h
src/main.o: /usr/include/SDL2/SDL_loadso.h /usr/include/SDL2/SDL_log.h
src/main.o: /usr/include/SDL2/SDL_messagebox.h /usr/include/SDL2/SDL_power.h
src/main.o: /usr/include/SDL2/SDL_render.h /usr/include/SDL2/SDL_sensor.h
src/main.o: /usr/include/SDL2/SDL_shape.h /usr/include/SDL2/SDL_system.h
src/main.o: /usr/include/SDL2/SDL_timer.h /usr/include/SDL2/SDL_version.h
src/main.o: /usr/include/time.h /usr/include/bits/time.h
src/main.o: /usr/include/bits/types/struct_tm.h
src/main.o: /usr/include/bits/types/struct_itimerspec.h /usr/include/unistd.h
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
src/snake.o: /usr/include/bits/endian.h /usr/include/bits/endianness.h
src/snake.o: /usr/include/bits/byteswap.h /usr/include/bits/uintn-identity.h
src/snake.o: /usr/include/sys/select.h /usr/include/bits/select.h
src/snake.o: /usr/include/bits/types/sigset_t.h
src/snake.o: /usr/include/bits/types/__sigset_t.h
src/snake.o: /usr/include/bits/types/struct_timeval.h
src/snake.o: /usr/include/bits/types/struct_timespec.h
src/snake.o: /usr/include/bits/pthreadtypes.h
src/snake.o: /usr/include/bits/thread-shared-types.h
src/snake.o: /usr/include/bits/pthreadtypes-arch.h
src/snake.o: /usr/include/bits/struct_mutex.h
src/snake.o: /usr/include/bits/struct_rwlock.h /usr/include/alloca.h
src/snake.o: /usr/include/bits/stdlib-float.h include/util.h
src/snake.o: /usr/include/stdio.h /usr/include/bits/types/__fpos_t.h
src/snake.o: /usr/include/bits/types/__mbstate_t.h
src/snake.o: /usr/include/bits/types/__fpos64_t.h
src/snake.o: /usr/include/bits/types/__FILE.h /usr/include/bits/types/FILE.h
src/snake.o: /usr/include/bits/types/struct_FILE.h
src/snake.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
src/snake.o: include/snake.h
src/util.o: /usr/include/sys/time.h /usr/include/features.h
src/util.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
src/util.o: /usr/include/bits/wordsize.h /usr/include/bits/long-double.h
src/util.o: /usr/include/gnu/stubs.h /usr/include/bits/types.h
src/util.o: /usr/include/bits/timesize.h /usr/include/bits/typesizes.h
src/util.o: /usr/include/bits/time64.h /usr/include/bits/types/time_t.h
src/util.o: /usr/include/bits/types/struct_timeval.h
src/util.o: /usr/include/sys/select.h /usr/include/bits/select.h
src/util.o: /usr/include/bits/types/sigset_t.h
src/util.o: /usr/include/bits/types/__sigset_t.h
src/util.o: /usr/include/bits/types/struct_timespec.h
src/util.o: /usr/include/bits/endian.h /usr/include/bits/endianness.h
src/util.o: include/util.h /usr/include/stdio.h
src/util.o: /usr/include/bits/libc-header-start.h
src/util.o: /usr/include/bits/types/__fpos_t.h
src/util.o: /usr/include/bits/types/__mbstate_t.h
src/util.o: /usr/include/bits/types/__fpos64_t.h
src/util.o: /usr/include/bits/types/__FILE.h /usr/include/bits/types/FILE.h
src/util.o: /usr/include/bits/types/struct_FILE.h
src/util.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
