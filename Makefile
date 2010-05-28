TARGET = main.hex

SRC = main.c
CC = sdcc
LD = sdcc
RM = rm -f

CFDEBUG = -V

LDFLAGS = -Wl,-s,18f8520user.lkr
CFLAGS  = $(CFDEBUG) -mpic16 -p18f8520 $(LDFLAGS) 

OBJ = $(SRC:.c=.o)
OBJ_ASM = $(SRC:.c=.asm)

TRASH = $(OBJ) $(OBJ_ASM) $(TARGET:.hex=.cod)

all: $(TARGET)

$(TARGET):
	$(CC) $(CFLAGS) $(SRC)

clean:
	$(RM) $(TARGET) $(TRASH)

.PHONY: all clean
