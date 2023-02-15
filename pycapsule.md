# PyCapsule example to work with a C function that works with a previously created C ptr to a struct object returned as void

ptr_msgdata = pycapsule.PyCapsule_New(readMsgHeader(c_buf, &c_msgHeader), NULL, NULL)

'''The Cython code creates a Python capsule (similar to a smart pointer in C++)
 to store a pointer to some data. The data being pointed to is obtained by
 calling the C function readMsgHeader and passing it a buffer (c_buf) and a
 pointer to a c_msgHeader structure.
 
 The capsule is created using the PyCapsule_New function from the pycapsule
 module. The first argument is a pointer to the data, the second argument is a
 destructor function that should be called when the capsule is destroyed (NULL
 indicates that no such function is needed), and the third argument is a
 NULL-terminated string identifying the capsule type (not used by the Python
 interpreter, but may be used by the calling code).
 
 Once the capsule is created, it can be passed around between Cython code and
 Python code as a pointer, and the data it contains can be accessed using the
 PyCapsule_GetPointer function in Cython or the PyCapsule_GetPointer function
 in Python.'''
