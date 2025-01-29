# Variables
PYTHON := python3
CYTHON := cython3
PYX_FILES := $(wildcard *.pyx)  # All .pyx files in the directory
C_FILES := $(PYX_FILES:.pyx=.c)  # Convert .pyx to .c
BINARIES := $(PYX_FILES:.pyx=)  # Output binary names

PYTHON_INCLUDE := $(shell $(PYTHON) -c "from sysconfig import get_paths as gp; print(gp()['include'])")
PYTHON_LIB := $(shell $(PYTHON) -c "import sysconfig; print(sysconfig.get_config_var('LIBDIR'))")
PYTHON_LDFLAGS := $(shell $(PYTHON) -c "import sysconfig; print(sysconfig.get_config_var('LIBS'))")
CFLAGS := -fPIC -I$(PYTHON_INCLUDE)
LDFLAGS := -L$(PYTHON_LIB) -lpython$(shell $(PYTHON) -c "import sysconfig; print(sysconfig.get_config_var('VERSION'))") -lm -ldl

# Default target: Build all binaries
all: $(BINARIES)

# Rule to generate .c files from .pyx
%.c: %.pyx
	$(CYTHON) --embed --directive language_level=3 $< -o $@

# Rule to compile .c files into an executable
%: %.c
	gcc $< -o $@ $(CFLAGS) $(LDFLAGS)

# Clean up all generated files
clean:
	rm -f $(C_FILES) $(BINARIES)

# Run the compiled binary
run: all
	./example2

