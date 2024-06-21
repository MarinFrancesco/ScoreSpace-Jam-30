# Makefile for compiling main.c to snake_c.html

# Compiler and flags
EMCC = emcc
CFLAGS = -Wall -std=c99 -D_DEFAULT_SOURCE -Wno-missing-braces -Wunused-result -Os
INCLUDES = -I. -I C:/raylib/raylib/src -I C:/raylib/raylib/src/external
LDFLAGS = -L. -L C:/raylib/raylib/src
EMCC_FLAGS = -s USE_GLFW=3 -s ASYNCIFY -s TOTAL_MEMORY=67108864 -s FORCE_FILESYSTEM=1
SHELL_FILE = --shell-file C:/raylib/raylib/src/shell.html
LIBRARIES = C:/raylib/raylib/src/web/libraylib.a
DEFINES = -DPLATFORM_WEB
EXPORTED_FUNCTIONS = -s 'EXPORTED_FUNCTIONS=["_free","_malloc","_main"]'
EXPORTED_RUNTIME_METHODS = -s EXPORTED_RUNTIME_METHODS=ccall

# Source files and output
SRCS = main.c
OUT = index.html

# Target
all: $(OUT)

$(OUT): $(SRCS)
	$(EMCC) -o $(OUT) $(SRCS) $(CFLAGS) $(INCLUDES) $(LDFLAGS) $(EMCC_FLAGS) $(SHELL_FILE) $(LIBRARIES) $(DEFINES) $(EXPORTED_FUNCTIONS) $(EXPORTED_RUNTIME_METHODS)

clean:
	rm -f $(OUT)

.PHONY: all clean
