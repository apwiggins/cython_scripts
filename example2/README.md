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
- shared object dependencies
```
ldd ./example2
	linux-vdso.so.1 (0x00007fff311f0000)
	libpython3.10.so.1.0 => /lib/x86_64-linux-gnu/libpython3.10.so.1.0 (0x00007ac42b200000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007ac42ae00000)
	libexpat.so.1 => /lib/x86_64-linux-gnu/libexpat.so.1 (0x00007ac42b8e4000)
	libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007ac42b8c8000)
	libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007ac42b7e1000)
	/lib64/ld-linux-x86-64.so.2 (0x00007ac42b93a000)
```

# clean

```make clean```

# help

```make help```
