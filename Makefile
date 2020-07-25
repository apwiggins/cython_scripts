CC=/usr/bin/gcc
CYTHON=/usr/bin/cython
PYVERSION=2.7
PYPREFIX=/usr
INCLUDES=-I$(PYPREFIX)/include/python$(PYVERSION)
DESTDIR=/usr/local/bin
PYLIB=/usr/local/lib/python$(PYVERSION)/dist-packages

build:
	python setup.py build_ext --inplace

myprog.c: myprog.py
	@$(CYTHON) \
			--embed \
			-o myprog.c \
			myprog.py

myprog: myprog.c
	$(CC)	-Os \
			-I /usr/include/python$(PYVERSION) \
			-o myprog myprog.c \
			-lpython$(PYVERSION) -lpthread -lm -lutil -ldl

all: myprog build

install:
	sudo cp ./myprog $(DESTDIR)
	#sudo cp ./cy_mylib.so $(PYLIB)

clean-pyc:
	find . -name '*.pyc' -exec rm --force {} +
	find . -name '*.pyo' -exec rm --force {} +
	find . -name '*~'	 -exec rm --force {} +

clean:
	@rm --force --recursive build/
	@rm --force --recursive dist/
	@rm --force --recursive *.egg-info
	@rm --force --recursive *.so
	@rm --force --recursive *.c
	@rm myprog

.PHONY: clean-pyc clean

help:
	@echo " all 		Build program and libraries"
	@echo " clean-pyc	Remove python artifacts"
	@echo " clean		Remove build artifacts"
