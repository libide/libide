CFLAGS = \
    -Wall \
    -Wextra \
    -pedantic \
    -Ideps

DIR_BIN = bin
DIR_DEP = deps
SRC_DEP = $(wildcard $(DIR_DEP)/*/*.c)
OBJ_DEP = $(SRC_DEP:.c=.o)
DIR_POC = src
SRC_POC = $(wildcard $(DIR_POC)/*.c)
OBJ_POC = $(SRC_POC:.c=.o)
APP_POC = $(DIR_BIN)/poc

default: $(DIR_BIN) $(APP_POC)
	@echo $(SRC_DEP)
	@echo $(OBJ_DEP)

$(DIR_BIN):
	mkdir -p $@

$(APP_POC): $(OBJ_DEP) $(OBJ_POC)
	$(CC) $(LDFLAGS) -o $@ $(OBJ_DEP) $(OBJ_POC)

%.o: %.c
	$(CC) $< -c -o $@ $(CFLAGS)

clean:
	$(foreach c, $(OBJ_DEP), rm -f $(c))
	$(foreach c, $(OBJ_POC), rm -f $(c))
