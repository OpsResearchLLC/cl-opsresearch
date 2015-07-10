#!/bin/bash

swig -cffi -generate-typedef interface.swig 
echo '(in-package #:glp)' > glpk-fixed.lisp
cat glpk.lisp >> glpk-fixed.lisp
mv -f glpk-fixed.lisp glpk.lisp
