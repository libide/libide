CFLAGS	=	-Wall -pedantic
DIRBIN	=	bin

TREE_SITTER_DIR		=	deps/tree-sitter/lib
TREE_SITTER_SRC		=	\
	$(TREE_SITTER_DIR)/src/lib.c \
	$(TREE_SITTER_DIR)/utf8proc/utf8proc.c
TREE_SITTER_OBJ		=	$(TREE_SITTER_SRC:.c=.o)
TREE_SITTER_LIB		=	$(DIRBIN)/libtree-sitter.a
TREE_SITTER_CFLAGS	=	\
	-c \
	-I$(TREE_SITTER_DIR)/include \
	-I$(TREE_SITTER_DIR)/utf8proc

TREE_SITTER_C_DIR		=	deps/tree-sitter-c/src
TREE_SITTER_C_SRC		=	$(TREE_SITTER_C_DIR)/parser.c
TREE_SITTER_C_OBJ		=	$(TREE_SITTER_C_SRC:.c=.o)
TREE_SITTER_C_LIB		=	$(DIRBIN)/libtree-sitter-c.a
TREE_SITTER_C_CFLAGS	=	\
	-c \
	-I$(TREE_SITTER_C_DIR)


all: $(DIRBIN) $(TREE_SITTER_LIB) $(TREE_SITTER_C_LIB)

$(DIRBIN):
	mkdir -p $@

$(TREE_SITTER_LIB): $(TREE_SITTER_OBJ)
	$(AR) ru $@ $^

$(TREE_SITTER_OBJ): CFLAGS = $(TREE_SITTER_CFLAGS)


$(TREE_SITTER_C_LIB): $(TREE_SITTER_C_OBJ)
	$(AR) ru $@ $^

$(TREE_SITTER_C_LIB): CFLAGS = $(TREE_SITTER_C_CFLAGS)

%.o: %.c
	$(CC) $< -c -o $@ $(CFLAGS)

clean:
	$(foreach c, $(TREE_SITTER_OBJ), rm -f $(c))
	$(foreach c, $(TREE_SITTER_C_OBJ), rm -f $(c))
	@rm -f $(TREE_SITTER_LIB)
	@rm -f $(TREE_SITTER_C_LIB)
