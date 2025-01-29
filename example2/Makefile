# Variables
PYTHON := python3
CYTHON := cython3
TARGET := example2
PYX_FILE := $(TARGET).pyx
C_FILE := $(TARGET).c
BIN_FILE := $(TARGET)

PYTHON_INCLUDE := $(shell $(PYTHON) -c "from sysconfig import get_paths as gp; print(gp()['include'])")
LDFLAGS := -L/usr/lib/x86_64-linux-gnu -lpython3.10 -lm -ldl

# Default target: Build the binary
all: $(BIN_FILE)

# Compile .pyx to .c
$(C_FILE): $(PYX_FILE)
	$(CYTHON) --embed --directive language_level=3 $< -o $@

# Compile .c to executable
$(BIN_FILE): $(C_FILE)
	gcc $(C_FILE) -o $(BIN_FILE) -fPIC -I$(PYTHON_INCLUDE) $(LDFLAGS)

# Run the compiled binary
run: all
	./$(BIN_FILE)

# Clean generated files
clean:
	rm -f $(C_FILE) $(BIN_FILE)
