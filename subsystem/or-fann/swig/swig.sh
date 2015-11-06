#!/bin/bash

swig -cffi -generate-typedef interface.swig 
echo '(in-package #:fann)' > fann-fixed.lisp
cat fann.lisp >> fann-fixed.lisp
mv -f fann-fixed.lisp fann.lisp
