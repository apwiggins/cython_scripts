# math_example.pyx
from libc.math cimport sqrt, pow

# Function to modify values using math.h
cdef void compute_math(double* a, double* b):
    a[0] = sqrt(a[0])   # Compute square root
    b[0] = pow(b[0], 2) # Square the value

def main():
    cdef double x = 16.0
    cdef double y = 3.0
    print(f"Before: x={x}, y={y}")

    compute_math(&x, &y)

    print(f"After: x={x}, y={y}")

# Call main when executed as a binary
if __name__ == "__main__":
    main()
