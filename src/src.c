#include <stdio.h>

#include "raylib.h"

int main(int argc, char *argv[]) {
	if (argc != 2) {
		printf("Usage: %s <file>\n", argv[0]);
		return 1;
	}

	InitWindow(800, 450, "raylib [core] example - basic window");

	while (!WindowShouldClose()) {
		BeginDrawing();
		ClearBackground(RAYWHITE);
		DrawText("Congrats! You created your first window!", 190, 200, 20,
				 LIGHTGRAY);
		EndDrawing();
	}

	CloseWindow();

	return 0;
}
