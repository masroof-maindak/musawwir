RL_PATH = lib/raylib/src
RL_LIB = $(RL_PATH)/libraylib.a
RL_INCLUDE = $(RL_PATH)

CFLAGS = -Wall -Wextra -pedantic -std=c99 -I$(RL_INCLUDE)
LDFLAGS = $(RL_LIB) -lSDL2 -lm -lpthread -ldl -lrt -lX11
RELEASE_FLAGS = -march=native -O3
DEBUG_FLAGS = -g3 -O0

SRCDIR = src
SRCS = $(wildcard ${SRCDIR}/*.c)
TARGET = mswr