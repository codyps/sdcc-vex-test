TARGET = main.hex

SRC = main.c
SRC += crt0iz.c

CC = sdcc
LD = sdcc
RM = rm -f

#CFDEBUG = -V

LDFLAGS = -Wl,-s,18f8520user.lkr -mpic16 -p18f8520 --no-crt
LDFLAGS += --ivt-loc=0x800
CFLAGS  = $(CFDEBUG) $(LDFLAGS)

OBJ = $(SRC:=.o)
OBJ_ASM = $(SRC:=.asm)
OBJ_LST = $(SRC:=.lst)

TRASH = $(OBJ) $(OBJ_ASM) $(OBJ_LST) $(TARGET:.hex=.cod) $(TARGET:.hex=.lst)

all: $(TARGET) $(TARGET:.hex=.lst2)

$(TARGET): $(OBJ)
	$(LD) $(CFLAGS) $(OBJ)

%.c.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $^

%.lst2 : %.hex
	gpdasm -c -p 18f8520 $^ > $@

clean:
	$(RM) $(TARGET) $(TRASH)

.PHONY: all clean
