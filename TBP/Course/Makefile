CC=g++

CFLAGS=-c -Wall

all: course

course: main.o
	$(CC) main.o -o course -I/usr/local/include/SDL2 -L/usr/local/lib -lSDL2

main.o: main.cpp const.cpp classes.cpp
	$(CC) $(CFLAGS) main.cpp const.cpp classes.cpp

clean:
	rm -rf *.o course
