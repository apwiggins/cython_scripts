# example.pyx
# cython: language_level=3

# Declare the function as a C function using cdef
cdef void modify_values(int* a, int* b):
    a[0] += 1
    b[0] *= 2

# Define a Python wrapper function
def modify_values_py():
    # Use C arrays to hold values for passing by reference
    cdef int a = 10
    cdef int b = 20
    cdef int[1] a_ref = [a]
    cdef int[1] b_ref = [b]

    # Call the C function
    modify_values(&a_ref[0], &b_ref[0])

    # Return the updated values as Python integers
    return a_ref[0], b_ref[0]

