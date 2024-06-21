#include "raylib.h"

#define PLATFORM_WEB

#if defined(PLATFORM_WEB)
    #include <emscripten/emscripten.h>
#endif

static const int screenWidth = 800;
static const int screenHeight = 450;

static void InitGame(void);         // Initialize game
static void UpdateGame(void);       // Update game (one frame)
static void DrawGame(void);         // Draw game (one frame)
static void UnloadGame(void);       // Unload game
static void UpdateDrawFrame(void);  // Update and Draw (one frame)

int main(void)
{

    InitWindow(screenWidth, screenHeight, "raylib game");

    InitGame();
    emscripten_set_main_loop(UpdateDrawFrame, 60, 1);
    // De-Initialization

    UnloadGame();
    CloseWindow();


    return 0;
}


// Initialize game variables
void InitGame(void)
{

}

// Update game (one frame)
void UpdateGame(void)
{
    
}

// Draw game (one frame)
void DrawGame(void)
{
    BeginDrawing();

        ClearBackground(RAYWHITE);

        DrawText("TEST", GetScreenWidth()/2 - MeasureText("TEST", 20)/2, GetScreenHeight()/2 - 50, 20, GRAY);

    EndDrawing();
}


void UnloadGame(void)
{
    // TODO: Unload all dynamic loaded data (textures, sounds, models...)
}


void UpdateDrawFrame(void)
{
    UpdateGame();
    DrawGame();
}
