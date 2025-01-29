# Example 2

An example with a fully compiled cython to C binary pattern.

# make

```make```

# run

```make run```

Output:
```
make run
cython3 --embed --directive language_level=3 example2.pyx -o example2.c
gcc example2.c -o example2 -fPIC -I/usr/include/python3.10 -L/usr/lib/x86_64-linux-gnu -lpython3.10 -lm -ldl
./example2
Before: x=5, y=10
After: x=15, y=30
```

# clean

```make clean```

# help

```make help```
