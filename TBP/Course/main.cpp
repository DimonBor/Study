#include <iostream>
#define SDL_MAIN_HANDLED
#include <SDL2/SDL.h>
#include "classes.cpp"

int main() {

  SDL_Event event;
  SDL_Init(SDL_INIT_VIDEO);

  Line newLine(100.);
  Circle newCircle(50.);
  Square newSquare(50.);
  Rhombus newRhombus(35.);
  Segment newSegment(120., 50.);

  newLine.draw();
  newCircle.draw();
  newSquare.draw();
  newRhombus.draw();
  newSegment.draw();

  while (1) {
    if (SDL_PollEvent(&event) &&
      (event.window.event == SDL_WINDOWEVENT_CLOSE || event.type == SDL_QUIT))
      break;
  }

  SDL_Quit();
  return EXIT_SUCCESS;

}
