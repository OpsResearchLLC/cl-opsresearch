#!/bin/bash

swig -cffi -generate-typedef interface.swig 
echo '(in-package #:glp)' > glpk-fixed.lisp
cat glpk.lisp | sed 's/swig-lispify "[gG][lL][pP]_/swig-lispify "/g' >> glpk-fixed.lisp
mv -f glpk-fixed.lisp glpk.lisp
