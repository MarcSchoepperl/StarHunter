CC = g++ -std=c++11
SRC=$(wildcard src/*.cpp)
OUT = StarHunter
LIBS = $(shell pkg-config --cflags --libs gtk+-3.0)
CFLAGS = -Wall -o

compile:
	$(CC) $(CFLAGS) $(OUT) $(SRC) $(LIBS)
