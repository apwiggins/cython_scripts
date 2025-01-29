# cython: language_level=3

cdef void modify_values(int* a, int* b):
    a[0] += 10
    b[0] += 20

def main():
    cdef int x = 5
    cdef int y = 10
    print("Before: x={}, y={}".format(x, y))  # Python 3-compatible formatting
    modify_values(&x, &y)
    print("After: x={}, y={}".format(x, y))   # Prevents type conversion errors

# Allow execution as a standalone executable
if __name__ == "__main__":
    main()
