 #!/usr/bin/env bash                                                                                                                                                                                               
 
 # compile a cython .pyx file
 # usage: cy ./file (less .pyx suffix)
 
 CC=/usr/bin/gcc                                                                                                                                                                                                   
 PYVERSION=3.7m                                                                                                                                                                                                    
 CYTHON=/usr/local/bin/cython                                                                                                                                                                                      
                                                                                                                                                                                                                   
 $CYTHON -3 --embed $1.pyx                                                                                                                                                                                         
                                                                                                                                                                                                                   
 $CC -Os \                                                                                                                                                                                                         
         -I /usr/include/python$PYVERSION \                                                                                                                                                                        
         -o $1    $1.c \                                                                                                                                                                                           
         -lpython$PYVERSION -lpthread -lm -lutil -ldl
