#!/usr/bin/env python

from setuptools import setup
from setuptools.extension import Extension
from Cython.Distutils import build_ext
from Cython.Build import cythonize

ext_modules = cythonize([
     Extension("mylib",
       sources=["mylib.pyx",
                "mypath/mylib.c"
       ],
       include_dirs=["mypath/"],
       libraries=["xml2"],
       extra_link_args=["-L./usr/lib"]
       )
    ]
)

setup(name="mylib app",
      cmdclass={'build_ext': build_ext},
      ext_modules=ext_modules
)
