# Define the compiler and flags
CC = g++
CFLAGS = -c -std=c++17 -Wall -I"SFML-2.5.1/include"

# Define the linker and flags
LD = g++
LDFLAGS = -L"SFML-2.5.1/lib"

# Define sfml libraries
ifeq ($(DEBUG),1)
    LIBS += -lsfml-audio-d -lsfml-graphics-d -lsfml-network-d -lsfml-system-d -lsfml-window-d
else
    LIBS += -lsfml-audio -lsfml-graphics -lsfml-network -lsfml-system -lsfml-window
endif

# Define the target and source files
TARGET = turtle_jump
SRCS = main.cpp

# Define the object files
OBJS = $(SRCS:.cpp=.o)

# Set the linker subsystem to Windows (no prompt window opens when running executable)
ifeq ($(OS),Windows_NT)
    LDFLAGS += -Wl,--subsystem,windows
endif

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o $(TARGET) $(LIBS)

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

cleano:
	rm -f $(OBJS)
