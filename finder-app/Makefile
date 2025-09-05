
## 1. Compiler selection

### If CROSS_COMPILE is defined on the command line we prepend it to
### the usual gcc name; otherwise we fall back to the native compiler.

CC      := $(if $(CROSS_COMPILE),$(CROSS_COMPILE)gcc,gcc)
CFLAGS  := -Wall -Wextra -O2

## 2. Sources, objects and final binary name

SRC     := writer.c
OBJ 	:= writer.o
TARGET  := writer

## 3. Build

# Default target: build the writer binary
.PHONY: all
all: $(TARGET)

# .o -> target
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

# .c -> .o
$(OBJ): $(SRC)
	$(CC) $(CFLAGS) -c $@ $^

# Removes writer binary and writer.o object file
.PHONY: all
clean:
	rm -f $(TARGET) $(OBJ)
