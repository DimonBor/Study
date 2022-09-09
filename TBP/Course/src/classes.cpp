#include <SDL2/SDL.h>
#include <iostream>
#include <cmath>
#include "const.cpp"

class Window {
  protected:
    SDL_Renderer *renderer;
    SDL_Window *window;
  public:
    Window () {
      SDL_CreateWindowAndRenderer(SCREEN_WIDTH, SCREEN_HEIGHT, 0, &window, &renderer);
      SDL_SetRenderDrawColor(renderer, 0, 0, 0, 0);
      SDL_RenderClear(renderer);
      SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
      SDL_RenderDrawPoint(renderer, SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    }
    ~Window (){
      SDL_DestroyRenderer(renderer);
      SDL_DestroyWindow(window);
    }
};


class Line : public Window {
  private:
    float length;
  public:
    Line(float newLength) {
      length = newLength;
      SDL_SetWindowTitle(window, "Borshch Line");
      SDL_SetRenderDrawColor(renderer, 0, 255, 0, 255);
    }

    void setLength(float newLength) { length = newLength; }
    float getLength() { return length; }

    void draw() {
      for (int i = SCREEN_WIDTH/2-length/2; i <= SCREEN_WIDTH/2+length/2; ++i) {
        SDL_RenderDrawPoint(renderer, i, SCREEN_HEIGHT/2);
      }
      SDL_RenderPresent(renderer);
    }
};


class Circle : public Window {
  private:
    float radius;
  public:
    Circle(float newRadius) {
      radius = newRadius;
      SDL_SetWindowTitle(window, "Borshch Circle");
      SDL_SetRenderDrawColor(renderer, 0, 0, 255, 255);
    }

    void setRadius(float newRadius) { radius = newRadius; }
    float getRadius() { return radius; }

    void draw() {
      for (int i = SCREEN_WIDTH/2-radius; i <= SCREEN_WIDTH/2+radius; ++i) {
        SDL_RenderDrawPoint(renderer, i, sqrt((radius*radius)-((i-SCREEN_WIDTH/2)*(i-SCREEN_WIDTH/2)))+SCREEN_HEIGHT/2);
        SDL_RenderDrawPoint(renderer, i, -sqrt((radius*radius)-((i-SCREEN_WIDTH/2)*(i-SCREEN_WIDTH/2)))+SCREEN_HEIGHT/2);
      }
      for (int i = SCREEN_HEIGHT/2-radius; i <= SCREEN_HEIGHT/2+radius; ++i) {
        SDL_RenderDrawPoint(renderer, sqrt((radius*radius)-((i-SCREEN_HEIGHT/2)*(i-SCREEN_HEIGHT/2)))+SCREEN_WIDTH/2, i);
        SDL_RenderDrawPoint(renderer, -sqrt((radius*radius)-((i-SCREEN_HEIGHT/2)*(i-SCREEN_HEIGHT/2)))+SCREEN_WIDTH/2, i);
      }
      SDL_RenderPresent(renderer);
    }
};


class Square : public Window {
  private:
    float side;
  public:
    Square(float newSide) {
      side = newSide;
      SDL_SetWindowTitle(window, "Borshch Square");
      SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
    }

    void setSide(float newSide) { side = newSide; }
    float getSide() { return side; }

    void draw() {
      for (int i = SCREEN_WIDTH/2-side; i <= SCREEN_WIDTH/2+side; ++i) {
        SDL_RenderDrawPoint(renderer, i, SCREEN_HEIGHT/2+side);
        SDL_RenderDrawPoint(renderer, i, SCREEN_HEIGHT/2-side);
      }
      for (int i = SCREEN_HEIGHT/2-side; i <= SCREEN_HEIGHT/2+side; ++i) {
        SDL_RenderDrawPoint(renderer, SCREEN_WIDTH/2+side, i);
        SDL_RenderDrawPoint(renderer, SCREEN_WIDTH/2-side, i);
      }
      SDL_RenderPresent(renderer);
    }
};


class Rhombus : public Window {
  private:
    float xRange;
  public:
    Rhombus(float newSide) {
      xRange = sqrt(2*pow(newSide,2));
      SDL_SetWindowTitle(window, "Borshch Rhombus");
      SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
    }

    void setSide(float newSide) { xRange = sqrt(2*pow(newSide,2)); }
    float getSide() { return sqrt(pow(xRange, 2)/2); }

    void draw() {
      for (int i = SCREEN_WIDTH/2-xRange; i <= SCREEN_WIDTH/2+xRange; ++i) {
        SDL_RenderDrawPoint(renderer, i, SCREEN_HEIGHT/2+xRange+abs(i-SCREEN_WIDTH/2)-xRange*2);
        SDL_RenderDrawPoint(renderer, i, SCREEN_HEIGHT/2+xRange-abs(i-SCREEN_WIDTH/2));
      }
      SDL_RenderPresent(renderer);
    }
};


class Segment : public Window {
  private:
    float angle, radius;
  public:
    Segment(float newAngle, float newRadius) {
      angle = newAngle/57.296;
      radius = newRadius;
      SDL_SetWindowTitle(window, "Borshch Segment");
      SDL_SetRenderDrawColor(renderer, 0, 0, 255, 255);
    }

    void setAngle(float newAngle) { angle = newAngle/57.296; }
    void setRadius(float newRadius) { radius = newRadius; }
    float getAngle() { return angle; }
    float getRadius() { return radius; }

    void draw() {
      for (int i = SCREEN_WIDTH/2-(2*radius*sin(angle/2))/2; i <= SCREEN_WIDTH/2+(2*radius*sin(angle/2))/2; ++i) {
        SDL_RenderDrawPoint(renderer, i, -sqrt((radius*radius)-((i-SCREEN_WIDTH/2)*(i-SCREEN_WIDTH/2)))+SCREEN_HEIGHT/2);
        SDL_RenderDrawPoint(renderer, i, SCREEN_HEIGHT/2-radius+(radius*(1-cos(angle/2))));
      }
      for (int i = SCREEN_HEIGHT/2-radius; i <= SCREEN_HEIGHT/2-radius+(radius*(1-cos(angle/2))); ++i) {
        SDL_RenderDrawPoint(renderer, sqrt((radius*radius)-((i-SCREEN_HEIGHT/2)*(i-SCREEN_HEIGHT/2)))+SCREEN_WIDTH/2, i);
        SDL_RenderDrawPoint(renderer, -sqrt((radius*radius)-((i-SCREEN_HEIGHT/2)*(i-SCREEN_HEIGHT/2)))+SCREEN_WIDTH/2, i);
      }
      SDL_RenderPresent(renderer);
    }
};
