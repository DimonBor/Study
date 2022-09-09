#!/bin/bash

g++ -c Vigenere.cpp
g++ -o Vigenere.o Vigenere -lsfml-graphics -lsfml-window -lsfml-system
