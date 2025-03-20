include config.mk

default: debug

run: $(TARGET)
	./$(TARGET) img/test.png

$(RL_LIB):
	# HiDpi on Wayland w/ GLFW is broken
	# See: https://github.com/raysan5/raylib/issues/3872
	# $(MAKE) -C $(RL_PATH) PLATFORM=PLATFORM_DESKTOP GLFW_LINUX_ENABLE_WAYLAND=TRUE

	# Source Makefile's SDL variables are broken
	# See: https://github.com/raysan5/raylib/discussions/3764#discussioncomment-12568940
	$(MAKE) -C $(RL_PATH) PLATFORM=PLATFORM_DESKTOP_SDL \
		SDL_INCLUDE_PATH="$(shell pkg-config --cflags sdl2)" \
		SDL_LIBRARY_PATH="$(shell pkg-config --libs sdl2)" \
		INCLUDE_PATHS="$(shell pkg-config --cflags sdl2)" \
		LDFLAGS="$(shell pkg-config --libs sdl2)"

$(TARGET): $(RL_LIB)
	clang $(SRCS) $(CFLAGS) $(RELEASE_FLAGS) $(LDFLAGS) -o $(TARGET)

debug: $(RL_LIB)
	clang $(SRCS) $(CFLAGS) $(DEBUG_FLAGS) $(LDFLAGS) -o $(TARGET)

clean:
	rm -f *.o $(TARGET)

clean-lib:
	$(MAKE) -C $(RL_PATH) clean

.PHONY: clean debug
