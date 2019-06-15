CFLAGS				=	-Wall -pedantic
DIRBIN				=	bin

TREE_SITTER_SRC		=	deps/tree-sitter/lib.c \
						deps/tree-sitter/utf8proc/utf8proc.c
TREE_SITTER_OBJ		=	$(DIRBIN)/tree-sitter.o

TREE_SITTER_C_SRC	=	deps/tree-sitter-c/src/parser.c
TREE_SITTER_C_OBJ	=	$(DIRBIN)/tree-sitter-c.o

MODULES				=	$(TREE_SITTER_OBJ) \
						$(TREE_SITTER_C_OBJ)

