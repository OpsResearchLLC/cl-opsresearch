#!/bin/bash

swig -cffi interface.swig 
echo '(in-package #:gsl)' > gsl-fixed.lisp
cat gsl.lisp >> gsl-fixed.lisp
mv -f gsl-fixed.lisp gsl.lisp
