# Variables

CC=/usr/bin/gcc
PYTHON := /usr/bin/python3
CYTHON := /usr/bin/cython3
PYX_FILES := $(wildcard *.pyx)  # All .pyx files in the directory
C_FILES := $(PYX_FILES:.pyx=.c)  # Convert .pyx to .c
SO_FILES := $(PYX_FILES:.pyx=.so)  # Output shared object files

PYTHON_INCLUDE := $(shell $(PYTHON) -c "from sysconfig import get_paths as gp; print(gp()['include'])")
SOABI := $(shell $(PYTHON) -c "import sysconfig; print(sysconfig.get_config_var('SOABI'))")
CFLAGS := -shared -fPIC -I$(PYTHON_INCLUDE)
LDFLAGS := $(shell $(PYTHON) -c "import sysconfig; print(sysconfig.get_config_var('LIBS'))")

# Default target: Build all .so files
all: $(SO_FILES)

# Rule to generate .c files from .pyx; set language_level for Python/Cython to version 3
%.c: %.pyx
	$(CYTHON) --embed --directive language_level=3 $< -o $@

# Rule to compile .c files into .so shared objects
%.so: %.c
	$(CC) $< -o $@ $(CFLAGS) $(LDFLAGS)

# Clean up all generated files
clean:
	@echo "Cleaning up generated files..."
	rm -f $(C_FILES) $(SO_FILES)
	rm -f *.pyc *.pyo *~  # Remove Python artifacts
	rm -rf build dist *.egg-info  # Remove build-related directories

# Clean up only Python bytecode files
clean-pyc:
	@echo "Cleaning up Python bytecode files..."
	find . -name '*.pyc' -exec rm --force {} +
	find . -name '*.pyo' -exec rm --force {} +
	find . -name '*~' -exec rm --force {} +

# Run the main Python script
run: all
	$(PYTHON) main.py

# Show help message
help:
	@echo "Available targets:"
	@echo "  all         Build all .so files from .pyx files"
	@echo "  clean       Remove all generated files and build artifacts"
	@echo "  clean-pyc   Remove Python bytecode files only"
	@echo "  run         Build and run the main Python script"
	@echo "  help        Show this help message"

.PHONY: all clean clean-pyc run help

