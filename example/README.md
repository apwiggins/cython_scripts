# Example

A simple pass by reference example to demonstrate the toolchain.

## Compile

```make```

Output:
```
/usr/bin/cython3 --embed --directive language_level=3 example.pyx -o example.c
/usr/bin/gcc example.c -o example.so -shared -fPIC -I/usr/include/python3.10 -lcrypt -ldl  -lm
rm example.c
```

## Run

```make run```

Output:
```
/usr/bin/python3 main.py
Before: a = 10, b = 20
After: a = 11, b = 40
```

## Cleanup

```make clean```

Output:
```
Cleaning up generated files...
rm -f example.c   example.so  
rm -f *.pyc *.pyo *~  # Remove Python artifacts
rm -rf build dist *.egg-info  # Remove build-related directories
```

NOTE: there's a global sweep of .c files, so adjust this as needed

## Help

```make help```

Output:
```
Available targets:
  all         Build all .so files from .pyx files
  clean       Remove all generated files and build artifacts
  clean-pyc   Remove Python bytecode files only
  run         Build and run the main Python script
  help        Show this help message
```
